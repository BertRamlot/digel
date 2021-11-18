library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment lines below if you need arithmetic operations
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- use IEEE.NUMERIC_STD.ALL;


entity debounce_control is
port(
  clk          : in std_logic;
  reset        : in std_logic;
  btn_in       : in std_logic;
  overflow     : in std_logic;
  underflow    : in std_logic;
  cnt_up       : out std_logic;
  cnt_dwn      : out std_logic;
  btn_pressed  : out std_logic
);
end debounce_control;

architecture Behavioral of debounce_control is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------

-- add code here if necessary
type statecode is (S_NH,S_TH,S_TL,S_NL,S_BTN);
signal state, new_state : statecode;

begin
    -- flipflop
    process(reset, clk)
    begin
        if reset = '1' then
            state <= S_NH;
        elsif rising_edge(clk) then
            state <= new_state;
        end if;
    end process;

    -- toestandfunctie
    process(btn_in, overflow, underflow, state)
    begin
        if overflow = '1' then
            if btn_in = '1' then
                new_state <= S_NL;
            else
                new_state <= S_TL;
            end if;
        elsif underflow = '1' then
            if state = S_TL then
                new_state <= S_BTN;
            elsif state = S_NL then
                new_state <= S_BTN;
            else
                if btn_in = '1' then
                    new_state <= S_TH;
                else
                    new_state <= S_NH; 
                end if;
            end if;
        else
            case state is
            when S_NH =>
                if btn_in = '1' then
                    new_state <= S_TH;
                else
                    new_state <= S_NH; 
                end if;
            when S_TH =>
                if btn_in = '1' then
                    new_state <= S_TH;
                else
                    new_state <= S_NH;                    
                end if;
            when S_NL =>
                if btn_in = '1' then
                    new_state <= S_NL;
                else
                    new_state <= S_TL;
                end if;
            when S_TL =>
                if btn_in = '1' then
                    new_state <= S_NL;
                else
                    new_state <= S_TL;
                end if;
            when S_BTN =>
                new_state <= S_NH;
            end case;
        end if;    
    end process;

    -- uitgangsfunctie Moore
    process(state)
    begin
        case state is
        when S_NH =>
            cnt_up <= '0';
            cnt_dwn <= '0';
            btn_pressed <= '0';
        when S_TH =>
            cnt_up <= '1';
            cnt_dwn <= '0';
            btn_pressed <= '0';
        when S_NL =>
            cnt_up <= '0';
            cnt_dwn <= '0';
            btn_pressed <= '0';
        when S_TL =>
            cnt_up <= '0';
            cnt_dwn <= '1';
            btn_pressed <= '0';
        when S_BTN =>
            cnt_up <= '0';
            cnt_dwn <= '0';
            btn_pressed <= '1';
        end case;
    end process;

end Behavioral;
