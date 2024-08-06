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

        disp0 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
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
            rst : IN STD_LOGIC;
            clk : IN STD_LOGIC;
            en : IN STD_LOGIC;
            q : OUT STD_LOGIC_VECTOR(N DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT bin2bcd IS
        GENERIC (N : POSITIVE := 8);
        PORT (
            clk, reset : IN STD_LOGIC;
            binary_in : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
            bcd0, bcd1, bcd2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
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
    SIGNAL res_bcd : STD_LOGIC_VECTOR(11 DOWNTO 0);

    SIGNAL d_ssd_0, q_ssd_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL d_ssd_1, q_ssd_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL d_ssd_2, q_ssd_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN

    reg_operandos : registrador
    GENERIC MAP(
        N => 7
    )
    PORT MAP(
        d => operandos,
        rst => reset,
        clk => clk,
        en => enable_1,
        q => a
    );
    b <= operandos;

    WITH selecao SELECT
        res <=
        STD_LOGIC_VECTOR(UNSIGNED(a) + UNSIGNED(b)) WHEN "00",
        STD_LOGIC_VECTOR(UNSIGNED(a) - UNSIGNED(b)) WHEN "01",
        STD_LOGIC_VECTOR(UNSIGNED(a) + 1) WHEN "10",
        STD_LOGIC_VECTOR(UNSIGNED(a) - 1) WHEN OTHERS;

    reg_res_inst : registrador
    GENERIC MAP(
        N => 7
    )
    PORT MAP(
        d => res,
        rst => reset,
        clk => clk,
        en => enable_2,
        q => bin
    );

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
        bcd2 => res_bcd(11 DOWNTO 8)
    );

    -- Display unidade

    d_ssd_0 <= "0000" & res_bcd(3 DOWNTO 0);
    reg_ssd0_inst : registrador
    GENERIC MAP(
        N => 7
    )
    PORT MAP(
        d => d_ssd_0,
        rst => reset,
        clk => clk,
        en => enable_2,
        q => q_ssd_0
    );

    bcd2ssd_inst0 : bcd2ssd
    PORT MAP(
        bcd => q_ssd_0(3 DOWNTO 0),
        ssd_out => disp0,
        ac_ccn => '0'
    );

    -- Display dezena

    d_ssd_1 <= "0000" & res_bcd(7 DOWNTO 4);
    reg_ssd1_inst : registrador
    GENERIC MAP(
        N => 7
    )
    PORT MAP(
        d => d_ssd_1,
        rst => reset,
        clk => clk,
        en => enable_2,
        q => q_ssd_1
    );

    bcd2ssd_inst1 : bcd2ssd
    PORT MAP(
        bcd => q_ssd_1(3 DOWNTO 0),
        ssd_out => disp1,
        ac_ccn => '0'
    );

    -- Display centena

    d_ssd_2 <= "0000" & res_bcd(11 DOWNTO 8);
    reg_ssd2_inst : registrador
    GENERIC MAP(
        N => 7
    )
    PORT MAP(
        d => d_ssd_2,
        rst => reset,
        clk => clk,
        en => enable_2,
        q => q_ssd_2
    );

    bcd2ssd_inst2 : bcd2ssd
    PORT MAP(
        bcd => q_ssd_2(3 DOWNTO 0),
        ssd_out => disp2,
        ac_ccn => '0'
    );

END datapath_arch;