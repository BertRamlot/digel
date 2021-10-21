library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Generic( N : integer := 2 );
    Port ( 
        data_in0    : in  STD_LOGIC_VECTOR ( N-1 downto 0 ); -- active if select_data = 0
        data_in1    : in  STD_LOGIC_VECTOR ( N-1 downto 0 ); -- active if select_data = 1
        select_data : in  STD_LOGIC;
        data_out    : out STD_LOGIC_VECTOR ( N-1 downto 0 )
    );
end mux;

architecture behavioural of  mux is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------

-- add code here

begin

    process(data_in0, data_in1, select_data)
    begin
        if select_data = '0' then
            data_out <= data_in0;
        else
            data_out <= data_in1;
        end if;
    end process;

-- add code here

end behavioural;