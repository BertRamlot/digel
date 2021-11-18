

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity calculator_board is
port(
    clk : in std_logic;
    sw  : in std_logic_vector(0 downto 0);
    btnC: in std_logic;
    btnU: in std_logic;
    btnD: in std_logic;
    btnL: in std_logic;
    btnR: in std_logic;    
    seg  : out std_logic_vector(6 downto 0);
    an   : out std_logic_vector(3 downto 0)
);
end calculator_board;

architecture behavioural of calculator_board is

signal calc_result : std_logic_vector(4 downto 0);
signal calc_sign   : std_logic;
signal segments    : std_logic_vector(27 downto 0);
signal mask        : std_logic_vector(3 downto 0);
signal ctrl        : std_logic_vector(7 downto 0);
signal buttons     : std_logic_vector(4 downto 0);

begin

   CENTRAL: entity work.button_pressed(behavioural)
   port map(
          clk        =>   clk,
          reset      =>   sw(0),
          button_in  =>   btnC,
          button_out =>   buttons(4)
    );

   UP: entity work.button_pressed(behavioural)
   port map(
          clk        =>   clk,
          reset      =>   sw(0),
          button_in  =>   btnU,
          button_out =>   buttons(3)
    );

   DOWN: entity work.button_pressed(behavioural)
   port map(
          clk        =>   clk,
          reset      =>   sw(0),
          button_in  =>   btnD,
          button_out =>   buttons(2)
    );

   LEFT: entity work.button_pressed(behavioural)
   port map(
          clk        =>   clk,
          reset      =>   sw(0),
          button_in  =>   btnL,
          button_out =>   buttons(1)
    );

   RIGHT: entity work.button_pressed(behavioural)
   port map(
          clk        =>   clk,
          reset      =>   sw(0),
          button_in  =>   btnR,
          button_out =>   buttons(0)
    );

   CONTROLLER : entity work.calc_control(behavioural)
	port map(
          clk          => clk,
          reset        => sw(0),
          buttons_in   => buttons,
          control_signals => ctrl
    );
        
   DATAPATH : entity work.data_path(behavioural)
    port map(
          clk       => clk,
          reset     => sw(0),
          control_signals => ctrl,
          data_out  => calc_result,
          sign_out  => calc_sign
    );
    
    -- display_encoder
	ENC : entity work.display_encoder(Behavioral)
	port map(
        data_in       => calc_result,
        sign_in       => calc_sign,
        segments_out  => segments,
        mask_out      => mask
        );

        -- multiple display driver
        DRV : entity work.multiple_display_driver(behavioural)
	port map(
         seg_in   => segments,
         mask_in  => mask,
         clk      => clk,
         reset    => sw(0),
         an_out   => an,
         seg_out  => seg
        );
        
end behavioural;