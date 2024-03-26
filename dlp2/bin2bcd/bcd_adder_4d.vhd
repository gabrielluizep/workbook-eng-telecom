library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity bcd_adder_4d is
    port(
        b0, b1: in std_logic_vector(3 downto 0);
        a0, a1: in std_logic_vector(3 downto 0);
        s0, s1, s2: out std_logic_vector(3 downto 0)
    );
end entity bcd_adder_4d;

architecture bcd_adder_4d of bcd_adder_4d is
    component bcd_adder is
        port(
            cin: in std_logic;
            a, b: in std_logic_vector(3 downto 0);
            s: out std_logic_vector(3 downto 0);
            cout: out std_logic
        );
    end component;

    signal c0, c1: std_logic;
begin
    bcd_adder_0: bcd_adder port map(
        cin => '0',
        a => a0,
        b => b0,
        s => s0,
        cout => c0 
    );

    bcd_adder_1: bcd_adder port map(
        cin => c0,
        a => a1,
        b => b1,
        s => s1,
        cout => c1
    );

    s2 <= "000" & c1;

end architecture bcd_adder_4d;