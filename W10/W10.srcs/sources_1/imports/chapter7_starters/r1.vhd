library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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

    type statecode is (LOAD_INIT_S, READY_S, STARTUP_S);
    signal state, new_state : statecode;

    signal load_in : std_logic;
    signal allow_load_in : std_logic;
    signal ready : std_logic;

    signal lfsr_out : std_logic_vector(3 downto 0);
    signal reg_data_out : std_logic_vector(3 downto 0);
    signal reg_enable_out : std_logic;
begin

-- add code here 

    REG_DATA : entity work.reg(behavioural)
    generic map (N=>4)
    port map (
        reset => reset,
        clk => clk,
        enable => enable,
        data_in => din,
        data_out => reg_data_out
    );

    dout <= reg_data_out;
        
    REG_ENABLE : entity work.reg(behavioural)
    generic map (N=>1)
    port map (
        reset => reset,
        clk => clk,
        enable => ready,
        data_in(0) => enable,
        data_out(0) => reg_enable_out
    );

    dout_ready <= reg_enable_out;

    LFSR : entity work.lfsr(Behavioral)
    port map (
      clk => clk,
      reset => reset, 
      load => load_in,
      data_in => "1111",
      enable => enable,
      data_out => lfsr_out
    );
    

    -- ok
    process(reg_enable_out, lfsr_out, reg_data_out)
    begin
        if (reg_enable_out = '1') then
            if (lfsr_out = reg_data_out) then
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
            state <= STARTUP_S;
        elsif rising_edge(clk) then
            state <= new_state;
        end if;
    end process;
    
    -- toestandfunctie
    process(enable, state)
    begin
        case state is
        when STARTUP_S =>
            new_state <= LOAD_INIT_S;
        when LOAD_INIT_S =>
            if enable = '1' then
                new_state <= READY_S;
            else
                new_state <= LOAD_INIT_S;
            end if;
        when READY_S =>
            new_state <= READY_S;
        end case;
    end process;
    
    -- uitgangsfunctie Moore
    process(state)
    begin
        case state is
        when STARTUP_S =>
            ready <= '0';
            load_in <= '0';
        when LOAD_INIT_S =>
            ready <= '1';
            load_in <= '1';
        when READY_S =>
            ready <= '1';
            load_in <= '0';
        end case;
    end process;

end Behavioral;