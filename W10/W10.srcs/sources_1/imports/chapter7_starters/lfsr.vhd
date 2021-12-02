library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lfsr is
port (
  clk       : in  STD_LOGIC;
  reset     : in  STD_LOGIC; 
  load      : in  STD_LOGIC;
  data_in   : in  STD_LOGIC_VECTOR(3 downto 0);
  enable    : in  STD_LOGIC;
  data_out  : out STD_LOGIC_VECTOR(3 downto 0)
);
end lfsr;

architecture Behavioral of lfsr is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------
    

-- add code here if necessary

    signal mux_out : std_logic_vector(3 downto 0);
    signal reg_out : std_logic_vector(3 downto 0);
    signal lsfr_update_out : std_logic_vector(3 downto 0);
    
    
begin

-- add code here 
    
    data_out <= reg_out;

    REG : entity work.reg(behavioural)
    generic map (N=>4)
    port map (
        reset => reset,
        clk => clk,
        enable => enable,
        data_in => mux_out,
        data_out => reg_out
    );
    
    MUX : entity work.mux(behavioural)
    generic map (N=>4)
    port map (
        data_in0 => lsfr_update_out,
        data_in1 => data_in,
        select_data => load,
        data_out => mux_out
    );


    -- LSFR_UPDATE
    process(reg_out)
    begin
        lsfr_update_out(3) <= reg_out(2);
        lsfr_update_out(2) <= reg_out(1);
        lsfr_update_out(1) <= reg_out(0);
        lsfr_update_out(0) <= reg_out(3) xor reg_out(2);
    end process;


end Behavioral;