--------------------------------------------------------------------------------
-- Module Name: tb_blinky
--
-- Author: Olivier Pieters
-- Date: 26-09-2018
--
-- Description: This module implements a simple testbench that can be used to 
-- verify the `blinky` component. 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity tb_blinky is
end tb_blinky;

architecture behavioural of tb_blinky is

  -- signal to interaction and verificaion
  signal led_out, led_out_exp : STD_LOGIC_VECTOR(7 downto 0);
  signal sw_in : STD_LOGIC_VECTOR(7 downto 0);

  -- control signals
  signal clk, reset : STD_LOGIC;
  
  -- standard delay period, used for the clock signal
  constant delay : TIME := 50 ns;
  
begin
  -- create the device under test (DUT)
  dut : entity work.blinky(behavioural) 
  port map (
    sw => sw_in,
    led => led_out
  );
     
  -- process that generates reset signal
  process
  begin
    reset <= '1';
    wait for delay;
    reset <= '0';
    wait;
  end process;

  -- process that generates a clock signal
  process(reset,clk)
  begin
    if reset = '1' then
      clk <= '0';
    else
      clk <= not clk after delay / 2;
    end if;
  end process;

  -- process that generates the input signal
  process(clk,reset)
  begin
    if reset = '1' then
      sw_in <= (others => '0');
    elsif rising_edge(clk) then
      sw_in <= sw_in + 1;
    end if;
  end process;

  -- process that generates the expected output
  process(sw_in) 
    variable led_expected_int : STD_LOGIC_VECTOR(7 downto 0);
  begin
    led_expected_int(0) := not(sw_in(0));
    led_expected_int(1) := sw_in(1) and (not(sw_in(2)));
    led_expected_int(3) := sw_in(3) and sw_in(2);
    led_expected_int(2) := led_expected_int(1) or led_expected_int(3);
    led_expected_int(7 downto 4) := sw_in(7 downto 4);

    led_out_exp <= led_expected_int;
  end process;

  -- process that checks output of circuit and TB
  process(clk)
    variable s : LINE;
  begin 
    if rising_edge(clk) then
      if led_out = led_out_exp then
        write (s, string'("LED output matched at ")); 
        write (s, sw_in ); 
        write (s, string'(". Expected: "));
        write (s, led_out_exp); 
        write (s, string'(" Actual: ")); 
        write (s, led_out); 
        writeline (output, s);
      else
        write (s, string'("ERROR LED output mis-matched at ")); 
        write (s, sw_in); 
        write (s, string'(". Expected: ")); 
        write (s, led_out_exp); 
        write (s, string'(" Actual: ")); 
        write (s, led_out); 
        writeline (output, s);
      end if;
    end if;
  end process;
end behavioural;
