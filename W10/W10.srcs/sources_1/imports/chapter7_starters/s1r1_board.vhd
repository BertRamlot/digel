library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity s1r1_board is
Port ( 
    btnU        : in STD_LOGIC;                     -- sender clock
    btnD        : in STD_LOGIC;                     -- receiver clock
    btnC       : in STD_LOGIC;                      -- reset
    btnL       : in STD_LOGIC;                      -- enable sender
    an         : out STD_LOGIC_VECTOR(3 downto 0);  -- dout sender
    btnR       : in STD_LOGIC;                      -- enable receiver
    sw         : in STD_LOGIC_VECTOR(3 downto 0);   -- din receiver
    led        : out STD_LOGIC_VECTOR(5 downto 0)   -- outputs receiver (dout, dout_ready, ok)
);
end s1r1_board;

architecture Behavioral of s1r1_board is

---------------------------------------
-- Do NOT edit file                  --
---------------------------------------

begin

  S1: entity work.s1(Behavioral)
  port map (
    clk    => btnU,
    reset  => btnC,
    enable => btnL,
    dout => an
  );
  
  R1: entity work.r1(Behavioral)
  port map (
    clk    => btnD,
    reset  => btnC,
    enable => btnR,
    din => sw,
    dout => led(5 downto 2),
    dout_ready => led(1),
    ok  => led(0)
  );

end Behavioral;
