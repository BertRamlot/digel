----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2021 13:26:55
-- Design Name: 
-- Module Name: blinky - behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity blinky is
    Port ( sw : in STD_LOGIC_VECTOR (7 downto 0);
           led : out STD_LOGIC_VECTOR (7 downto 0));
end blinky;

architecture behavioural of blinky is

signal internal_signal1, internal_signal2 : STD_LOGIC;

begin

led(0) <= not(sw(0));
internal_signal1 <= sw(1) and (not sw(2));
internal_signal2 <= sw(3) and sw(4);
led(1) <= internal_signal1;
led(2) <= internal_signal1 or internal_signal2;
led(3) <= internal_signal2;
led(7 downto 4) <= sw(7 downto 4);

end behavioural;
