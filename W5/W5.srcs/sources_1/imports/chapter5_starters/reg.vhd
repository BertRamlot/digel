library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg is
generic( N : integer );
port (
    reset    : in STD_LOGIC;
    clk      : in STD_LOGIC;
    enable   : in STD_LOGIC;
    data_in  : in STD_LOGIC_VECTOR(N-1 downto 0);
    data_out : out STD_LOGIC_VECTOR(N-1 downto 0)
);
end reg;

architecture behavioural of reg is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------

-- add code here if necessary

signal internal_value : std_logic_vector(N-1 downto 0);

begin

-- add code here
    
    process(clk, reset)
    begin
        if reset = '1' then
            internal_value <= (others => '0');
        elsif rising_edge(clk) then
            if enable = '1' then
                internal_value <= data_in;
            end if;
        end if;
    end process;
    
    data_out <= internal_value;
end behavioural;
