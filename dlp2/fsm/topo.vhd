LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY topo IS
    PORT (
        CLOCK_50 : IN STD_LOGIC;
        SW : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
        KEY : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        HEX0 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        HEX1 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        LEDR : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );

END ENTITY;

ARCHITECTURE topo_arch OF topo IS
    COMPONENT datapath IS
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
    END COMPONENT;

    COMPONENT fsm IS
        PORT (
            reset : IN STD_LOGIC;
            clk : IN STD_LOGIC;
            enter : IN STD_LOGIC;
            operacao : IN STD_LOGIC_VECTOR (1 DOWNTO 0);

            enable_1 : OUT STD_LOGIC;
            selecao : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
            enable_2 : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL operandos : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL reset : STD_LOGIC;
    SIGNAL enter : STD_LOGIC;
    SIGNAL operacao : STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL enable_1 : STD_LOGIC;
    SIGNAL selecao : STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL enable_2 : STD_LOGIC;

BEGIN
    operandos(7) <= SW(7);
    operandos(6) <= SW(6);
    operandos(5) <= SW(5);
    operandos(4) <= SW(4);
    operandos(3) <= SW(3);
    operandos(2) <= SW(2);
    operandos(1) <= SW(1);
    operandos(0) <= SW(0);

    reset <= NOT KEY(0);
    enter <= KEY(1);

    operacao(1) <= SW(17);
    operacao(0) <= SW(16);

    datapath_inst : datapath PORT MAP(
        operandos => operandos,
        reset => reset,
        clk => CLOCK_50,
        enter => enter,
        enable_1 => enable_1,
        selecao => selecao,
        enable_2 => enable_2,

        disp1 => HEX0,
        disp2 => HEX1,
        bin => LEDR
    );

    fsm_inst : fsm PORT MAP(
        reset => reset,
        clk => CLOCK_50,
        enter => enter,
        operacao => operacao,

        enable_1 => enable_1,
        selecao => selecao,
        enable_2 => enable_2
    );
END topo_arch;