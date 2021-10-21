library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all; -- require for writing/reading std_logic etc.

entity tb_display_encoder is
end tb_display_encoder;

architecture tb of tb_display_encoder is
    signal sw_dut               : std_logic_vector(7 downto 0);
    signal an_dut, an_desired   : std_logic_vector(3 downto 0);
    signal seg_dut, seg_desired : std_logic_vector(6 downto 0);

    -- buffer for storing the text from input and for output files
    file input_buf : text;  -- text is keyword
 
    -- periode
    constant periode: time :=10 ns;
begin     
  UUT : entity work.display_encoder_board 
  port map (
        sw => sw_dut,
        an => an_dut,
        seg => seg_dut
  );

  tb1 : process
  variable read_col_from_input_buf : line; -- read lines one by one from input_buf
  variable write_col_to_output_buf : line; -- write lines one by one to output_buf

  variable buf_data_from_file : line;  -- buffer for storind the data from input read-file
  variable val_sw : std_logic_vector(7 downto 0);
  variable val_an : std_logic_vector(3 downto 0);
  variable val_seg : std_logic_vector(6 downto 0); 
  variable val_space : character;  -- for commas between data in file
 
  variable good_num : boolean;
  variable s: line;
  variable count: integer := -1;
  begin
   
  -- ####################################################################
   -- Reading data

      -- if modelsim-project is created, then provide the relative path of 
      -- input-file (i.e. read_file_ex.txt) with respect to main project folder
      file_open(input_buf, "display_encoder.mem",  read_mode); 
      -- else provide the complete path for the input file as show below 
      -- file_open(input_buf, "E:/VHDLCodes/input_output_files/read_file_ex.txt",  read_mode); 


      while not endfile(input_buf) loop
        readline(input_buf, read_col_from_input_buf);
        count := count + 1;
        
        read(read_col_from_input_buf, val_sw, good_num);
        assert good_num report "Incorrect file format";
        
        read(read_col_from_input_buf, val_space, good_num);           -- read in the space character
        assert good_num report "Incorrect file format";
        
        read(read_col_from_input_buf, val_an, good_num);  
        assert good_num report "Incorrect file format";

        read(read_col_from_input_buf, val_space, good_num);           -- read in the space character
        assert good_num report "Incorrect file format";
        
        read(read_col_from_input_buf, val_seg, good_num);
        assert good_num report "Incorrect file format";
                
        -- Pass the variable to a signal to allow DUT to use it
        sw_dut <= val_sw;
        an_desired <= val_an;
        seg_desired <= val_seg;

        wait for periode;  --  wait for output

        -- display Error or OK if results are wrong
        write(s,string'("Line number "));
        write(s,count);
        write(s,string'(", test vector "));
        write(s,val_sw);
        write(s,string'(" - "));
            
        if (an_desired = not(an_dut)) then
            write(s,string'("anode match "));
        else
            write(s,string'("anode output ("));
            write(s,not(an_dut));
            write(s,string'(") does not match desired("));
            write(s,an_desired);
            write(s,string'(") "));                            
        end if;
         
        if (seg_desired = not(seg_dut)) then
            write(s,string'("segments match "));
        else
            write(s,string'("segments output ("));
            write(s,not(seg_dut));
            write(s,string'(") does not match desired("));
            write(s,seg_desired);
            write(s,string'(") "));                            
        end if;
        writeline(output,s);
      end loop;

      file_close(input_buf);              
      report "simulation ended"
      severity failure;
  end process;
end tb ; -- tb