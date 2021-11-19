// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Nov 19 16:27:55 2021
// Host        : DellvanZander running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               {C:/Users/zande/Documents/universiteit/digitale
//               electronica/digel/w6/w6.sim/sim_1/synth/timing/xsim/tb_rom_example_time_synth.v}
// Design      : calc_core_board
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module bcd_counter
   (Q,
    \internal_counter_reg[1]_0 ,
    E,
    CLK,
    AR);
  output [3:0]Q;
  input [0:0]\internal_counter_reg[1]_0 ;
  input [0:0]E;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]E;
  wire [3:0]Q;
  wire \internal_counter[0]_i_1_n_0 ;
  wire \internal_counter[1]_i_1_n_0 ;
  wire \internal_counter[2]_i_1_n_0 ;
  wire \internal_counter[3]_i_2_n_0 ;
  wire [0:0]\internal_counter_reg[1]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \internal_counter[0]_i_1 
       (.I0(Q[0]),
        .O(\internal_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hAA5545A8)) 
    \internal_counter[1]_i_1 
       (.I0(\internal_counter_reg[1]_0 ),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\internal_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hAFF55008)) 
    \internal_counter[2]_i_1 
       (.I0(\internal_counter_reg[1]_0 ),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .O(\internal_counter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h9CCCC8C6)) 
    \internal_counter[3]_i_2 
       (.I0(\internal_counter_reg[1]_0 ),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\internal_counter[3]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \internal_counter_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\internal_counter[0]_i_1_n_0 ),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_counter_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\internal_counter[1]_i_1_n_0 ),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_counter_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\internal_counter[2]_i_1_n_0 ),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_counter_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\internal_counter[3]_i_2_n_0 ),
        .Q(Q[3]));
endmodule

module calc_control
   (E,
    Q,
    \state_reg[1]_0 ,
    ctrl,
    led_OBUF,
    sw_IBUF,
    \led[5] ,
    \led[4] ,
    CLK);
  output [0:0]E;
  output [2:0]Q;
  output \state_reg[1]_0 ;
  output [2:0]ctrl;
  output [5:0]led_OBUF;
  input [5:0]sw_IBUF;
  input [5:0]\led[5] ;
  input [3:0]\led[4] ;
  input CLK;

  wire CLK;
  wire [0:0]E;
  wire [2:0]Q;
  wire [2:0]ctrl;
  wire [3:0]\led[4] ;
  wire [5:0]\led[5] ;
  wire [5:0]led_OBUF;
  wire [3:0]new_state;
  wire [2:2]state;
  wire \state[0]_i_2_n_0 ;
  wire \state[0]_i_3_n_0 ;
  wire \state[1]_i_2_n_0 ;
  wire \state[1]_i_3_n_0 ;
  wire \state[1]_i_4_n_0 ;
  wire \state_reg[1]_0 ;
  wire [5:0]sw_IBUF;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \internal_counter[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[2]),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \internal_value[3]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(state),
        .I3(Q[2]),
        .O(ctrl[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \internal_value[3]_i_1__1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(state),
        .O(ctrl[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hA888)) 
    \internal_value[5]_i_1 
       (.I0(Q[2]),
        .I1(state),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(ctrl[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \internal_value[5]_i_4 
       (.I0(Q[1]),
        .I1(Q[2]),
        .O(\state_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h88808080)) 
    \led_OBUF[0]_inst_i_1 
       (.I0(\led[5] [0]),
        .I1(Q[2]),
        .I2(state),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(led_OBUF[0]));
  LUT6 #(
    .INIT(64'hFFEAAAAA002AAAAA)) 
    \led_OBUF[1]_inst_i_1 
       (.I0(\led[4] [0]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(state),
        .I4(Q[2]),
        .I5(\led[5] [1]),
        .O(led_OBUF[1]));
  LUT6 #(
    .INIT(64'hFFEAAAAA002AAAAA)) 
    \led_OBUF[2]_inst_i_1 
       (.I0(\led[4] [1]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(state),
        .I4(Q[2]),
        .I5(\led[5] [2]),
        .O(led_OBUF[2]));
  LUT6 #(
    .INIT(64'hFFEAAAAA002AAAAA)) 
    \led_OBUF[3]_inst_i_1 
       (.I0(\led[4] [2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(state),
        .I4(Q[2]),
        .I5(\led[5] [3]),
        .O(led_OBUF[3]));
  LUT6 #(
    .INIT(64'hFFEAAAAA002AAAAA)) 
    \led_OBUF[4]_inst_i_1 
       (.I0(\led[4] [3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(state),
        .I4(Q[2]),
        .I5(\led[5] [4]),
        .O(led_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h88808080)) 
    \led_OBUF[5]_inst_i_1 
       (.I0(\led[5] [5]),
        .I1(Q[2]),
        .I2(state),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(led_OBUF[5]));
  LUT5 #(
    .INIT(32'h010001FE)) 
    \state[0]_i_2 
       (.I0(state),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(sw_IBUF[5]),
        .I4(sw_IBUF[4]),
        .O(\state[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBBBA98B8BBBA99B8)) 
    \state[0]_i_3 
       (.I0(sw_IBUF[5]),
        .I1(state),
        .I2(sw_IBUF[2]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(sw_IBUF[1]),
        .O(\state[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAABBBA)) 
    \state[1]_i_1 
       (.I0(\state[1]_i_2_n_0 ),
        .I1(\state[1]_i_3_n_0 ),
        .I2(sw_IBUF[4]),
        .I3(sw_IBUF[3]),
        .I4(sw_IBUF[5]),
        .I5(Q[2]),
        .O(new_state[1]));
  LUT6 #(
    .INIT(64'h000C0C00000E0E0E)) 
    \state[1]_i_2 
       (.I0(sw_IBUF[1]),
        .I1(Q[1]),
        .I2(\state[1]_i_4_n_0 ),
        .I3(sw_IBUF[5]),
        .I4(Q[0]),
        .I5(sw_IBUF[2]),
        .O(\state[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \state[1]_i_3 
       (.I0(state),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\state[1]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \state[1]_i_4 
       (.I0(state),
        .I1(Q[2]),
        .O(\state[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h333344C0)) 
    \state[2]_i_1 
       (.I0(Q[2]),
        .I1(sw_IBUF[5]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(state),
        .O(new_state[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0F70F0F0)) 
    \state[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(state),
        .I4(sw_IBUF[5]),
        .O(new_state[3]));
  FDCE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sw_IBUF[0]),
        .D(new_state[0]),
        .Q(Q[0]));
  MUXF7 \state_reg[0]_i_1 
       (.I0(\state[0]_i_2_n_0 ),
        .I1(\state[0]_i_3_n_0 ),
        .O(new_state[0]),
        .S(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sw_IBUF[0]),
        .D(new_state[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sw_IBUF[0]),
        .D(new_state[2]),
        .Q(state));
  FDCE #(
    .INIT(1'b0)) 
    \state_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sw_IBUF[0]),
        .D(new_state[3]),
        .Q(Q[2]));
endmodule

(* NotValidForBitStream *)
module calc_core_board
   (clk,
    sw,
    led);
  input clk;
  input [5:0]sw;
  output [5:0]led;

  wire CONTROLLER_n_0;
  wire CONTROLLER_n_4;
  wire DATAPATH_n_0;
  wire DATAPATH_n_1;
  wire DATAPATH_n_2;
  wire DATAPATH_n_3;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [4:1]ctrl;
  wire [5:0]internal_value;
  wire [5:0]led;
  wire [5:0]led_OBUF;
  wire [3:0]state;
  wire [5:0]sw;
  wire [5:0]sw_IBUF;

initial begin
 $sdf_annotate("tb_rom_example_time_synth.sdf",,,,"tool_control");
end
  calc_control CONTROLLER
       (.CLK(clk_IBUF_BUFG),
        .E(CONTROLLER_n_0),
        .Q({state[3],state[1:0]}),
        .ctrl({ctrl[4:3],ctrl[1]}),
        .\led[4] ({DATAPATH_n_0,DATAPATH_n_1,DATAPATH_n_2,DATAPATH_n_3}),
        .\led[5] (internal_value),
        .led_OBUF(led_OBUF),
        .\state_reg[1]_0 (CONTROLLER_n_4),
        .sw_IBUF(sw_IBUF));
  data_path DATAPATH
       (.AR(sw_IBUF[0]),
        .CLK(clk_IBUF_BUFG),
        .E(CONTROLLER_n_0),
        .Q({state[3],state[1:0]}),
        .ctrl({ctrl[4:3],ctrl[1]}),
        .\internal_counter_reg[3] ({DATAPATH_n_0,DATAPATH_n_1,DATAPATH_n_2,DATAPATH_n_3}),
        .\internal_value_reg[5] (internal_value),
        .\internal_value_reg[5]_0 (CONTROLLER_n_4));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF \led_OBUF[0]_inst 
       (.I(led_OBUF[0]),
        .O(led[0]));
  OBUF \led_OBUF[1]_inst 
       (.I(led_OBUF[1]),
        .O(led[1]));
  OBUF \led_OBUF[2]_inst 
       (.I(led_OBUF[2]),
        .O(led[2]));
  OBUF \led_OBUF[3]_inst 
       (.I(led_OBUF[3]),
        .O(led[3]));
  OBUF \led_OBUF[4]_inst 
       (.I(led_OBUF[4]),
        .O(led[4]));
  OBUF \led_OBUF[5]_inst 
       (.I(led_OBUF[5]),
        .O(led[5]));
  IBUF \sw_IBUF[0]_inst 
       (.I(sw[0]),
        .O(sw_IBUF[0]));
  IBUF \sw_IBUF[1]_inst 
       (.I(sw[1]),
        .O(sw_IBUF[1]));
  IBUF \sw_IBUF[2]_inst 
       (.I(sw[2]),
        .O(sw_IBUF[2]));
  IBUF \sw_IBUF[3]_inst 
       (.I(sw[3]),
        .O(sw_IBUF[3]));
  IBUF \sw_IBUF[4]_inst 
       (.I(sw[4]),
        .O(sw_IBUF[4]));
  IBUF \sw_IBUF[5]_inst 
       (.I(sw[5]),
        .O(sw_IBUF[5]));
endmodule

module data_path
   (\internal_counter_reg[3] ,
    \internal_value_reg[5] ,
    \internal_value_reg[5]_0 ,
    Q,
    E,
    CLK,
    AR,
    ctrl);
  output [3:0]\internal_counter_reg[3] ;
  output [5:0]\internal_value_reg[5] ;
  input \internal_value_reg[5]_0 ;
  input [2:0]Q;
  input [0:0]E;
  input CLK;
  input [0:0]AR;
  input [2:0]ctrl;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]E;
  wire [2:0]Q;
  wire REG1_n_0;
  wire REG1_n_1;
  wire REG1_n_2;
  wire REG1_n_3;
  wire REG1_n_4;
  wire REG2_n_5;
  wire REG2_n_6;
  wire REG2_n_7;
  wire [2:0]ctrl;
  wire [4:0]data_out;
  wire [3:0]\internal_counter_reg[3] ;
  wire [5:0]\internal_value_reg[5] ;
  wire \internal_value_reg[5]_0 ;
  wire sign;

  bcd_counter BCD_COUNTER
       (.AR(AR),
        .CLK(CLK),
        .E(E),
        .Q(\internal_counter_reg[3] ),
        .\internal_counter_reg[1]_0 (Q[0]));
  \reg  REG1
       (.AR(AR),
        .CLK(CLK),
        .D(data_out[0]),
        .Q({REG1_n_1,REG1_n_2,REG1_n_3,REG1_n_4}),
        .ctrl(ctrl[2]),
        .\internal_value_reg[2]_0 (REG1_n_0),
        .\internal_value_reg[3]_0 (\internal_counter_reg[3] ),
        .\internal_value_reg[4] ({REG2_n_5,REG2_n_6,REG2_n_7}));
  reg_0 REG2
       (.AR(AR),
        .CLK(CLK),
        .D({data_out[4:1],sign}),
        .Q({REG1_n_1,REG1_n_2,REG1_n_3,REG1_n_4}),
        .ctrl(ctrl[1]),
        .\internal_value_reg[2]_0 ({REG2_n_5,REG2_n_6,REG2_n_7}),
        .\internal_value_reg[3]_0 (Q[2:1]),
        .\internal_value_reg[3]_1 (\internal_counter_reg[3] ),
        .\internal_value_reg[4] (REG1_n_0),
        .\internal_value_reg[5] (\internal_value_reg[5]_0 ));
  reg__parameterized0 REG3
       (.AR(AR),
        .CLK(CLK),
        .D({data_out,sign}),
        .ctrl(ctrl[0]),
        .\internal_value_reg[5]_0 (\internal_value_reg[5] ));
endmodule

module \reg 
   (\internal_value_reg[2]_0 ,
    Q,
    D,
    \internal_value_reg[4] ,
    ctrl,
    \internal_value_reg[3]_0 ,
    CLK,
    AR);
  output \internal_value_reg[2]_0 ;
  output [3:0]Q;
  output [0:0]D;
  input [2:0]\internal_value_reg[4] ;
  input [0:0]ctrl;
  input [3:0]\internal_value_reg[3]_0 ;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]D;
  wire [3:0]Q;
  wire [0:0]ctrl;
  wire \internal_value_reg[2]_0 ;
  wire [3:0]\internal_value_reg[3]_0 ;
  wire [2:0]\internal_value_reg[4] ;

  LUT2 #(
    .INIT(4'h6)) 
    \internal_value[1]_i_1 
       (.I0(Q[0]),
        .I1(\internal_value_reg[4] [0]),
        .O(D));
  LUT6 #(
    .INIT(64'hFFEAEAAAAA808000)) 
    \internal_value[4]_i_2 
       (.I0(Q[2]),
        .I1(\internal_value_reg[4] [0]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\internal_value_reg[4] [1]),
        .I5(\internal_value_reg[4] [2]),
        .O(\internal_value_reg[2]_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[0] 
       (.C(CLK),
        .CE(ctrl),
        .CLR(AR),
        .D(\internal_value_reg[3]_0 [0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[1] 
       (.C(CLK),
        .CE(ctrl),
        .CLR(AR),
        .D(\internal_value_reg[3]_0 [1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[2] 
       (.C(CLK),
        .CE(ctrl),
        .CLR(AR),
        .D(\internal_value_reg[3]_0 [2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[3] 
       (.C(CLK),
        .CE(ctrl),
        .CLR(AR),
        .D(\internal_value_reg[3]_0 [3]),
        .Q(Q[3]));
endmodule

(* ORIG_REF_NAME = "reg" *) 
module reg_0
   (D,
    \internal_value_reg[2]_0 ,
    \internal_value_reg[4] ,
    \internal_value_reg[5] ,
    Q,
    \internal_value_reg[3]_0 ,
    ctrl,
    \internal_value_reg[3]_1 ,
    CLK,
    AR);
  output [4:0]D;
  output [2:0]\internal_value_reg[2]_0 ;
  input \internal_value_reg[4] ;
  input \internal_value_reg[5] ;
  input [3:0]Q;
  input [1:0]\internal_value_reg[3]_0 ;
  input [0:0]ctrl;
  input [3:0]\internal_value_reg[3]_1 ;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [4:0]D;
  wire [3:0]Q;
  wire [0:0]ctrl;
  wire \internal_value[0]_i_2_n_0 ;
  wire \internal_value[2]_i_2_n_0 ;
  wire \internal_value[2]_i_3_n_0 ;
  wire \internal_value[2]_i_4_n_0 ;
  wire \internal_value[2]_i_5_n_0 ;
  wire \internal_value[3]_i_2_n_0 ;
  wire \internal_value[3]_i_3_n_0 ;
  wire \internal_value[3]_i_4_n_0 ;
  wire \internal_value[3]_i_5_n_0 ;
  wire \internal_value[4]_i_3_n_0 ;
  wire \internal_value[4]_i_4_n_0 ;
  wire \internal_value[5]_i_3_n_0 ;
  wire [2:0]\internal_value_reg[2]_0 ;
  wire [1:0]\internal_value_reg[3]_0 ;
  wire [3:0]\internal_value_reg[3]_1 ;
  wire \internal_value_reg[4] ;
  wire \internal_value_reg[5] ;
  wire \internal_value_reg_n_0_[3] ;

  LUT6 #(
    .INIT(64'h000000008EFF008E)) 
    \internal_value[0]_i_1 
       (.I0(\internal_value_reg[2]_0 [2]),
        .I1(\internal_value[0]_i_2_n_0 ),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(\internal_value_reg_n_0_[3] ),
        .I5(\internal_value_reg[5] ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h08AE)) 
    \internal_value[0]_i_2 
       (.I0(\internal_value_reg[2]_0 [1]),
        .I1(\internal_value_reg[2]_0 [0]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(\internal_value[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h956AFFFF956A0000)) 
    \internal_value[2]_i_1 
       (.I0(\internal_value_reg[2]_0 [1]),
        .I1(Q[0]),
        .I2(\internal_value_reg[2]_0 [0]),
        .I3(Q[1]),
        .I4(\internal_value_reg[5] ),
        .I5(\internal_value[2]_i_2_n_0 ),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hFCBB3088)) 
    \internal_value[2]_i_2 
       (.I0(\internal_value[2]_i_3_n_0 ),
        .I1(\internal_value_reg_n_0_[3] ),
        .I2(\internal_value[2]_i_4_n_0 ),
        .I3(Q[3]),
        .I4(\internal_value[2]_i_5_n_0 ),
        .O(\internal_value[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h59A6)) 
    \internal_value[2]_i_3 
       (.I0(\internal_value_reg[2]_0 [1]),
        .I1(Q[0]),
        .I2(\internal_value_reg[2]_0 [0]),
        .I3(Q[1]),
        .O(\internal_value[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h59A6)) 
    \internal_value[2]_i_4 
       (.I0(\internal_value_reg[2]_0 [1]),
        .I1(\internal_value_reg[2]_0 [0]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(\internal_value[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0FF042B42D420FF0)) 
    \internal_value[2]_i_5 
       (.I0(\internal_value_reg[2]_0 [2]),
        .I1(Q[2]),
        .I2(\internal_value_reg[2]_0 [1]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\internal_value_reg[2]_0 [0]),
        .O(\internal_value[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFAAEB)) 
    \internal_value[3]_i_1 
       (.I0(\internal_value[3]_i_2_n_0 ),
        .I1(\internal_value_reg_n_0_[3] ),
        .I2(Q[3]),
        .I3(\internal_value[3]_i_3_n_0 ),
        .I4(\internal_value_reg[5] ),
        .I5(\internal_value[3]_i_4_n_0 ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h00009966C33C0000)) 
    \internal_value[3]_i_2 
       (.I0(\internal_value[3]_i_5_n_0 ),
        .I1(\internal_value_reg[2]_0 [2]),
        .I2(\internal_value[0]_i_2_n_0 ),
        .I3(Q[2]),
        .I4(Q[3]),
        .I5(\internal_value_reg_n_0_[3] ),
        .O(\internal_value[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBFBBABAA55D5DDFD)) 
    \internal_value[3]_i_3 
       (.I0(\internal_value_reg[2]_0 [2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\internal_value_reg[2]_0 [0]),
        .I4(\internal_value_reg[2]_0 [1]),
        .I5(Q[2]),
        .O(\internal_value[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h80080880)) 
    \internal_value[3]_i_4 
       (.I0(\internal_value_reg[3]_0 [0]),
        .I1(\internal_value_reg[3]_0 [1]),
        .I2(\internal_value_reg[2]_0 [2]),
        .I3(\internal_value[5]_i_3_n_0 ),
        .I4(Q[2]),
        .O(\internal_value[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h5D04)) 
    \internal_value[3]_i_5 
       (.I0(\internal_value_reg[2]_0 [1]),
        .I1(Q[0]),
        .I2(\internal_value_reg[2]_0 [0]),
        .I3(Q[1]),
        .O(\internal_value[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h8888747444778888)) 
    \internal_value[4]_i_1 
       (.I0(\internal_value_reg[4] ),
        .I1(\internal_value_reg[5] ),
        .I2(\internal_value[4]_i_3_n_0 ),
        .I3(\internal_value[4]_i_4_n_0 ),
        .I4(Q[3]),
        .I5(\internal_value_reg_n_0_[3] ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'h8808AA8AEEAEFFEF)) 
    \internal_value[4]_i_3 
       (.I0(\internal_value_reg[2]_0 [2]),
        .I1(\internal_value_reg[2]_0 [1]),
        .I2(Q[0]),
        .I3(\internal_value_reg[2]_0 [0]),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(\internal_value[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h008088A8AAEAEEFE)) 
    \internal_value[4]_i_4 
       (.I0(\internal_value_reg[2]_0 [2]),
        .I1(\internal_value_reg[2]_0 [1]),
        .I2(\internal_value_reg[2]_0 [0]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(\internal_value[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFF00B200B2000000)) 
    \internal_value[5]_i_2 
       (.I0(Q[2]),
        .I1(\internal_value[5]_i_3_n_0 ),
        .I2(\internal_value_reg[2]_0 [2]),
        .I3(\internal_value_reg[5] ),
        .I4(Q[3]),
        .I5(\internal_value_reg_n_0_[3] ),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h1777)) 
    \internal_value[5]_i_3 
       (.I0(\internal_value_reg[2]_0 [1]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\internal_value_reg[2]_0 [0]),
        .O(\internal_value[5]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[0] 
       (.C(CLK),
        .CE(ctrl),
        .CLR(AR),
        .D(\internal_value_reg[3]_1 [0]),
        .Q(\internal_value_reg[2]_0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[1] 
       (.C(CLK),
        .CE(ctrl),
        .CLR(AR),
        .D(\internal_value_reg[3]_1 [1]),
        .Q(\internal_value_reg[2]_0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[2] 
       (.C(CLK),
        .CE(ctrl),
        .CLR(AR),
        .D(\internal_value_reg[3]_1 [2]),
        .Q(\internal_value_reg[2]_0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[3] 
       (.C(CLK),
        .CE(ctrl),
        .CLR(AR),
        .D(\internal_value_reg[3]_1 [3]),
        .Q(\internal_value_reg_n_0_[3] ));
endmodule

(* ORIG_REF_NAME = "reg" *) 
module reg__parameterized0
   (\internal_value_reg[5]_0 ,
    ctrl,
    D,
    CLK,
    AR);
  output [5:0]\internal_value_reg[5]_0 ;
  input [0:0]ctrl;
  input [5:0]D;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [5:0]D;
  wire [0:0]ctrl;
  wire [5:0]\internal_value_reg[5]_0 ;

  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[0] 
       (.C(CLK),
        .CE(ctrl),
        .CLR(AR),
        .D(D[0]),
        .Q(\internal_value_reg[5]_0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[1] 
       (.C(CLK),
        .CE(ctrl),
        .CLR(AR),
        .D(D[1]),
        .Q(\internal_value_reg[5]_0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[2] 
       (.C(CLK),
        .CE(ctrl),
        .CLR(AR),
        .D(D[2]),
        .Q(\internal_value_reg[5]_0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[3] 
       (.C(CLK),
        .CE(ctrl),
        .CLR(AR),
        .D(D[3]),
        .Q(\internal_value_reg[5]_0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[4] 
       (.C(CLK),
        .CE(ctrl),
        .CLR(AR),
        .D(D[4]),
        .Q(\internal_value_reg[5]_0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[5] 
       (.C(CLK),
        .CE(ctrl),
        .CLR(AR),
        .D(D[5]),
        .Q(\internal_value_reg[5]_0 [5]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
