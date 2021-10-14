library IEEE;
library STD;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;

entity tb_bintobcd is
end tb_bintobcd;

architecture behavioural of tb_bintobcd is

	signal clk,reset,run: std_logic :='0';
	signal data_in: std_logic_vector(4 downto 0);
	signal bcd1_out: std_logic_vector(3 downto 0);
	signal bcd2_out: std_logic_vector(3 downto 0);
	signal Interne_teller: std_logic_vector(4 downto 0);
	constant periode: time :=10 ns;
begin
	-- DUT staat voor 'device under test'
	DUT : entity work.bintobcd(behavioural)
	port map(
	   data_in => data_in,
       bcd1 => bcd1_out,
       bcd2 => bcd2_out
    );
	

	-- hoofdproces
	process
	begin
		run<='0';
		wait for 1* periode;
		run<='1';
		wait for (32+2)*periode;	
		run<='0';
		wait for 1* periode;
        report "simulation ended"
        severity failure;
		-- In dit process gebruik je een 'failure' om de simulatie te laten stoppen: 
		-- het process wordt slechts 1 maal uitgevoerd
	end process;
	
	-- klokgenerator
	-- aangezien er geen klok in ons ontwerp zit
	-- wordt hier een klok gegenereerd om de tijd te laten vooruitgaan
	process(run,clk)  
	begin			 
		if(run='0') then
			clk<='0';
		else
			clk <= not(clk) after periode/2;
		end if;
	end process;	
	
	-- reset generator: altijd zorgen in je testbank voor een resetsignaal 
	-- om alle ingangen op een geldige waarde te initialiseren
	process(run,reset)
	begin
		if(run='0')	then
			reset<='0';	
		elsif rising_edge(run) then			
			reset<='1';
		elsif(reset = '1') then
		    reset <= '0' after 2*periode;  
		end if;
	end process;	
		
	-- tellerproces  
	process(clk,reset) 
	begin	 
		if(reset='1') then 
			Interne_teller <= "00000";
		elsif rising_edge(clk) then
			if Interne_teller="11111" then
				Interne_teller <= "00000";
			else
				Interne_teller <= Interne_teller + "00001";
			end if;
		end if;
	end process;
	
	-- Verbind intern tellersignaal met 4-bit switches
    data_in <= Interne_teller;

end behavioural;
