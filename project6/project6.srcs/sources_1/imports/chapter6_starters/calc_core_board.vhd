

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity calc_core_board is
port(
    clk : in std_logic;
    sw  : in std_logic_vector(5 downto 0);
    led  : out std_logic_vector(5 downto 0)
);
end calc_core_board;

architecture behavioural of calc_core_board is

signal ctrl : std_logic_vector(7 downto 0);

begin

   CONTROLLER : entity work.calc_control(behavioural)
	port map(
          clk          => clk,
          reset        => sw(0),
          buttons_in   => sw(5 downto 1),
          control_signals => ctrl
        );
        
   DATAPATH : entity work.data_path(behavioural)
    port map(
          clk       => clk,
          reset     => sw(0),
          control_signals => ctrl,
          data_out  => led(5 downto 1),
          sign_out  => led(0)
    );
        
end behavioural;