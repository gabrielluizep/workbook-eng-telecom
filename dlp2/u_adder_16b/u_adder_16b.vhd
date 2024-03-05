library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity u_adder_16b is
    port (
        a    : in  std_logic_vector(15 downto 0);
        b    : in  std_logic_vector(15 downto 0);

        s    : out  std_logic_vector(15 downto 0)
    );
end entity;

architecture v1 of u_adder_16b is
begin

    -- s <= std_logic_vector(unsigned(a) + unsigned(b)); -- LE Area: 16

    -- s <= std_logic_vector(unsigned(a) + "0000000000000001"); -- LE Area: 15

    -- s <= std_logic_vector(unsigned(a) + "0000000010000000"); -- LE Area: 8

    -- s <= std_logic_vector(unsigned(a) + "1000000000000000"); -- LE Area: 0

    s <= std_logic_vector(unsigned(a) + "1010101010101010"); -- LE Area: 14
end v1;