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
    btnC        : in STD_LOGIC;                      -- reset
    s_dreq      : in STD_LOGIC;
    s_dav       : out STD_LOGIC;
    r_dreq      : out STD_LOGIC;
    r_dav       : in STD_LOGIC;
    an          : out STD_LOGIC_VECTOR(3 downto 0);  -- dout sender
    sw          : in STD_LOGIC_VECTOR(3 downto 0);   -- din receiver
    led         : out STD_LOGIC_VECTOR(5 downto 0)   -- outputs receiver (dout, dout_ready, ok)
);
end s1r1_board;

architecture Behavioral of s1r1_board is

---------------------------------------
-- Do NOT edit file                  --
---------------------------------------

begin


  S2: entity work.s2(Behavioral)
  port map (
    clk => btnU,
    reset => btnC,
    dout => an,
    dreq  => s_dreq,
    dav => s_dav
  );
  
  R2: entity work.r2(Behavioral)
  port map (
    clk => btnD,
    reset => btnC,
    din => sw,
    dout => led(5 downto 2),
    dout_ready => led(1),
    ok => led(0),
    dreq => r_dreq,
    dav => r_dav
  );

end Behavioral;
