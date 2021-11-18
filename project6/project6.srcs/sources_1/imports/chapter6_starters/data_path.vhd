library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment lines below if you need arithmetic operations
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- use IEEE.NUMERIC_STD.ALL;

entity data_path is
port ( 
    clk             : in STD_LOGIC;
    reset           : in  STD_LOGIC;
    -- controlesignalen samengenomen in 1 vector
    -- !!! VOLGORDE (links naar rechts):
    -- (cntUp, cntDwn, enable1, enable2, opcode, enable3, select)
    control_signals : in STD_LOGIC_vector(6 downto 0);
    data_out        : out STD_LOGIC_VECTOR(4 downto 0);
    sign_out        : out STD_LOGIC
);
end data_path;

architecture behavioural of data_path is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------

-- add code here if necessary



begin

-- add code here 



end behavioural;
