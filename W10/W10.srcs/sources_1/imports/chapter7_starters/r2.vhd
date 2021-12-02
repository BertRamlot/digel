library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity r2 is
Port ( 
    clk        : in  STD_LOGIC;
    reset      : in  STD_LOGIC;
    din        : in  STD_LOGIC_VECTOR(3 downto 0);
    dout       : out STD_LOGIC_VECTOR(3 downto 0);
    dout_ready : out STD_LOGIC;
    ok         : out STD_LOGIC;
    dreq       : out STD_LOGIC; 
    dav        : in  STD_LOGIC
);
end r2;

architecture Behavioral of r2 is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------

-- add code here if necessary



begin


-- add code here 


end Behavioral;