`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSIT
// Engineer: James Moore
// 
// Create Date: 03.06.2025 14:56:55
// Design Name: 
// Module Name: RO_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RO_top(
    input wire          EN,
    input wire          CLK,
    input wire [2:0]    challenge_0,
    input wire [2:0]    challenge_1,
    output wire         Response,
    output wire         Done,
    output wire         Busy
    );
    
wire R;
wire [15:0]Counters_0_Counter_0;
wire [15:0]Counters_0_Counter_1;
wire Enable_0_EN_0;
wire Enable_0_EN_1;
wire Enable_0_EN_10;
wire Enable_0_EN_11;
wire Enable_0_EN_12;
wire Enable_0_EN_13;
wire Enable_0_EN_14;
wire Enable_0_EN_15;
wire Enable_0_EN_2;
wire Enable_0_EN_3;
wire Enable_0_EN_4;
wire Enable_0_EN_5;
wire Enable_0_EN_6;
wire Enable_0_EN_7;
wire Enable_0_EN_8;
wire Enable_0_EN_9;
wire EN_CLK;


wire CE;
wire CLR;
wire EN_controller;

wire RO_PUF_0_0_Out;
wire RO_PUF_10_0_Out;
wire RO_PUF_11_0_Out;
wire RO_PUF_12_0_Out;
wire RO_PUF_13_0_Out;
wire RO_PUF_14_0_Out;
wire RO_PUF_15_0_Out;
wire RO_PUF_1_0_Out;
wire RO_PUF_2_0_Out;
wire RO_PUF_3_0_Out;
wire RO_PUF_4_0_Out;
wire RO_PUF_5_0_Out;
wire RO_PUF_6_0_Out;
wire RO_PUF_7_0_Out;
wire RO_PUF_8_0_Out;
wire RO_PUF_9_0_Out;
wire Finished;

wire [15:0] Counter_latch_0_O_0;
wire [15:0] Counter_latch_0_O_1;

wire Enable_0_EN_PUF;

Comparator Comparator_RO
   (.A(Counter_latch_0_O_0),
    .A_is_larger(R),
    .B(Counter_latch_0_O_1));
    
    
Counter_latch_RO Counter_latch_0
   (.A(Counters_0_Counter_0),
    .B(Counters_0_Counter_1),
    .CLK(CLK),
    .EN(EN_controller),
    .Finished(Finished),
    .O_0(Counter_latch_0_O_0),
    .O_1(Counter_latch_0_O_1)
    );
    
Counters Counters_0
   (.CE(CE),
    .CLR(CLR),
    .Counter_0(Counters_0_Counter_0),
    .Counter_1(Counters_0_Counter_1),
    .Challenge_0(challenge_0),
    .Challenge_1(challenge_1),
    .PUF_0(RO_PUF_0_0_Out),
    .PUF_1(RO_PUF_1_0_Out),
    .PUF_2(RO_PUF_2_0_Out),
    .PUF_3(RO_PUF_3_0_Out),
    .PUF_4(RO_PUF_4_0_Out),
    .PUF_5(RO_PUF_5_0_Out),
    .PUF_6(RO_PUF_6_0_Out),
    .PUF_7(RO_PUF_7_0_Out),
    .PUF_8(RO_PUF_8_0_Out),
    .PUF_9(RO_PUF_9_0_Out),
    .PUF_10(RO_PUF_10_0_Out),
    .PUF_11(RO_PUF_11_0_Out),
    .PUF_12(RO_PUF_12_0_Out),
    .PUF_13(RO_PUF_13_0_Out),
    .PUF_14(RO_PUF_14_0_Out),
    .PUF_15(RO_PUF_15_0_Out));
    
Enable_RO Enable_RO_0
   (.EN_0(Enable_0_EN_0),
    .EN_1(Enable_0_EN_1),
    .EN_10(Enable_0_EN_10),
    .EN_11(Enable_0_EN_11),
    .EN_12(Enable_0_EN_12),
    .EN_13(Enable_0_EN_13),
    .EN_14(Enable_0_EN_14),
    .EN_15(Enable_0_EN_15),
    .EN_2(Enable_0_EN_2),
    .EN_3(Enable_0_EN_3),
    .EN_4(Enable_0_EN_4),
    .EN_5(Enable_0_EN_5),
    .EN_6(Enable_0_EN_6),
    .EN_7(Enable_0_EN_7),
    .EN_8(Enable_0_EN_8),
    .EN_9(Enable_0_EN_9),
    .EN_CLK(EN_CLK),
    .Challenge_0(challenge_0),
    .Enable(EN_controller),
    .Challenge_1(challenge_1));
    
PUF_Controller_RO PUF_Controller_RO_0
   (.CE(CE),
    .EN_master(EN),
    .CLK(CLK),
    .CLR(CLR),
    .EN(EN_controller),
    .Response_1(R),
    .Response_master(response),
    .Finished_master(Done),
    .PUF_busy(Busy),
    .finished(Finished));
    
(*RLOC_ORIGIN = "X2Y5", KEEP_HIERARCHY = "YES" *)(*DONT_TOUCH = "true" *)
RO_PUF RO_PUF_0 (
    .En(Enable_0_EN_0),
    .Oscil(RO_PUF_0_0_Out));

(*RLOC_ORIGIN = "X2Y6", KEEP_HIERARCHY = "YES" *)(*DONT_TOUCH = "true" *)
RO_PUF RO_PUF_1 (
    .En(Enable_0_EN_1),
    .Oscil(RO_PUF_1_0_Out));

(*RLOC_ORIGIN = "X2Y7", KEEP_HIERARCHY = "YES" *)(*DONT_TOUCH = "true" *)
RO_PUF RO_PUF_2 (
    .En(Enable_0_EN_2),
    .Oscil(RO_PUF_2_0_Out));

(*RLOC_ORIGIN = "X2Y8", KEEP_HIERARCHY = "YES" *)(*DONT_TOUCH = "true" *)
RO_PUF RO_PUF_3 (
    .En(Enable_0_EN_3),
    .Oscil(RO_PUF_3_0_Out));

(*RLOC_ORIGIN = "X2Y9", KEEP_HIERARCHY = "YES" *)(*DONT_TOUCH = "true" *)
RO_PUF RO_PUF_4 (
    .En(Enable_0_EN_4),
    .Oscil(RO_PUF_4_0_Out));

(*RLOC_ORIGIN = "X2Y10", KEEP_HIERARCHY = "YES" *)(*DONT_TOUCH = "true" *)
RO_PUF RO_PUF_5 (
    .En(Enable_0_EN_5),
    .Oscil(RO_PUF_5_0_Out));

(*RLOC_ORIGIN = "X2Y11", KEEP_HIERARCHY = "YES" *)(*DONT_TOUCH = "true" *)
RO_PUF RO_PUF_6 (
    .En(Enable_0_EN_6),
    .Oscil(RO_PUF_6_0_Out));

(*RLOC_ORIGIN = "X2Y12", KEEP_HIERARCHY = "YES" *)(*DONT_TOUCH = "true" *)
RO_PUF RO_PUF_7 (
    .En(Enable_0_EN_7),
    .Oscil(RO_PUF_7_0_Out));

(*RLOC_ORIGIN = "X2Y13", KEEP_HIERARCHY = "YES" *)(*DONT_TOUCH = "true" *)
RO_PUF RO_PUF_8 (
    .En(Enable_0_EN_8),
    .Oscil(RO_PUF_8_0_Out));

(*RLOC_ORIGIN = "X2Y14", KEEP_HIERARCHY = "YES" *)(*DONT_TOUCH = "true" *)
RO_PUF RO_PUF_9 (
    .En(Enable_0_EN_9),
    .Oscil(RO_PUF_9_0_Out));

(*RLOC_ORIGIN = "X2Y15", KEEP_HIERARCHY = "YES" *)(*DONT_TOUCH = "true" *)
RO_PUF RO_PUF_10 (
    .En(Enable_0_EN_10),
    .Oscil(RO_PUF_10_0_Out));

(*RLOC_ORIGIN = "X2Y16", KEEP_HIERARCHY = "YES" *)(*DONT_TOUCH = "true" *)
RO_PUF RO_PUF_11 (
    .En(Enable_0_EN_11),
    .Oscil(RO_PUF_11_0_Out));

(*RLOC_ORIGIN = "X2Y17", KEEP_HIERARCHY = "YES" *)(*DONT_TOUCH = "true" *)
RO_PUF RO_PUF_12 (
    .En(Enable_0_EN_12),
    .Oscil(RO_PUF_12_0_Out));

(*RLOC_ORIGIN = "X2Y18", KEEP_HIERARCHY = "YES" *)(*DONT_TOUCH = "true" *)
RO_PUF RO_PUF_13 (
    .En(Enable_0_EN_13),
    .Oscil(RO_PUF_13_0_Out));

(*RLOC_ORIGIN = "X2Y19", KEEP_HIERARCHY = "YES" *)(*DONT_TOUCH = "true" *)
RO_PUF RO_PUF_14 (
    .En(Enable_0_EN_14),
    .Oscil(RO_PUF_14_0_Out));

(*RLOC_ORIGIN = "X2Y20", KEEP_HIERARCHY = "YES" *)(*DONT_TOUCH = "true" *)
RO_PUF RO_PUF_15 (
    .En(Enable_0_EN_15),
    .Oscil(RO_PUF_15_0_Out));
    
counter_16_bit counter_16_bit_0
   (.CE(CE),
    .CLK(CLK),
    .CLR(CLR),
    .EN(EN_CLK),
    .finished(Finished));
endmodule
