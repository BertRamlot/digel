// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu Dec  9 15:45:03 2021
// Host        : LAPTOP-FM4V0FMP running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/bertr/digel/W10/W10.sim/sim_1/synth/timing/xsim/s1r1_tb_time_synth.v
// Design      : s1r1_board
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module lfsr
   (\internal_value_reg[3] ,
    Q,
    CLK,
    AR,
    state);
  output [3:0]\internal_value_reg[3] ;
  input [1:0]Q;
  input CLK;
  input [0:0]AR;
  input state;

  wire [0:0]AR;
  wire CLK;
  wire [1:0]Q;
  wire [3:0]\internal_value_reg[3] ;
  wire [3:0]mux_out;
  wire state;

  mux MUX
       (.D(mux_out),
        .\internal_value_reg[0] (\internal_value_reg[3] ),
        .state(state));
  \reg  REG
       (.AR(AR),
        .CLK(CLK),
        .D(mux_out),
        .Q(Q),
        .\internal_value_reg[3]_0 (\internal_value_reg[3] ));
endmodule

(* ORIG_REF_NAME = "lfsr" *) 
module lfsr_0
   (led_OBUF,
    Q,
    \led[0] ,
    E,
    CLK,
    AR);
  output [0:0]led_OBUF;
  input [1:0]Q;
  input [3:0]\led[0] ;
  input [0:0]E;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]E;
  wire [1:0]Q;
  wire [3:0]\led[0] ;
  wire [0:0]led_OBUF;

  reg_2 REG
       (.AR(AR),
        .CLK(CLK),
        .E(E),
        .Q(Q),
        .\led[0] (\led[0] ),
        .led_OBUF(led_OBUF));
endmodule

module mux
   (D,
    state,
    \internal_value_reg[0] );
  output [3:0]D;
  input state;
  input [3:0]\internal_value_reg[0] ;

  wire [3:0]D;
  wire [3:0]\internal_value_reg[0] ;
  wire state;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hBE)) 
    \internal_value[0]_i_1 
       (.I0(state),
        .I1(\internal_value_reg[0] [3]),
        .I2(\internal_value_reg[0] [2]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \internal_value[1]_i_1 
       (.I0(state),
        .I1(\internal_value_reg[0] [0]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \internal_value[2]_i_1 
       (.I0(state),
        .I1(\internal_value_reg[0] [1]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \internal_value[3]_i_2 
       (.I0(state),
        .I1(\internal_value_reg[0] [2]),
        .O(D[3]));
endmodule

module r1
   (led_OBUF,
    Q,
    CLK,
    AR,
    D);
  output [5:0]led_OBUF;
  input [1:0]Q;
  input CLK;
  input [0:0]AR;
  input [3:0]D;

  wire [0:0]AR;
  wire CLK;
  wire [3:0]D;
  wire [1:0]Q;
  wire REG_n_0;
  wire [5:0]led_OBUF;
  wire [1:0]new_state;
  wire [1:0]state;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6166)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(new_state[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0600)) 
    \FSM_sequential_state[1]_i_1__0 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(new_state[1]));
  (* FSM_ENCODED_STATES = "loading:00,idle:01,push:10" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(new_state[0]),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "loading:00,idle:01,push:10" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(new_state[1]),
        .Q(state[1]));
  lfsr_0 LFSR
       (.AR(AR),
        .CLK(CLK),
        .E(REG_n_0),
        .Q(state),
        .\led[0] (led_OBUF[5:2]),
        .led_OBUF(led_OBUF[0]));
  reg_1 REG
       (.AR(AR),
        .CLK(CLK),
        .D(D),
        .E(REG_n_0),
        .Q(Q),
        .led_OBUF(led_OBUF[5:2]));
  LUT2 #(
    .INIT(4'h2)) 
    \led_OBUF[1]_inst_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .O(led_OBUF[1]));
endmodule

module r2
   (led_OBUF,
    r_dreq_OBUF,
    CLK,
    AR,
    D,
    r_dav_IBUF);
  output [5:0]led_OBUF;
  output r_dreq_OBUF;
  input CLK;
  input [0:0]AR;
  input [3:0]D;
  input r_dav_IBUF;

  wire [0:0]AR;
  wire CLK;
  wire [3:0]D;
  wire [5:0]led_OBUF;
  wire [1:0]new_state;
  wire r_dav_IBUF;
  wire r_dreq_OBUF;
  wire [1:0]state;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \FSM_sequential_state[0]_i_1__0 
       (.I0(r_dav_IBUF),
        .I1(state[0]),
        .I2(state[1]),
        .O(new_state[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h62)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(r_dav_IBUF),
        .O(new_state[1]));
  (* FSM_ENCODED_STATES = "read:01,wait_dav:10,request:00" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(new_state[0]),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "read:01,wait_dav:10,request:00" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(new_state[1]),
        .Q(state[1]));
  r1 R1
       (.AR(AR),
        .CLK(CLK),
        .D(D),
        .Q(state),
        .led_OBUF(led_OBUF));
  LUT1 #(
    .INIT(2'h1)) 
    r_dreq_OBUF_inst_i_1
       (.I0(state[1]),
        .O(r_dreq_OBUF));
endmodule

module \reg 
   (\internal_value_reg[3]_0 ,
    Q,
    D,
    CLK,
    AR);
  output [3:0]\internal_value_reg[3]_0 ;
  input [1:0]Q;
  input [3:0]D;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [3:0]D;
  wire [1:0]Q;
  wire [3:0]\internal_value_reg[3]_0 ;
  wire s_enable;

  LUT2 #(
    .INIT(4'h8)) 
    \internal_value[3]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(s_enable));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[0] 
       (.C(CLK),
        .CE(s_enable),
        .CLR(AR),
        .D(D[0]),
        .Q(\internal_value_reg[3]_0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[1] 
       (.C(CLK),
        .CE(s_enable),
        .CLR(AR),
        .D(D[1]),
        .Q(\internal_value_reg[3]_0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[2] 
       (.C(CLK),
        .CE(s_enable),
        .CLR(AR),
        .D(D[2]),
        .Q(\internal_value_reg[3]_0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[3] 
       (.C(CLK),
        .CE(s_enable),
        .CLR(AR),
        .D(D[3]),
        .Q(\internal_value_reg[3]_0 [3]));
endmodule

(* ORIG_REF_NAME = "reg" *) 
module reg_1
   (E,
    led_OBUF,
    Q,
    D,
    CLK,
    AR);
  output [0:0]E;
  output [3:0]led_OBUF;
  input [1:0]Q;
  input [3:0]D;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire [3:0]led_OBUF;

  LUT2 #(
    .INIT(4'h2)) 
    \internal_value[3]_i_1__1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(E));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[0]),
        .Q(led_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[1]),
        .Q(led_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[2]),
        .Q(led_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[3]),
        .Q(led_OBUF[3]));
endmodule

(* ORIG_REF_NAME = "reg" *) 
module reg_2
   (led_OBUF,
    Q,
    \led[0] ,
    E,
    CLK,
    AR);
  output [0:0]led_OBUF;
  input [1:0]Q;
  input [3:0]\led[0] ;
  input [0:0]E;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]E;
  wire [1:0]Q;
  wire [3:0]\led[0] ;
  wire [0:0]led_OBUF;
  wire \led_OBUF[0]_inst_i_2_n_0 ;
  wire [3:0]lfsr_out;
  wire [3:0]mux_out;

  LUT6 #(
    .INIT(64'h0000FFFFFFFF0110)) 
    \internal_value[0]_i_1 
       (.I0(lfsr_out[1]),
        .I1(lfsr_out[0]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(lfsr_out[3]),
        .I5(lfsr_out[2]),
        .O(mux_out[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000014)) 
    \internal_value[1]_i_1 
       (.I0(lfsr_out[1]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(lfsr_out[2]),
        .I4(lfsr_out[3]),
        .I5(lfsr_out[0]),
        .O(mux_out[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000014)) 
    \internal_value[2]_i_1 
       (.I0(lfsr_out[0]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(lfsr_out[2]),
        .I4(lfsr_out[3]),
        .I5(lfsr_out[1]),
        .O(mux_out[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000110)) 
    \internal_value[3]_i_1__0 
       (.I0(lfsr_out[1]),
        .I1(lfsr_out[0]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(lfsr_out[3]),
        .I5(lfsr_out[2]),
        .O(mux_out[3]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(mux_out[0]),
        .Q(lfsr_out[0]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(mux_out[1]),
        .Q(lfsr_out[1]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(mux_out[2]),
        .Q(lfsr_out[2]));
  FDCE #(
    .INIT(1'b0)) 
    \internal_value_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(mux_out[3]),
        .Q(lfsr_out[3]));
  LUT5 #(
    .INIT(32'h40000040)) 
    \led_OBUF[0]_inst_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(\led_OBUF[0]_inst_i_2_n_0 ),
        .I3(\led[0] [3]),
        .I4(lfsr_out[3]),
        .O(led_OBUF));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \led_OBUF[0]_inst_i_2 
       (.I0(lfsr_out[0]),
        .I1(\led[0] [0]),
        .I2(\led[0] [2]),
        .I3(lfsr_out[2]),
        .I4(\led[0] [1]),
        .I5(lfsr_out[1]),
        .O(\led_OBUF[0]_inst_i_2_n_0 ));
endmodule

module s1
   (\internal_value_reg[3] ,
    CLK,
    AR,
    Q);
  output [3:0]\internal_value_reg[3] ;
  input CLK;
  input [0:0]AR;
  input [1:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire [1:0]Q;
  wire [3:0]\internal_value_reg[3] ;
  wire state;
  wire state_i_1_n_0;

  lfsr LFSR
       (.AR(AR),
        .CLK(CLK),
        .Q(Q),
        .\internal_value_reg[3] (\internal_value_reg[3] ),
        .state(state));
  LUT3 #(
    .INIT(8'h2A)) 
    state_i_1
       (.I0(state),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(state_i_1_n_0));
  FDPE #(
    .INIT(1'b1)) 
    state_reg
       (.C(CLK),
        .CE(1'b1),
        .D(state_i_1_n_0),
        .PRE(AR),
        .Q(state));
endmodule

(* NotValidForBitStream *)
module s1r1_board
   (btnU,
    btnD,
    btnC,
    s_dreq,
    s_dav,
    r_dreq,
    r_dav,
    an,
    sw,
    led);
  input btnU;
  input btnD;
  input btnC;
  input s_dreq;
  output s_dav;
  output r_dreq;
  input r_dav;
  output [3:0]an;
  input [3:0]sw;
  output [5:0]led;

  wire [3:0]an;
  wire [3:0]an_OBUF;
  wire \an_TRI[0] ;
  wire btnC;
  wire btnC_IBUF;
  wire btnD;
  wire btnD_IBUF;
  wire btnD_IBUF_BUFG;
  wire btnU;
  wire btnU_IBUF;
  wire btnU_IBUF_BUFG;
  wire [5:0]led;
  wire [5:0]led_OBUF;
  wire r_dav;
  wire r_dav_IBUF;
  wire r_dreq;
  wire r_dreq_OBUF;
  wire s_dav;
  wire s_dav_OBUF;
  wire s_dreq;
  wire s_dreq_IBUF;
  wire [3:0]sw;
  wire [3:0]sw_IBUF;

initial begin
 $sdf_annotate("s1r1_tb_time_synth.sdf",,,,"tool_control");
end
  r2 R2
       (.AR(btnC_IBUF),
        .CLK(btnD_IBUF_BUFG),
        .D(sw_IBUF),
        .led_OBUF(led_OBUF),
        .r_dav_IBUF(r_dav_IBUF),
        .r_dreq_OBUF(r_dreq_OBUF));
  s2 S2
       (.AR(btnC_IBUF),
        .CLK(btnU_IBUF_BUFG),
        .Q(an_OBUF),
        .\an_TRI[0] (\an_TRI[0] ),
        .s_dav_OBUF(s_dav_OBUF),
        .s_dreq_IBUF(s_dreq_IBUF));
  OBUFT \an_OBUFT[0]_inst 
       (.I(an_OBUF[0]),
        .O(an[0]),
        .T(\an_TRI[0] ));
  OBUFT \an_OBUFT[1]_inst 
       (.I(an_OBUF[1]),
        .O(an[1]),
        .T(\an_TRI[0] ));
  OBUFT \an_OBUFT[2]_inst 
       (.I(an_OBUF[2]),
        .O(an[2]),
        .T(\an_TRI[0] ));
  OBUFT \an_OBUFT[3]_inst 
       (.I(an_OBUF[3]),
        .O(an[3]),
        .T(\an_TRI[0] ));
  IBUF btnC_IBUF_inst
       (.I(btnC),
        .O(btnC_IBUF));
  BUFG btnD_IBUF_BUFG_inst
       (.I(btnD_IBUF),
        .O(btnD_IBUF_BUFG));
  IBUF btnD_IBUF_inst
       (.I(btnD),
        .O(btnD_IBUF));
  BUFG btnU_IBUF_BUFG_inst
       (.I(btnU_IBUF),
        .O(btnU_IBUF_BUFG));
  IBUF btnU_IBUF_inst
       (.I(btnU),
        .O(btnU_IBUF));
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
  IBUF r_dav_IBUF_inst
       (.I(r_dav),
        .O(r_dav_IBUF));
  OBUF r_dreq_OBUF_inst
       (.I(r_dreq_OBUF),
        .O(r_dreq));
  OBUF s_dav_OBUF_inst
       (.I(s_dav_OBUF),
        .O(s_dav));
  IBUF s_dreq_IBUF_inst
       (.I(s_dreq),
        .O(s_dreq_IBUF));
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
endmodule

module s2
   (s_dav_OBUF,
    \an_TRI[0] ,
    Q,
    CLK,
    AR,
    s_dreq_IBUF);
  output s_dav_OBUF;
  output \an_TRI[0] ;
  output [3:0]Q;
  input CLK;
  input [0:0]AR;
  input s_dreq_IBUF;

  wire [0:0]AR;
  wire CLK;
  wire [3:0]Q;
  wire \an_OBUFT[3]_inst_i_2_n_0 ;
  wire \an_TRI[0] ;
  wire [1:0]new_state;
  wire s_dav_OBUF;
  wire s_dreq_IBUF;
  wire [1:0]state;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(s_dreq_IBUF),
        .I1(state[1]),
        .I2(state[0]),
        .O(new_state[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .O(new_state[1]));
  (* FSM_ENCODED_STATES = "wait_req:00,before_ready:01,ready:10,after_ready:11" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(new_state[0]),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "wait_req:00,before_ready:01,ready:10,after_ready:11" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(new_state[1]),
        .Q(state[1]));
  s1 S1
       (.AR(AR),
        .CLK(CLK),
        .Q(state),
        .\internal_value_reg[3] (Q));
  LUT1 #(
    .INIT(2'h1)) 
    \an_OBUFT[3]_inst_i_1 
       (.I0(\an_OBUFT[3]_inst_i_2_n_0 ),
        .O(\an_TRI[0] ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \an_OBUFT[3]_inst_i_2 
       (.I0(state[0]),
        .I1(state[1]),
        .O(\an_OBUFT[3]_inst_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s_dav_OBUF_inst_i_1
       (.I0(state[1]),
        .I1(state[0]),
        .O(s_dav_OBUF));
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
