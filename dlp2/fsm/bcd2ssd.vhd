LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY bcd2ssd IS
    PORT (
        bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        ssd_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        ac_ccn : IN STD_LOGIC
    );
END ENTITY bcd2ssd;

ARCHITECTURE bcd2ssd_v1 OF bcd2ssd IS

    SIGNAL ssd : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL bcd_int : INTEGER RANGE 0 TO 9;

BEGIN

    ssd_out <= ssd WHEN ac_ccn = '1' ELSE
        NOT ssd;
    bcd_int <= to_integer(unsigned(bcd));

    WITH bcd_int SELECT ssd <=
        "0111111" WHEN 0,
        "0000110" WHEN 1,
        "1011011" WHEN 2,
        "1001111" WHEN 3,
        "1100110" WHEN 4,
        "1101101" WHEN 5,
        "1111101" WHEN 6,
        "0000111" WHEN 7,
        "1111111" WHEN 8,
        "1101111" WHEN 9,
        -- Character "E" when others: 
        "1111001" WHEN OTHERS;

END ARCHITECTURE bcd2ssd_v1;