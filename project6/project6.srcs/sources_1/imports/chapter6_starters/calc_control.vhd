library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment lines below if you need arithmetic operations
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- use IEEE.NUMERIC_STD.ALL;

entity calc_control is
port ( 
    clk             : in  STD_LOGIC;
    reset           : in  STD_LOGIC;
    -- buttons samengenomen in 1 vector
    -- !!! VOLGORDE ZOALS IN FIGUUR: (C,U,D,L,R)
    buttons_in      : in  STD_LOGIC_VECTOR(4 downto 0);
    -- controlesignalen samengenomen in 1 vector
    -- !!! VOLGORDE (links naar rechts):
    -- (cntUp, cntDwn, enable1, enable2, opcode, enable3, select)
    control_signals : out STD_LOGIC_vector(6 downto 0)
);
end calc_control;

architecture behavioural of calc_control is

---------------------------------------
-- Do NOT edit file above this line! --
---------------------------------------

-- add code here if necessary
type statecode is (IS1,cnt_up1,cnt_dwn1,push_arg1,IS2,cnt_up2,cnt_dwn2,push_arg2,sub,add,push_op_add,push_op_sub);
signal state, new_state : statecode;

begin
    -- flipflop
    process(reset, clk)
    begin
        if reset = '1' then
            state <= IS1;
        elsif rising_edge(clk) then
            state <= new_state;
        end if;
    end process;

    -- toestandfunctie
    process(buttons_in)
    begin
        case state is    
        when IS1 =>
            if buttons_in = "1----" then
                new_state <= push_arg1;
            elsif buttons_in = "01---" then
                new_state <= cnt_up1;
            elsif buttons_in = "0-1--" then
                new_state <= cnt_dwn1;
            else
                new_state <= IS1;
            end if;
        when cnt_up1 =>
            if buttons_in = "1----" then
                new_state <= push_arg1;
            elsif buttons_in = "01---" then
                new_state <= cnt_up1;
            elsif buttons_in = "0-1--" then
                new_state <= cnt_dwn1;
            else
                new_state <= IS1;
            end if;
        when cnt_dwn1 =>
            if buttons_in = "1----" then
                new_state <= push_arg1;
            elsif buttons_in = "01---" then
                new_state <= cnt_up1;
            elsif buttons_in = "0-1--" then
                new_state <= cnt_dwn1;
            else
                new_state <= IS1;
            end if;
        when push_arg1 =>
            if buttons_in = "1----" then
                new_state <= push_arg2;
            elsif buttons_in = "01---" then
                new_state <= cnt_up2;
            elsif buttons_in = "0-1--" then
                new_state <= cnt_dwn2;
            else
                new_state <= IS2;
            end if;
        when IS2 =>
            if buttons_in = "1----" then
                new_state <= push_arg2;
            elsif buttons_in = "01---" then
                new_state <= cnt_up2;
            elsif buttons_in = "0-1--" then
                new_state <= cnt_dwn2;
            else
                new_state <= IS2;
            end if;
        when cnt_up2 =>
            if buttons_in = "1----" then
                new_state <= push_arg2;
            elsif buttons_in = "01---" then
                new_state <= cnt_up2;
            elsif buttons_in = "0-1--" then
                new_state <= cnt_dwn2;
            else
                new_state <= IS2;
            end if;
        when cnt_dwn2 =>
            if buttons_in = "1----" then
                new_state <= push_arg2;
            elsif buttons_in = "01---" then
                new_state <= cnt_up2;
            elsif buttons_in = "0-1--" then
                new_state <= cnt_dwn2;
            else
                new_state <= IS2;
            end if;
        when push_arg2 =>
            if buttons_in = "0--1-" then
                new_state <= sub;
            elsif buttons_in = "0---1" then
                new_state <= add;
            else
                new_state <= push_arg2;
            end if;
        when sub =>
            if buttons_in = "1----" then
                new_state <= push_op_sub;
            elsif buttons_in = "0--1-" then
                new_state <= sub;
            elsif buttons_in = "0---1" then
                new_state <= add;
            else
                new_state <= sub;
            end if;
        when add =>
            if buttons_in = "1----" then
                new_state <= push_op_add;
            elsif buttons_in = "0--1-" then
                new_state <= sub;
            elsif buttons_in = "0---1" then
                new_state <= add;
            else
                new_state <= add;
            end if;
        when push_op_sub =>
            if buttons_in = "1----" then
                new_state <= IS1;
            else
                new_state <= push_op_sub;
            end if;
        when push_op_add =>
            if buttons_in = "1----" then
                new_state <= IS1;
            else
                new_state <= push_op_add;
            end if;
        end case;
    end process;

    -- uitgangsfunctie Moore
    process(state)
    begin
        case state is
        when IS1 =>
            control_signals <= "0000001";
        when cnt_up1 =>
            control_signals <= "1000001";
        when cnt_dwn1 =>
            control_signals <= "0100001";
        when push_arg1 =>
            control_signals <= "0010001";
        when IS2 =>
            control_signals <= "0000001";
        when cnt_up2 =>
            control_signals <= "1000001";
        when cnt_dwn2 =>
            control_signals <= "0100001";
        when push_arg2 =>
            control_signals <= "0001001";
        when sub =>
            control_signals <= "0000101";
        when add =>
            control_signals <= "0000001";
        when push_op_add =>
            control_signals <= "0000110";
        when push_op_sub =>
            control_signals <= "0000011";
        end case;
    end process;


end behavioural;
