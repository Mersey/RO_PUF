`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2024 10:54:11
// Design Name: 
// Module Name: Enable
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


module Enable_RO(
    input  wire         Enable,
    input  wire [2:0]   Challenge_0,
    input  wire [2:0]   Challenge_1, 
//    output wire [1:0]   EN_PUF,
    output wire         EN_CLK,
    output wire         EN_0,
    output wire         EN_1,
    output wire         EN_2,
    output wire         EN_3,
    output wire         EN_4,
    output wire         EN_5,
    output wire         EN_6,
    output wire         EN_7,
    output wire         EN_8,
    output wire         EN_9,
    output wire         EN_10,
    output wire         EN_11,
    output wire         EN_12,
    output wire         EN_13,
    output wire         EN_14,
    output wire         EN_15
    );
    
assign EN_CLK = Enable;
    
//assign EN_PUF[0] = EN_0;
//assign EN_PUF[1] = EN_1;
    
//(* BEL = "A6LUT" *)(* LOC = "SLICE_X28Y33" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
//LUT2 #(
//.INIT(64'hA) 
//) Enable_0 (
//   .O(EN_0), 
//   .I0(Enable[0]), 
//   .I1(Enable[1]) 
//);

//(* BEL = "B6LUT" *)(* LOC = "SLICE_X28Y33" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
//LUT2 #(
//.INIT(64'hC) 
//) Enable_1 (
//   .O(EN_1), 
//   .I0(Enable[0]), 
//   .I1(Enable[1]) 
//);

//(* BEL = "C6LUT" *)(* LOC = "SLICE_X28Y33" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
//LUT2 #(
//.INIT(64'hE) 
//) Enable_CLK (
//   .O(EN_CLK), 
//   .I0(Enable[0]), 
//   .I1(Enable[1]) 
//);

LUT4 #(
.INIT(64'h0100) 
) Enable_0 (
   .O(EN_0), 
   .I0(Challenge_0[0]),
   .I1(Challenge_0[1]),
   .I2(Challenge_0[2]),
   .I3(Enable)
);

LUT4 #(
.INIT(64'h0200) 
) Enable_1 (
   .O(EN_1), 
   .I0(Challenge_0[0]),
   .I1(Challenge_0[1]),
   .I2(Challenge_0[2]),
   .I3(Enable)
);

LUT4 #(
.INIT(64'h0400) 
) Enable_2 (
   .O(EN_2), 
   .I0(Challenge_0[0]),
   .I1(Challenge_0[1]),
   .I2(Challenge_0[2]),
   .I3(Enable)
);

LUT4 #(
.INIT(64'h0800) 
) Enable_3 (
   .O(EN_3), 
   .I0(Challenge_0[0]),
   .I1(Challenge_0[1]),
   .I2(Challenge_0[2]),
   .I3(Enable)
);

LUT4 #(
.INIT(64'h1000) 
) Enable_4 (
   .O(EN_4), 
   .I0(Challenge_0[0]),
   .I1(Challenge_0[1]),
   .I2(Challenge_0[2]),
   .I3(Enable)
);

LUT4 #(
.INIT(64'h2000) 
) Enable_5 (
   .O(EN_5), 
   .I0(Challenge_0[0]),
   .I1(Challenge_0[1]),
   .I2(Challenge_0[2]),
   .I3(Enable)
);

LUT4 #(
.INIT(64'h4000) 
) Enable_6 (
   .O(EN_6), 
   .I0(Challenge_0[0]),
   .I1(Challenge_0[1]),
   .I2(Challenge_0[2]),
   .I3(Enable)
);

LUT4 #(
.INIT(64'h8000) 
) Enable_7 (
   .O(EN_7), 
   .I0(Challenge_0[0]),
   .I1(Challenge_0[1]),
   .I2(Challenge_0[2]),
   .I3(Enable)
);

LUT4 #(
.INIT(64'h0100) 
) Enable_8 (
   .O(EN_8), 
   .I0(Challenge_1[0]),
   .I1(Challenge_1[1]),
   .I2(Challenge_1[2]),
   .I3(Enable)
);

LUT4 #(
.INIT(64'h0200) 
) Enable_9 (
   .O(EN_9), 
   .I0(Challenge_1[0]),
   .I1(Challenge_1[1]),
   .I2(Challenge_1[2]),
   .I3(Enable)
);

LUT4 #(
.INIT(64'h0400) 
) Enable_10 (
   .O(EN_10), 
   .I0(Challenge_1[0]),
   .I1(Challenge_1[1]),
   .I2(Challenge_1[2]),
   .I3(Enable)
);

LUT4 #(
.INIT(64'h0800) 
) Enable_11 (
   .O(EN_11), 
   .I0(Challenge_1[0]),
   .I1(Challenge_1[1]),
   .I2(Challenge_1[2]),
   .I3(Enable)
);

LUT4 #(
.INIT(64'h1000) 
) Enable_12 (
   .O(EN_12), 
   .I0(Challenge_1[0]),
   .I1(Challenge_1[1]),
   .I2(Challenge_1[2]),
   .I3(Enable)
);

LUT4 #(
.INIT(64'h2000) 
) Enable_13 (
   .O(EN_13), 
   .I0(Challenge_1[0]),
   .I1(Challenge_1[1]),
   .I2(Challenge_1[2]),
   .I3(Enable)
);

LUT4 #(
.INIT(64'h4000) 
) Enable_14 (
   .O(EN_14), 
   .I0(Challenge_1[0]),
   .I1(Challenge_1[1]),
   .I2(Challenge_1[2]),
   .I3(Enable)
);

LUT4 #(
.INIT(64'h8000) 
) Enable_15 (
   .O(EN_15), 
   .I0(Challenge_1[0]),
   .I1(Challenge_1[1]),
   .I2(Challenge_1[2]),
   .I3(Enable)
);


endmodule
