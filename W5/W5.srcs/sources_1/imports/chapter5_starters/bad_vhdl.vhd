library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bad_vhdl is
Port ( 
        clk       : in STD_LOGIC;
        reset     : in STD_LOGIC;
        enable    : in STD_LOGIC;
        data_in0  : in STD_LOGIC_VECTOR(2 downto 0);
        data_in1  : in STD_LOGIC_VECTOR(2 downto 0);
        data_out  : out STD_LOGIC_VECTOR(2 downto 0)
);
end bad_vhdl;

architecture Behavioral of bad_vhdl is

signal inbetween  : STD_LOGIC_VECTOR(2 downto 0);

begin

BAD_AND: process(data_in0)
begin
    inbetween <= data_in0 and data_in1;
end process;


BAD_FF: process(clk)
begin
if rising_edge(clk) then
  if enable='1' then
    data_out <= inbetween;
  end if;
end if;
end process;


end Behavioral;

