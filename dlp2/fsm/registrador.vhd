-- register

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY registrador IS
    GENERIC (
        N : INTEGER := 7
    );
    PORT (
        d : IN STD_LOGIC_VECTOR(N DOWNTO 0);
        clk : IN STD_LOGIC;
        en : IN STD_LOGIC;
        q : OUT STD_LOGIC_VECTOR(N DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE registrador_arch OF registrador IS
BEGIN
    PROCESS (clk)
    BEGIN
        IF clk'EVENT AND clk = '1' THEN
            IF en = '1' THEN
                q <= d;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE;