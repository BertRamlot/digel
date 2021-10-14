library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_encoder is
    Port ( data_in : in STD_LOGIC_VECTOR (4 downto 0);
           sign_in : in STD_LOGIC;
           segments_out : out STD_LOGIC_VECTOR (27 downto 0);
           mask_out : out STD_LOGIC_VECTOR (3 downto 0) 
           );
end display_encoder;

architecture Behavioral of display_encoder is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------

-- add code here

begin      
    
-- add code here





    -- TODO
	QSDQSDQSDA : entity work.bintobcd(behavioural)
	port map(
        data_in       => sw(4 downto 0),
        sign_in       => sw(5),
        segments_out  => segments,
        mask_out      => mask
        );
        
    QSDQSDA : entity work.bintobcd(behavioural)
	port map(
        data_in       => sw(4 downto 0),
        sign_in       => sw(5),
        segments_out  => segments,
        mask_out      => mask
        );

    process(data_in)
    begin
        
    end process;
    -- TODO
    
    
    
    
    

end Behavioral;