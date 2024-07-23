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
BEGIN
END ARCHITECTURE;