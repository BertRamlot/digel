library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all; -- require for writing/reading std_logic etc.

entity tb_mux is
end tb_mux;

architecture tb of tb_mux is
    signal data_in0_dut : std_logic_vector(7 downto 0);
    signal data_in1_dut : std_logic_vector(7 downto 0);
    signal select_data_dut : std_logic;
    signal data_out_dut, data_out_desired : std_logic_vector(7 downto 0);
    -- buffer for storing the text from input and for output files
    file input_buf : text;  -- text is keyword
 
    -- periode
    constant periode: time :=10 ns;
begin     
  UUT : entity work.mux
  generic map( N => 8)
  port map (         
        data_in0 => data_in0_dut,
        data_in1 => data_in1_dut,
        select_data => select_data_dut,
        data_out => data_out_dut
  );

  tb1 : process
  variable read_col_from_input_buf : line; -- read lines one by one from input_buf
  variable write_col_to_output_buf : line; -- write lines one by one to output_buf

  variable buf_data_from_file : line;  -- buffer for storind the data from input read-file
  variable val_in0 : std_logic_vector(7 downto 0);
  variable val_in1 : std_logic_vector(7 downto 0);
  variable val_select : std_logic;
  variable val_out : std_logic_vector(7 downto 0);
  variable val_space : character;  -- for commas between data in file
 
  variable good_num : boolean;
  variable s: line;
  variable count: integer := -1;
  begin
   
  -- ####################################################################
   -- Reading data

      -- if modelsim-project is created, then provide the relative path of 
      -- input-file (i.e. read_file_ex.txt) with respect to main project folder
      file_open(input_buf, "mux.mem",  read_mode); 
      -- else provide the complete path for the input file as show below 
      -- file_open(input_buf, "E:/VHDLCodes/input_output_files/read_file_ex.txt",  read_mode); 


      while not endfile(input_buf) loop
        readline(input_buf, read_col_from_input_buf);
        count := count + 1;
        
        read(read_col_from_input_buf, val_in0, good_num);
        assert good_num report "Incorrect file format";
        
        read(read_col_from_input_buf, val_space, good_num);           -- read in the space character
        assert good_num report "Incorrect file format";
        
        read(read_col_from_input_buf, val_in1, good_num);  
        assert good_num report "Incorrect file format";

        read(read_col_from_input_buf, val_space, good_num);           -- read in the space character
        assert good_num report "Incorrect file format";
        
        read(read_col_from_input_buf, val_select, good_num);
        assert good_num report "Incorrect file format";
        
        read(read_col_from_input_buf, val_space, good_num);
        assert good_num report "Incorrect file format";

        read(read_col_from_input_buf, val_out, good_num);
        assert good_num report "Incorrect file format";
        -- Pass the variable to a signal to allow DUT to use it
        data_in0_dut <= val_in0;
        data_in1_dut <= val_in1;
        select_data_dut <= val_select;
        data_out_desired <= val_out;

        wait for periode;  --  wait for output

        -- display Error or OK if results are wrong
        write(s,string'("Line number "));
        write(s,count);
        write(s,string'(", test vector "));
        write(s,data_in0_dut);
        write(s,string'(" "));
        write(s,data_in1_dut);
        write(s,string'(" "));
        write(s,select_data_dut);
        write(s,string'(" - "));
            
        if (data_out_dut = data_out_desired) then
            write(s,string'(" match "));
        else
            write(s,string'(" output ("));
            write(s,data_out_dut);
            write(s,string'(") does not match desired("));
            write(s,data_out_desired);
            write(s,string'(") "));                            
        end if;
        
        writeline(output,s);
      end loop;

      file_close(input_buf);              
      report "simulation ended"
      severity failure;
  end process;
end tb ; -- tb