library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity s1 is
Port ( 
    clk    : in  STD_LOGIC;
    reset  : in  STD_LOGIC;
    enable : in  STD_LOGIC;
    dout   : out STD_LOGIC_VECTOR(3 downto 0)
);
end s1;

architecture Behavioral of s1 is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------

-- add code here if necessary

    type statecode is (IDLE, LOADING);
    signal state, new_state : statecode;

    signal load_in : STD_LOGIC;

begin

-- add code here 

    LFSR : entity work.lfsr(Behavioral)
    port map (
      clk => clk,
      reset => reset, 
      load => load_in,
      data_in => "1111",
      enable => enable,
      data_out => dout
    );
    
    
    -- flipflop
    process(reset, clk)
    begin
        if reset = '1' then
            state <= LOADING;
        elsif rising_edge(clk) then
            state <= new_state;
        end if;
    end process;
    
    -- toestandfunctie
    process(enable, state)
    begin
        case state is
        when IDLE =>
            new_state <= IDLE;
        when LOADING =>
            if enable = '1' then
                new_state <= IDLE;
            else
                new_state <= LOADING;
            end if;
        end case;
    end process;
    
    -- uitgangsfunctie Moore
    process(state)
    begin
        case state is
        when IDLE =>
            load_in <= '0';
        when LOADING =>
            load_in <= '1';
        end case;
    end process;

  
end Behavioral;
