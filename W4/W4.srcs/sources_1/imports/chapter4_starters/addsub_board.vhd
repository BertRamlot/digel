library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity addsub_board is
    Port ( sw : in STD_LOGIC_VECTOR (4 downto 0);
           led : out STD_LOGIC_VECTOR (3 downto 0)
         );
end addsub_board;

architecture behavioural of addsub_board is

begin

	-- least significant digit
	DUT : entity work.addsub(behavioural)
	generic map ( N => 2)
	port map(
        data_a => sw(3 downto 2),
        data_b => sw(1 downto 0),
        operation => sw(4),
        data_out => led(2 downto 0),
        sign_out => led(3)
        );

end behavioural;
