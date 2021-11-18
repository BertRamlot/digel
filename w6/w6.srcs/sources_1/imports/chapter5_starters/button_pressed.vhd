library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment lines below if you need arithmetic operations
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- use IEEE.NUMERIC_STD.ALL;

entity button_pressed is
port ( 
    clk        : in  STD_LOGIC;
    reset      : in  STD_LOGIC;
    button_in  : in  STD_LOGIC;
    button_out : out STD_LOGIC
);
end button_pressed;

architecture behavioural of button_pressed is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------

-- add code here if necessary
signal overflow : std_logic;
signal underflow : std_logic;
signal cnt_up : std_logic;
signal cnt_dwn : std_logic;
signal state : std_logic_vector(3 downto 0);
signal btn_in_buffer_0 : std_logic;
signal btn_in_buffer_1 : std_logic;

begin

-- add code here      

    CONTROLLER : entity work.debounce_control(Behavioral)
	port map(
        clk => clk,
        reset => reset,
        btn_in => btn_in_buffer_1,
        overflow => overflow,
        underflow => underflow,
        cnt_up => cnt_up,
        cnt_dwn => cnt_dwn,
        btn_pressed => button_out
    ); 
    
    STICKY_CNT : entity work.sticky_counter(Behavioral)
    generic map ( N => 4)
    port map (
        clk => clk,
        reset => reset,
        cnt_up => cnt_up,
        cnt_dwn => cnt_dwn,
        data_out  => state
    );
    
    FF_0 : entity work.reg(behavioural)
    generic map (N => 1)
    port map (
        reset => reset,
        clk => clk,
        enable => '1',
        data_in(0) => button_in,
        data_out(0) => btn_in_buffer_0
    );
    
    FF_1 : entity work.reg(behavioural)
    generic map (N => 1)
    port map (
        reset => reset,
        clk => clk,
        enable => '1',
        data_in(0) => btn_in_buffer_0,
        data_out(0) => btn_in_buffer_1
    );
    
    -- minmax
    process(state)
    begin
        if state = "1111" then
            overflow <= '1';
            underflow <= '0';
        elsif state = "0000" then
            overflow <= '0';
            underflow <= '1';
        else
            overflow <= '0';
            underflow <= '0';
        end if;
    end process;


end behavioural;
