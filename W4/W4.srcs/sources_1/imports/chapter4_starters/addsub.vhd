library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity addsub is
    Generic( N : integer );
    Port ( data_a : in STD_LOGIC_VECTOR (N-1 downto 0);
           data_b : in STD_LOGIC_VECTOR (N-1 downto 0);
           operation : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (N downto 0);
           sign_out : out STD_LOGIC);
end addsub;

architecture behavioural of addsub is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------

-- add code here

begin

-- add code here
    process(data_a, data_b, operation)
    begin
        if operation = '1' then -- som
            data_out <= std_logic_vector(unsigned("0" & data_a) + unsigned("0" & data_b));
            sign_out <= '0';
        else
            if unsigned(data_a) < unsigned(data_b) then
                data_out <= std_logic_vector(unsigned("0" & data_b) - unsigned("0" & data_a));
                sign_out <= '1';            
            else
                data_out <= std_logic_vector(unsigned("0" & data_a) - unsigned("0" & data_b));
                sign_out <= '0';
            end if;
        end if;
    end process;
    
end behavioural;
