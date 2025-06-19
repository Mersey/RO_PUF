`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSIT
// Engineer: James Moore
// 
// Create Date: 07.02.2025 17:04:52
// Design Name: 
// Module Name: Counters
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


module Counters(
    input   wire [2:0]      Challenge_0,
    input   wire [2:0]      Challenge_1,
    input   wire            PUF_0,
    input   wire            PUF_1,
    input   wire            PUF_2,
    input   wire            PUF_3,
    input   wire            PUF_4,
    input   wire            PUF_5,
    input   wire            PUF_6,
    input   wire            PUF_7,
    input   wire            PUF_8,
    input   wire            PUF_9,
    input   wire            PUF_10,
    input   wire            PUF_11,
    input   wire            PUF_12,
    input   wire            PUF_13,
    input   wire            PUF_14,
    input   wire            PUF_15,
    input   wire            CE,
    input   wire            CLR,
    output  wire [15:0]     Counter_0,
    output  wire [15:0]     Counter_1,
    output  wire            Oscillator_0,
    output  wire            Oscillator_1    
    );
    
wire A_0, A_1, A_2;
    
(* BEL = "A6LUT" *)(* LOC = "SLICE_X36Y40" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT6 #(
.INIT(64'hFF00F0F0CCCCAAAA) // Specify LUT Contents
) MUX_0_0 (
   .O(A_0), // 1-bit LUT6 output
   .I0(PUF_0),
   .I1(PUF_1),
   .I2(PUF_2),
   .I3(PUF_3),
   .I4(Challenge_0[0]),
   .I5(Challenge_0[1])
);

(* BEL = "B6LUT" *)(* LOC = "SLICE_X36Y40" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT6 #(
.INIT(64'hFF00F0F0CCCCAAAA) // Specify LUT Contents
) MUX_0_1 (
   .O(A_1), // 1-bit LUT6 output
   .I0(PUF_4),
   .I1(PUF_5),
   .I2(PUF_6),
   .I3(PUF_7),
   .I4(Challenge_0[0]),
   .I5(Challenge_0[1])
);

(* BEL = "C6LUT" *)(* LOC = "SLICE_X36Y40" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT3 #(
.INIT(64'hCA) // Specify LUT Contents
) MUX_0_2 (
   .O(A_2), // 1-bit LUT6 output
   .I0(A_0),
   .I1(A_1),
   .I2(Challenge_0[2])
);

wire B_0, B_1, B_2;
    
(* BEL = "A6LUT" *)(* LOC = "SLICE_X37Y40" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT6 #(
.INIT(64'hFF00F0F0CCCCAAAA) // Specify LUT Contents
) MUX_1_0 (
   .O(B_0), // 1-bit LUT6 output
   .I0(PUF_8),
   .I1(PUF_9),
   .I2(PUF_10),
   .I3(PUF_11),
   .I4(Challenge_1[0]),
   .I5(Challenge_1[1])
);

(* BEL = "B6LUT" *)(* LOC = "SLICE_X37Y40" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT6 #(
.INIT(64'hFF00F0F0CCCCAAAA) // Specify LUT Contents
) MUX_1_1 (
   .O(B_1), // 1-bit LUT6 output
   .I0(PUF_12),
   .I1(PUF_13),
   .I2(PUF_14),
   .I3(PUF_15),
   .I4(Challenge_1[0]),
   .I5(Challenge_1[1])
);

(* BEL = "C6LUT" *)(* LOC = "SLICE_X37Y40" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT3 #(
.INIT(64'hCA) // Specify LUT Contents
) MUX_1_2 (
   .O(B_2), // 1-bit LUT6 output
   .I0(B_0),
   .I1(B_1),
   .I2(Challenge_1[2])
);


assign Oscillator_0 = A_2;
assign Oscillator_1 = B_2;


/// Counters


/////////////////////////////////////////// COUNTER  0  //////////////////////////////////////////////////////////////////////////////////


(* BEL = "CFF" *)(* LOC = "SLICE_X18Y12" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_0 (
  .Q(Q_0),     
  .C(A_2),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_0_1)       
);

(* BEL = "C6LUT" *)(* LOC = "SLICE_X18Y12" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_0_inver (
   .O(Q_0_1),
   .I0(Q_0)
);

 (* BEL = "CFF" *)(* LOC = "SLICE_X18Y13" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_1 (
  .Q(Q_1),      
  .C(Q_0_1),     
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_1_1)      
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X18Y13" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_1_inver (
   .O(Q_1_1), 
   .I0(Q_1)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X18Y14" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_2 (
  .Q(Q_2),     
  .C(Q_1_1),      
  .CE(CE),   
  .CLR(CLR),  
  .D(Q_2_1)      
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X18Y14" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_2_inver (
   .O(Q_2_1), 
   .I0(Q_2)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X18Y15" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_3 (
  .Q(Q_3),     
  .C(Q_2_1),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_3_1)      
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X18Y15" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_3_inver (
   .O(Q_3_1),
   .I0(Q_3)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X18Y16" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_4 (
  .Q(Q_4),      
  .C(Q_3_1),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_4_1)      
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X18Y16" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_4_inver (
   .O(Q_4_1), 
   .I0(Q_4)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X18Y17" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_5 (
  .Q(Q_5),      
  .C(Q_4_1),     
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_5_1)      
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X18Y17" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_5_inver (
   .O(Q_5_1), 
   .I0(Q_5)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X18Y18" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_6 (
  .Q(Q_6),      
  .C(Q_5_1),     
  .CE(CE),    
  .CLR(CLR), 
  .D(Q_6_1)     
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X18Y18" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_6_inver (
   .O(Q_6_1), 
   .I0(Q_6)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X18Y19" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_7 (
  .Q(Q_7),      
  .C(Q_6_1),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_7_1)     
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X18Y19" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_7_inver (
   .O(Q_7_1), 
   .I0(Q_7)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X18Y20" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_8 (
  .Q(Q_8),      
  .C(Q_7_1),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_8_1)      
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X18Y20" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_8_inver (
   .O(Q_8_1), 
   .I0(Q_8)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X18Y21" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_9 (
  .Q(Q_9),      
  .C(Q_8_1),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_9_1)      
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X18Y21" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_9_inver (
   .O(Q_9_1), 
   .I0(Q_9)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X18Y22" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_10 (
  .Q(Q_10),     
  .C(Q_9_1),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_10_1)     
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X18Y22" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_10_inver (
   .O(Q_10_1),
   .I0(Q_10)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X18Y23" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_11 (
  .Q(Q_11),      
  .C(Q_10_1),      
  .CE(CE),   
  .CLR(CLR),  
  .D(Q_11_1)       
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X18Y23" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_11_inver (
   .O(Q_11_1), 
   .I0(Q_11)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X18Y24" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_12 (
  .Q(Q_12),      
  .C(Q_11_1),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_12_1)     
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X18Y24" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_12_inver (
   .O(Q_12_1), 
   .I0(Q_12)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X18Y25" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_13 (
  .Q(Q_13),      
  .C(Q_12_1),      
  .CE(CE),   
  .CLR(CLR),  
  .D(Q_13_1)      
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X18Y25" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_13_inver (
   .O(Q_13_1), 
   .I0(Q_13)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X18Y26" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_14 (
  .Q(Q_14),      
  .C(Q_13_1),      
  .CE(CE),    
  .CLR(CLR), 
  .D(Q_14_1)     
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X18Y26" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1)
) FF_14_inver (
   .O(Q_14_1),
   .I0(Q_14)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X18Y27" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_15 (
  .Q(Q_15),      
  .C(Q_14_1),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_15_1)       
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X18Y27" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_15_inver (
   .O(Q_15_1), 
   .I0(Q_15)
);
   
      
assign Counter_0[0] = Q_0;
assign Counter_0[1] = Q_1;
assign Counter_0[2] = Q_2;
assign Counter_0[3] = Q_3;
assign Counter_0[4] = Q_4;
assign Counter_0[5] = Q_5;
assign Counter_0[6] = Q_6;
assign Counter_0[7] = Q_7;
assign Counter_0[8] = Q_8;
assign Counter_0[9] = Q_9;
assign Counter_0[10] = Q_10;
assign Counter_0[11] = Q_11;
assign Counter_0[12] = Q_12;
assign Counter_0[13] = Q_13;
assign Counter_0[14] = Q_14;
assign Counter_0[15] = Q_15;

/////////////////////////////////////////// COUNTER  1  //////////////////////////////////////////////////////////////////////////////////


(* BEL = "CFF" *)(* LOC = "SLICE_X19Y12" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_0_1 (
  .Q(Q_0_2),     
  .C(B_2),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_0_1_2)       
);

(* BEL = "C6LUT" *)(* LOC = "SLICE_X19Y12" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_0_inver_1 (
   .O(Q_0_1_2),
   .I0(Q_0_2)
);

 (* BEL = "CFF" *)(* LOC = "SLICE_X19Y13" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_1_1 (
  .Q(Q_1_2),      
  .C(Q_0_1_2),     
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_1_1_2)      
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X19Y13" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_1_inver_1 (
   .O(Q_1_1_2), 
   .I0(Q_1_2)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X19Y14" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_2_1 (
  .Q(Q_2_2),     
  .C(Q_1_1_2),      
  .CE(CE),   
  .CLR(CLR),  
  .D(Q_2_1_2)      
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X19Y14" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_2_inver_1 (
   .O(Q_2_1_2), 
   .I0(Q_2_2)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X19Y15" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_3_1 (
  .Q(Q_3_2),     
  .C(Q_2_1_2),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_3_1_2)      
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X19Y15" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_3_inver_1 (
   .O(Q_3_1_2),
   .I0(Q_3_2)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X19Y16" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_4_1 (
  .Q(Q_4_2),      
  .C(Q_3_1_2),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_4_1_2)      
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X19Y16" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_4_inver_1 (
   .O(Q_4_1_2), 
   .I0(Q_4_2)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X19Y17" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_5_1 (
  .Q(Q_5_2),      
  .C(Q_4_1_2),     
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_5_1_2)      
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X19Y17" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_5_inver_1 (
   .O(Q_5_1_2), 
   .I0(Q_5_2)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X19Y18" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_6_1 (
  .Q(Q_6_2),      
  .C(Q_5_1_2),     
  .CE(CE),    
  .CLR(CLR), 
  .D(Q_6_1_2)     
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X19Y18" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_6_inver_1 (
   .O(Q_6_1_2), 
   .I0(Q_6_2)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X19Y19" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_7_1 (
  .Q(Q_7_2),      
  .C(Q_6_1_2),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_7_1_2)     
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X19Y19" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_7_inver_1 (
   .O(Q_7_1_2), 
   .I0(Q_7_2)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X19Y20" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_8_1 (
  .Q(Q_8_2),      
  .C(Q_7_1_2),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_8_1_2)      
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X19Y20" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_8_inver_1 (
   .O(Q_8_1_2), 
   .I0(Q_8_2)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X19Y21" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_9_1 (
  .Q(Q_9_2),      
  .C(Q_8_1_2),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_9_1_2)      
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X19Y21" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_9_inver_1 (
   .O(Q_9_1_2), 
   .I0(Q_9_2)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X19Y22" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_10_1 (
  .Q(Q_10_2),     
  .C(Q_9_1_2),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_10_1_2)     
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X19Y22" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_10_inver_1 (
   .O(Q_10_1_2),
   .I0(Q_10_2)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X19Y23" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_11_1 (
  .Q(Q_11_2),      
  .C(Q_10_1_2),      
  .CE(CE),   
  .CLR(CLR),  
  .D(Q_11_1_2)       
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X19Y23" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_11_inver_1 (
   .O(Q_11_1_2), 
   .I0(Q_11_2)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X19Y24" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_12_1 (
  .Q(Q_12_2),      
  .C(Q_11_1_2),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_12_1_2)     
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X19Y24" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_12_inver_1 (
   .O(Q_12_1_2), 
   .I0(Q_12_2)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X19Y25" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_13_1 (
  .Q(Q_13_2),      
  .C(Q_12_1_2),      
  .CE(CE),   
  .CLR(CLR),  
  .D(Q_13_1_2)      
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X19Y25" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_13_inver_1 (
   .O(Q_13_1_2), 
   .I0(Q_13_2)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X19Y26" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_14_1 (
  .Q(Q_14_2),      
  .C(Q_13_1_2),      
  .CE(CE),    
  .CLR(CLR), 
  .D(Q_14_1_2)     
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X19Y26" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1)
) FF_14_inver_1 (
   .O(Q_14_1_2),
   .I0(Q_14_2)
);

(* BEL = "CFF" *)(* LOC = "SLICE_X19Y27" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
FDCE #(
.INIT(1'b0)
) DFF_15_1 (
  .Q(Q_15_2),      
  .C(Q_14_1_2),      
  .CE(CE),    
  .CLR(CLR),  
  .D(Q_15_1_2)       
);

  (* BEL = "C6LUT" *)(* LOC = "SLICE_X19Y27" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h1) 
) FF_15_inver_1 (
   .O(Q_15_1_2), 
   .I0(Q_15_2)
);
   
      
assign Counter_1[0] = Q_0_2;
assign Counter_1[1] = Q_1_2;
assign Counter_1[2] = Q_2_2;
assign Counter_1[3] = Q_3_2;
assign Counter_1[4] = Q_4_2;
assign Counter_1[5] = Q_5_2;
assign Counter_1[6] = Q_6_2;
assign Counter_1[7] = Q_7_2;
assign Counter_1[8] = Q_8_2;
assign Counter_1[9] = Q_9_2;
assign Counter_1[10] = Q_10_2;
assign Counter_1[11] = Q_11_2;
assign Counter_1[12] = Q_12_2;
assign Counter_1[13] = Q_13_2;
assign Counter_1[14] = Q_14_2;
assign Counter_1[15] = Q_15_2;



endmodule
