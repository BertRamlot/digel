library IEEE;
library STD;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;

entity tb_bcdtoseg is
end tb_bcdtoseg;

architecture behavioural of tb_bcdtoseg is
	
	signal clk,reset,run: std_logic :='0';
	signal bcd_in: std_logic_vector(3 downto 0);
	signal switches: std_logic_vector(15 downto 0);
	signal seg_out: std_logic_vector(6 downto 0);
	signal anodes: std_logic_vector(3 downto 0);
	signal Interne_teller: std_logic_vector(3 downto 0);
	constant periode: time :=10 ns;
begin		  
    switches(3 downto 0) <= bcd_in;
    switches(15 downto 12) <= "1111";
	-- DUT staat voor 'device under test'
	DUT : entity work.bcdtoseg_board(Behavioral)
	port map(
		sw => switches,
		an => anodes,
        seg => seg_out
		);
	
	-- hoofdproces
	process
	begin
		run<='0';
		wait for 1* periode;
		run<='1';
		wait for (16+2)*periode;	
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
			Interne_teller <= "0000";
		elsif rising_edge(clk) then
			if Interne_teller="1111" then
				Interne_teller <= "0000";
			else
				Interne_teller <= Interne_teller + "0001";
			end if;
		end if;
	end process;
	
	-- Verbind intern tellersignaal met 4-bit switches
        bcd_in <= Interne_teller;
     
    -- proces dat controleert
    process(clk,run,reset)
        variable decoded_LED : std_logic_vector(3 downto 0);
        variable s: line;
        variable count: integer := 0;
        variable seg_out_exp : std_logic_vector(6 downto 0);
    begin
        if rising_edge(clk) then
            if(run = '1' and reset = '0') then            
                case bcd_in is
                when "0000" =>
                    seg_out_exp := "0111111";
                when "0001" =>
                    seg_out_exp := "0110000";
                when "0010" =>
                    seg_out_exp := "1011011";
                when "0011" =>
                    seg_out_exp := "1110100";
                when "0100" =>
                    seg_out_exp := "1110100";
                when "0101" =>
                    seg_out_exp := "1101101";
                when "0110" =>
                    seg_out_exp := "1101111";
                when "0111" =>
                    seg_out_exp := "0111000";
                when "1000" =>
                    seg_out_exp := "1111111";
                when "1001" =>
                    seg_out_exp := "1111101";
                when "1111" =>
                    seg_out_exp := "1000000";
                when others =>
                    seg_out_exp := "-------";
                end case;
                seg_out_exp := not(seg_out_exp)
                if seg_out_exp = seg_out then
                    write (s, string'("SEG output matched at ")); 
                    write (s, bcd_in); 
                    write (s, string'(". Expected: "));
                    write (s, seg_out_exp); 
                    write (s, string'(" Actual: ")); 
                    write (s, seg_out); 
                    writeline (output, s);
                else
                    write (s, string'("ERROR SEG output mis-matched at ")); 
                    write (s, bcd_in); 
                    write (s, string'(". Expected: ")); 
                    write (s, seg_out_exp); 
                    write (s, string'(" Actual: ")); 
                    write (s, seg_out); 
                    writeline (output, s);
                end if;
            end if;                
        end if;
    end process;
    
end behavioural;

