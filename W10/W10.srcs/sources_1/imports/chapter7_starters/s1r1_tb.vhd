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
	signal dout_s, din_r, dout: std_logic_vector(3 downto 0);
	signal leds: std_logic_vector(5 downto 0);
	signal dout_ready, ok: std_logic;
	signal s_dreq : STD_LOGIC;
    signal s_dav_pre_channel : STD_LOGIC;
    signal s_dav_post_channel : STD_LOGIC;
    signal r_dreq_pre_channel : STD_LOGIC;
    signal r_dreq_post_channel : STD_LOGIC;
    signal r_dav : STD_LOGIC;
	constant periode1: time := 10  ns; --sender
	constant periode2: time := 12.4163 ns; --receiver
	constant channel_delay_data : time := 1 ns;
	constant channel_delay_dav : time := 1 ns;
	constant channel_delay_dreq : time := 1 ns;
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
        -- dout sender
        an     => dout_s,
    
        -- enable receiver
        -- din receiver
        sw     => din_r,
        -- outputs receiver (dout, dout_ready, ok)
        led    => leds,
        
        s_dreq => s_dreq,
        s_dav => s_dav_pre_channel,
        r_dreq => r_dreq_pre_channel,
        r_dav => r_dav
	);
	
	REG_DAV : entity work.reg(behavioural)
	generic map ( N => 1)
	port map(
	    reset  => reset,
        clk  => clk2,
        enable  => '1',
        data_in(0)  => s_dav_post_channel,
        data_out(0) => r_dav
	);
	
	REG_DREQ : entity work.reg(behavioural)
	generic map ( N => 1)
	port map(
        reset => reset,
        clk => clk1,
        enable  => '1',
        data_in(0)  => r_dreq_post_channel,
        data_out(0) => s_dreq
	);
	
	s_dav_post_channel <= transport s_dav_pre_channel after channel_delay_dav;
    r_dreq_post_channel <= transport r_dreq_pre_channel after channel_delay_dreq;

	din_r(0) <= transport dout_s(0) after channel_delay_data;
	din_r(1) <= transport dout_s(1) after channel_delay_data;
	din_r(2) <= transport dout_s(2) after channel_delay_data;
	din_r(3) <= transport dout_s(3) after channel_delay_data;
	-- din_r(3) <= '1';
	
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