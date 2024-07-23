LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY datapath IS
    PORT (
        operandos : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        enter : IN STD_LOGIC;
        enable_1 : IN STD_LOGIC;
        selecao : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        enable_2 : IN STD_LOGIC;

        disp1 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        disp2 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        bin : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE datapath_arch OF datapath IS
    COMPONENT registrador IS
        GENERIC (
            N : INTEGER := 7
        );
        PORT (
            d : IN STD_LOGIC_VECTOR(N DOWNTO 0);
            clk : IN STD_LOGIC;
            en : IN STD_LOGIC;
            q : OUT STD_LOGIC_VECTOR(N DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT bin2bcd IS
        GENERIC (N : POSITIVE := 16);
        PORT (
            clk, reset : IN STD_LOGIC;
            binary_in : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
            bcd0, bcd1, bcd2, bcd3, bcd4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT bcd2ssd IS
        PORT (
            bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            ssd_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            ac_ccn : IN STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a, b : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL res : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL res_bcd : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

    registrador_operandos : registrador
    GENERIC MAP(
        N => 7
    )
    PORT MAP(
        d => operandos,
        clk => clk,
        en => enable_1,
        q => a
    );
    b <= operandos;

    bin2bcd_inst : bin2bcd
    GENERIC MAP(
        N => 8
    )
    PORT MAP(
        clk => clk,
        reset => reset,
        binary_in => res,
        bcd0 => res_bcd(3 DOWNTO 0),
        bcd1 => res_bcd(7 DOWNTO 4),
        bcd2 => OPEN,
        bcd3 => OPEN,
        bcd4 => OPEN
    );

    WITH selecao SELECT
        res <=
        STD_LOGIC_VECTOR(UNSIGNED(a) + UNSIGNED(b)) WHEN "00",
        STD_LOGIC_VECTOR(UNSIGNED(a) - UNSIGNED(b)) WHEN "01",
        STD_LOGIC_VECTOR(UNSIGNED(a) + 1) WHEN "10",
        STD_LOGIC_VECTOR(UNSIGNED(a) - 1) WHEN OTHERS;

    registrador_resultado : registrador
    GENERIC MAP(
        N => 3
    )
    PORT MAP(
        d => res_bcd,
        clk => clk,
        en => enable_2,
        q => disp1
    );

    bcd2ssd_inst : bcd2ssd

END ARCHITECTURE;