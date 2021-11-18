library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment lines below if you need arithmetic operations
 use IEEE.STD_LOGIC_UNSIGNED.ALL;
 use IEEE.NUMERIC_STD.ALL;

entity bcd_counter is
port ( 
    clk       : in  STD_LOGIC;
    reset     : in  STD_LOGIC;
    cnt_up    : in  STD_LOGIC;
    cnt_dwn   : in  STD_LOGIC;
    data_out  : out STD_LOGIC_VECTOR (3 downto 0)
);
end bcd_counter;

architecture behavioural of bcd_counter is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------

-- add code here if necessary

signal internal_counter : std_logic_vector(3 downto 0);

begin

    data_out <= internal_counter;

-- add code here 
    process(clk, reset)
    begin
        if reset = '1' then
            internal_counter <= "0000";
        elsif rising_edge(clk) then
            if cnt_up = '1' then
                if internal_counter = "1001" then
                    internal_counter <= "0000";
                else
                    internal_counter <= std_logic_vector(unsigned(internal_counter) + 1);
                end if;
            elsif cnt_dwn = '1' then
                if internal_counter = "0000" then
                    internal_counter <= "1001";
                else
                    internal_counter <= std_logic_vector(unsigned(internal_counter) - 1);
                end if;
            end if;
        end if;
    end process;


end behavioural;
