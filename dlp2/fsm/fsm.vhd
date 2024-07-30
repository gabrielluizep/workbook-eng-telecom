LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fsm IS
    PORT (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        enter : IN STD_LOGIC;
        operacao : IN STD_LOGIC_VECTOR (1 DOWNTO 0);

        enable_1 : OUT STD_LOGIC;
        selecao : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
        enable_2 : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE fsm_arch OF fsm IS
    TYPE state IS (idle, operando_1, operando_2, resultado);
    SIGNAL current_state, next_state : state;

BEGIN
    sequential : PROCESS (clk, reset)
        VARIABLE count : INTEGER := 0;
    BEGIN
        IF reset = '1' THEN
            current_state <= idle;
        ELSIF rising_edge(clk) THEN
            current_state <= next_state;
        END IF;
    END PROCESS sequential;

    combinational : PROCESS (operacao, enter, current_state)
    BEGIN

        -- Default values
        enable_1 <= '0';
        enable_2 <= '0';

        -- State machine
        next_state <= current_state;

        CASE current_state IS

            WHEN idle =>
                IF enter = '1' THEN
                    next_state <= operando_1;
                ELSE
                    next_state <= idle;
                END IF;

            WHEN operando_1 =>
                enable_1 <= '1';
                IF enter = '1' THEN
                    next_state <= operando_1;
                ELSE
                    IF operacao(0) = '0' THEN
                        next_state <= operando_2;
                    ELSE
                        next_state <= resultado;
                    END IF;
                END IF;

            WHEN operando_2 =>
                IF enter = '1' THEN
                    next_state <= resultado;
                ELSE
                    next_state <= operando_2;
                END IF;

            WHEN resultado =>
                enable_2 <= '1';
                IF enter = '0' THEN
                    next_state <= idle;
                ELSE
                    next_state <= resultado;
                END IF;

        END CASE;

    END PROCESS combinational;

    selecao <= operacao;

END ARCHITECTURE;