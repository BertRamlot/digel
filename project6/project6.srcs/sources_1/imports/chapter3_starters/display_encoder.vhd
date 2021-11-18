library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

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

signal digit1  : STD_LOGIC_VECTOR(3 downto 0);
signal digit2  : STD_LOGIC_VECTOR(3 downto 0);

begin      
    
-- add code here
	B2B : entity work.bintobcd(behavioural)
	port map(
        data_in => data_in,
        bcd1    => digit1,
        bcd2    => digit2
        );
        
    B2S_DIGIT_1 : entity work.bcdtoseg(waarheidstabel)
	port map(
        data_in       => digit1,
        segments_out  => segments_out(27 downto 21)
        );

    B2S_DIGIT_2 : entity work.bcdtoseg(waarheidstabel)
	port map(
        data_in       => digit2,
        segments_out  => segments_out(20 downto 14)
        );

    B2S_SIGN : entity work.bcdtoseg(waarheidstabel)
	port map(
        data_in(0)    => sign_in,
        data_in(1)    => sign_in,
        data_in(2)    => sign_in,
        data_in(3)    => sign_in,
        segments_out  => segments_out(6 downto 0)
        );
    
    segments_out(13 downto 7) <= "-------";

    process(data_in, sign_in)
    begin
        
        if unsigned(data_in) > 18 then
            mask_out <= "0000";
        else
            mask_out(0) <= sign_in;
            mask_out(1) <= '0';
            if unsigned(data_in) >= 10 then
                mask_out(2) <= '1';
            else
                mask_out(2) <= '0';
            end if;
            mask_out(3) <= '1';
        end if;
        
    end process;    

end Behavioral;