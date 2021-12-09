library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity s2 is
Port ( 
    clk   : in  STD_LOGIC;
    reset : in  STD_LOGIC;
    dout  : out STD_LOGIC_VECTOR(3 downto 0);
    dreq  : in  STD_LOGIC; 
    dav   : out STD_LOGIC
);
end s2;

architecture Behavioral of s2 is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------

-- add code here if necessary
    type statecode is (WAIT_REQ, BEFORE_READY, READY, AFTER_READY);
    signal state, new_state : statecode;

    signal s_enable : STD_LOGIC;
    signal hoge_impedantie : STD_LOGIC;
    signal s_dout : STD_LOGIC_VECTOR(3 downto 0);
begin

-- add code here 
    S1 : entity work.s1(Behavioral)
    port map (
        clk => clk,
        reset => reset,
        enable => s_enable,
        dout => s_dout
    );
    
    
    -- flipflop
    process(reset, clk)
    begin
        if reset = '1' then
            state <= AFTER_READY;
        elsif rising_edge(clk) then
            state <= new_state;
        end if;
    end process;
    
    -- toestandfunctie
    process(dreq, state)
    begin
        case state is
        when WAIT_REQ =>
            if dreq = '0' then
                new_state <= WAIT_REQ;
            else
                new_state <= BEFORE_READY;
            end if;
        when BEFORE_READY =>
            new_state <= READY;
        when READY =>
            if dreq = '0' then
                new_state <= AFTER_READY;
            else
                new_state <= READY;
            end if;
        when AFTER_READY =>
            new_state <= WAIT_REQ;
        end case;
    end process;
    
    
    process(hoge_impedantie, s_dout)
    begin
        if hoge_impedantie = '1' then
            dout <= "ZZZZ";
        else
            dout <= s_dout;
        end if;
    end process;
    
    -- uitgangsfunctie Moore
    process(state)
    begin
        case state is
        when WAIT_REQ =>
            s_enable <= '0';
            dav <= '0';
            hoge_impedantie <= '1';
        when BEFORE_READY =>
            s_enable <= '0';
            dav <= '0';
            hoge_impedantie <= '0';
        when READY =>
            s_enable <= '0';
            dav <= '1';
            hoge_impedantie <= '0';
        when AFTER_READY =>  
            s_enable <= '1';
            dav <= '0';
            hoge_impedantie <= '0';
        end case;
    end process;

  
end Behavioral;
