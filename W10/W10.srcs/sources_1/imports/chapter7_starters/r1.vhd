library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity r1 is
Port ( 
    clk        : in  STD_LOGIC;
    reset      : in  STD_LOGIC;
    enable     : in  STD_LOGIC;
    din        : in  STD_LOGIC_VECTOR(3 downto 0);
    dout       : out STD_LOGIC_VECTOR(3 downto 0);
    dout_ready : out STD_LOGIC;
    ok         : out STD_LOGIC
);
end r1;

architecture Behavioral of r1 is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------

-- add code here if necessary

    type statecode is (IDLE, PUSH, LOADING);
    signal state, new_state : statecode;

    signal load_in : std_logic;
    signal ready : std_logic;
    signal allow_lfsr_enable : std_logic;
    signal lfsr_enable : std_logic;

    signal lfsr_out : std_logic_vector(3 downto 0);
    signal reg_out : std_logic_vector(3 downto 0);
    
begin

-- add code here 
    dout <= reg_out;

    REG : entity work.reg(behavioural)
    generic map (N=>4)
    port map (
        reset => reset,
        clk => clk,
        enable => enable,
        data_in => din,
        data_out => reg_out
    );

    lfsr_enable <= enable and allow_lfsr_enable;

    LFSR : entity work.lfsr(Behavioral)
    port map (
      clk => clk,
      reset => reset, 
      load => load_in,
      data_in => "1111",
      enable => lfsr_enable,
      data_out => lfsr_out
    );

    dout_ready <= ready;

    -- ok
    process(ready, lfsr_out, reg_out)
    begin
        if (ready = '1') then
            if (lfsr_out = reg_out) then
                ok <= '1';
            else
                ok <= '0';
            end if;
        else
            ok <= '0';
        end if;
    end process;
    
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
    process(enable, lfsr_out, reg_out, state)
    begin
        case state is
        when LOADING =>
            if enable = '1' then
                new_state <= IDLE;
            else
                new_state <= LOADING;
            end if;
        when IDLE =>
            if enable = '1' then
                new_state <= PUSH;
            else
                new_state <= IDLE;
            end if;
        when PUSH =>
            if enable = '1' then
                new_state <= PUSH;
            else
                new_state <= IDLE;
            end if;
        end case;
    end process;
    
    -- uitgangsfunctie Moore
    process(state)
    begin
        case state is
        when IDLE =>
            load_in <= '0';
            ready <= '0';
            allow_lfsr_enable <= '1';
        when PUSH =>
            load_in <= '0';
            ready <= '1';
            allow_lfsr_enable <= '1';
        when LOADING =>
            load_in <= '1';
            ready <= '0';
            allow_lfsr_enable <= '0';
        end case;
    end process;

  
    
end Behavioral;