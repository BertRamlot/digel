library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment lines below if you need arithmetic operations
 use IEEE.STD_LOGIC_UNSIGNED.ALL;
 use IEEE.NUMERIC_STD.ALL;

entity sticky_counter is
generic ( N : integer);
port(
    clk       : in  STD_LOGIC;
    reset     : in  STD_LOGIC;
    cnt_up    : in  STD_LOGIC;
    cnt_dwn   : in  STD_LOGIC;
    data_out  : out STD_LOGIC_VECTOR (N-1 downto 0)
);
end sticky_counter;

architecture Behavioral of sticky_counter is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------

-- add code here if necessary
signal internal_counter : std_logic_vector (N-1 downto 0);

constant zeros: std_logic_vector(N-1 downto 0) := (others => '0');
constant ones: std_logic_vector(N-1 downto 0) := (others => '1');

begin
-- add code here 

    data_out <= internal_counter;

    process(clk, reset)
    begin
        if reset = '1' then
            internal_counter <= zeros;
        elsif rising_edge(clk) then
            if cnt_up = '1' then
                if not(internal_counter = ones) then
                    internal_counter <= std_logic_vector(unsigned(internal_counter) + 1);
                end if;
            elsif cnt_dwn = '1' then
                if not(internal_counter = zeros) then
                    internal_counter <= std_logic_vector(unsigned(internal_counter) - 1);
                end if;
            end if;
        end if;
    end process;

end Behavioral;
