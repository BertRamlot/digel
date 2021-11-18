library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment lines below if you need arithmetic operations
 use IEEE.STD_LOGIC_UNSIGNED.ALL;
 use IEEE.NUMERIC_STD.ALL;

entity data_path is
port ( 
    clk             : in STD_LOGIC;
    reset           : in  STD_LOGIC;
    -- controlesignalen samengenomen in 1 vector
    -- !!! VOLGORDE (links naar rechts):
    -- (cntUp, cntDwn, enable1, enable2, opcode, enable3, select)
    control_signals : in STD_LOGIC_vector(6 downto 0);
    data_out        : out STD_LOGIC_VECTOR(4 downto 0);
    sign_out        : out STD_LOGIC
);
end data_path;

architecture behavioural of data_path is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------

-- add code here if necessary
signal num_out : std_logic_vector(3 downto 0);   
signal reg1_out : std_logic_vector(3 downto 0);
signal reg2_out : std_logic_vector(3 downto 0);
signal res : std_logic_vector(4 downto 0);
signal sign : std_logic;
signal reg3_out : std_logic_vector(5 downto 0);
signal num_out_5 :std_logic_vector(4 downto 0);

begin

-- add code here
 
    BCD_COUNTER : entity work.bcd_counter(behavioural)
    port map(
        clk => clk,
        reset => reset,
        cnt_up => control_signals(6),
        cnt_dwn => control_signals(5),
        data_out => num_out
    );
    
    REG1 : entity work.reg(behavioural)
    generic map(N => 4)
    port map(
        clk => clk,
        reset => reset,
        enable => control_signals(4),
        data_in => num_out,
        data_out => reg1_out
    );
    
    REG2 : entity work.reg(behavioural)
    generic map(N => 4)
    port map(
        clk => clk,
        reset => reset,
        enable => control_signals(3),
        data_in => num_out,
        data_out => reg2_out
    );
   
    ADDSUB : entity work.addsub(behavioural)
    generic map(N => 4)
    port map(
        data_a => reg1_out,
        data_b => reg2_out,
        operation => control_signals(2),
        data_out => res,
        sign_out => sign
    );
    
    REG3 : entity work.reg(behavioural)
    generic map(N => 6)
    port map(
        clk => clk,
        reset => reset,
        enable => control_signals(1),
        data_in(5 downto 1) => res,
        data_in(0) => sign,
        data_out => reg3_out
    );
    
    num_out_5 <= "0" & num_out;
    MUX : entity work.mux(behavioural)
    generic map(N => 6)
    port map(
        data_in0 => reg3_out,
        data_in1(5 downto 1) => num_out_5,
        data_in1(0) => '0',
        select_data => control_signals(0),
        data_out(5 downto 1) => data_out,
        data_out(0) => sign_out
    );                         

end behavioural;
