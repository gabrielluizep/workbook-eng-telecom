-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity bin_adder_2d_tb is
end;

architecture bench of bin_adder_2d_tb is

    component bin_adder_2d
        port (
            input1      : in  std_logic_vector(6 downto 0);
            input2      : in  std_logic_vector(6 downto 0);
            ssd_unit    : out std_logic_vector(6 downto 0);
            ssd_decimal : out std_logic_vector(6 downto 0);
            ssd_centena : out std_logic_vector(6 downto 0)
        );
    end component;

    signal input1      : std_logic_vector(6 downto 0);
    signal input2      : std_logic_vector(6 downto 0);
    signal ssd_unit    : std_logic_vector(6 downto 0);
    signal ssd_decimal : std_logic_vector(6 downto 0);
    signal ssd_centena : std_logic_vector(6 downto 0);

begin

    uut : bin_adder_2d port map(
        input1      => input1,
        input2      => input2,
        ssd_unit    => ssd_unit,
        ssd_decimal => ssd_decimal,
        ssd_centena => ssd_centena
    );

    stimulus : process
    begin

        -- TODO: Finalizar

        wait;
    end process;
end;