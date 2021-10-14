library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity bcdtoseg_board is
    Port ( sw : in STD_LOGIC_VECTOR (15 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0)
           );
end bcdtoseg_board;

architecture Behavioral of bcdtoseg_board is

signal segments  : STD_LOGIC_VECTOR(6 downto 0);

begin

    -- instantieer BCD2seg 
    B2S : entity work.bcdtoseg(waarheidstabel)
    port map(
        data_in => sw(3 downto 0),  
        segments_out => segments
        );
    an <= not(sw(15 downto 12));
    seg <= not(segments);
end Behavioral;
