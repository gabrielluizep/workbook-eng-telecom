-- fonte: https://allaboutfpga.com/vhdl-code-for-binary-to-bcd-converter/

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY bin2bcd IS
    GENERIC (N : POSITIVE := 16);
    PORT (
        clk, reset : IN STD_LOGIC;
        binary_in : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
        bcd0, bcd1, bcd2, bcd3, bcd4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END bin2bcd;

ARCHITECTURE behaviour OF bin2bcd IS
    TYPE states IS (start, shift, done);
    SIGNAL state, state_next : states;

    SIGNAL binary, binary_next : STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
    SIGNAL bcds, bcds_reg, bcds_next : STD_LOGIC_VECTOR(19 DOWNTO 0);
    -- output register keep output constant during conversion
    SIGNAL bcds_out_reg, bcds_out_reg_next : STD_LOGIC_VECTOR(19 DOWNTO 0);
    -- need to keep track of shifts
    SIGNAL shift_counter, shift_counter_next : NATURAL RANGE 0 TO N;
BEGIN

    PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN
            binary <= (OTHERS => '0');
            bcds <= (OTHERS => '0');
            state <= start;
            bcds_out_reg <= (OTHERS => '0');
            shift_counter <= 0;
        ELSIF falling_edge(clk) THEN
            binary <= binary_next;
            bcds <= bcds_next;
            state <= state_next;
            bcds_out_reg <= bcds_out_reg_next;
            shift_counter <= shift_counter_next;
        END IF;
    END PROCESS;

    convert :
    PROCESS (state, binary, binary_in, bcds, bcds_reg, shift_counter)
    BEGIN
        state_next <= state;
        bcds_next <= bcds;
        binary_next <= binary;
        shift_counter_next <= shift_counter;

        CASE state IS
            WHEN start =>
                state_next <= shift;
                binary_next <= binary_in;
                bcds_next <= (OTHERS => '0');
                shift_counter_next <= 0;
            WHEN shift =>
                IF shift_counter = N THEN
                    state_next <= done;
                ELSE
                    binary_next <= binary(N - 2 DOWNTO 0) & 'L';
                    bcds_next <= bcds_reg(18 DOWNTO 0) & binary(N - 1);
                    shift_counter_next <= shift_counter + 1;
                END IF;
            WHEN done =>
                state_next <= start;
        END CASE;
    END PROCESS;

    bcds_reg(19 DOWNTO 16) <= bcds(19 DOWNTO 16) + 3 WHEN bcds(19 DOWNTO 16) > 4 ELSE
    bcds(19 DOWNTO 16);
    bcds_reg(15 DOWNTO 12) <= bcds(15 DOWNTO 12) + 3 WHEN bcds(15 DOWNTO 12) > 4 ELSE
    bcds(15 DOWNTO 12);
    bcds_reg(11 DOWNTO 8) <= bcds(11 DOWNTO 8) + 3 WHEN bcds(11 DOWNTO 8) > 4 ELSE
    bcds(11 DOWNTO 8);
    bcds_reg(7 DOWNTO 4) <= bcds(7 DOWNTO 4) + 3 WHEN bcds(7 DOWNTO 4) > 4 ELSE
    bcds(7 DOWNTO 4);
    bcds_reg(3 DOWNTO 0) <= bcds(3 DOWNTO 0) + 3 WHEN bcds(3 DOWNTO 0) > 4 ELSE
    bcds(3 DOWNTO 0);

    bcds_out_reg_next <= bcds WHEN state = done ELSE
        bcds_out_reg;

    bcd4 <= bcds_out_reg(19 DOWNTO 16);
    bcd3 <= bcds_out_reg(15 DOWNTO 12);
    bcd2 <= bcds_out_reg(11 DOWNTO 8);
    bcd1 <= bcds_out_reg(7 DOWNTO 4);
    bcd0 <= bcds_out_reg(3 DOWNTO 0);

END behaviour;