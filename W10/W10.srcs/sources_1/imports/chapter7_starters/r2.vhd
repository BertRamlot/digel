library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity r2 is
Port ( 
    clk        : in  STD_LOGIC;
    reset      : in  STD_LOGIC;
    din        : in  STD_LOGIC_VECTOR(3 downto 0);
    dout       : out STD_LOGIC_VECTOR(3 downto 0);
    dout_ready : out STD_LOGIC;
    ok         : out STD_LOGIC;
    dreq       : out STD_LOGIC; 
    dav        : in  STD_LOGIC
);
end r2;

architecture Behavioral of r2 is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------

-- add code here if necessary
    type statecode is (REQUEST, READ, WAIT_DAV);
    signal state, new_state : statecode;
    
    signal r_enable : std_logic;

begin

-- add code here 
    R1 : entity work.r1(Behavioral)
    port map (
        clk => clk,
        reset => reset,
        enable => r_enable,
        din => din,
        dout => dout,
        dout_ready => dout_ready,
        ok => ok
    );


    -- flipflop
    process(reset, clk)
    begin
        if reset = '1' then
            state <= REQUEST;
        elsif rising_edge(clk) then
            state <= new_state;
        end if;
    end process;
    
    -- toestandfunctie
    process(dav, state)
    begin
        case state is
        when REQUEST =>
            if dav = '0' then
                new_state <= REQUEST;
            else
                new_state <= READ;
            end if;
        when READ =>
            new_state <= WAIT_DAV;
        when WAIT_DAV =>
            if dav = '0' then
                new_state <= REQUEST;
            else
                new_state <= WAIT_DAV;
            end if;
        end case;
    end process;
    
    -- uitgangsfunctie Moore
    process(state)
    begin
        case state is
        when REQUEST =>
            r_enable <= '0';
            dreq <= '1';
        when READ =>
            r_enable <= '1';
            dreq <= '1';
        when WAIT_DAV =>
            r_enable <= '0';
            dreq <= '0';
        end case;
    end process;

end Behavioral;