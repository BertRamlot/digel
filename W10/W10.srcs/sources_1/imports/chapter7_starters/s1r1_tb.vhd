library IEEE;
library STD;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;

entity s1r1_tb is
end s1r1_tb;

architecture behavioural of s1r1_tb is
	
	signal clk1,clk2,reset,run: std_logic :='0';
	signal enable_s, enable_r: std_logic;
	signal dout_s, din_r, dout: std_logic_vector(3 downto 0);
	signal leds: std_logic_vector(5 downto 0);
	signal dout_ready, ok: std_logic;
	constant periode1: time :=10 ns;
	constant periode2: time := 11 ns;
	constant delay1 : time := 1 ns;
	constant delay2 : time := 10 ns;
begin		  
	-- DUT staat voor 'device under test'
	DUT : entity work.s1r1_board(Behavioral)
	port map(
	-- sender clock
	btnU    => clk1,
	-- receiver clock (same as sender clock here, can change to clk2 for different clocks)
    btnD    => clk2,
    -- reset
    btnC   => reset,
    -- enable sender
    btnL   => enable_s,
    -- dout sender
    an     => dout_s,

    -- enable receiver
    btnR   => enable_r,
    -- din receiver
    sw     => din_r,
    -- outputs receiver (dout, dout_ready, ok)
    led    => leds
	);
		
	enable_s <= '1';
	enable_r <= '1';
	din_r(0) <= transport dout_s(0) after delay2;
	din_r(1) <= transport dout_s(1) after delay2;
	din_r(2) <= transport dout_s(2) after delay2;
	--din_r(3) <= '1';
	din_r(3) <= transport dout_s(3) after delay2;
	dout <= leds(5 downto 2);
	dout_ready <= leds(1);
	ok <= leds(0);
	
	
	-- hoofdproces
	process
	begin
		run<='0';
		wait for (periode1+periode2);
		run<='1';
		wait for 50*(periode1+periode2);	
		run<='0';
		wait for (periode1+periode2);
        report "simulation ended"
        severity failure;
		-- In dit process gebruik je een 'failure' om de simulatie te laten stoppen: 
		-- het process wordt slechts 1 maal uitgevoerd
	end process;
	
	-- klokgeneratoren
	process(run,clk1)  
	begin			 
		if(run='0') then
			clk1<='0';
		else
			clk1 <= not(clk1) after periode1/2;
		end if;
	end process;
	
	process(run,clk2)  
	begin			 
		if(run='0') then
			clk2<='0';
		else
			clk2 <= not(clk2) after periode2/2;
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
		    reset <= '0' after 2*(periode1+periode2);  
		end if;
	end process;	
		
    
end behavioural;