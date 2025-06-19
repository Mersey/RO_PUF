`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSIT
// Engineer: James Moore
// 
// Create Date: 07.02.2025 16:38:15
// Design Name: 
// Module Name: RO_PUF_0
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


module RO_PUF(
    input wire En,
    output wire Oscil
    ); 

wire A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15;
assign Oscil = A0;  
    
(* BEL = "A6LUT" *)(* LOCK_PINS = "I0:A5, I1:A6" *)(* RLOC = "X0Y0" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT2 #(
.INIT(64'h4) // Specify LUT Contents
) Enable_Inv_0 (
   .O(A1), // 1-bit LUT6 output
   .I0(A0),
   .I1(En) 
);

(* BEL = "B6LUT" *)(* LOCK_PINS = "I0:A5" *)(* RLOC = "X1Y0" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h2) // Specify LUT Contents
) Inv_2 (
   .O(A2), // 1-bit LUT6 output
   .I0(A1)
);

(* BEL = "B6LUT" *)(* LOCK_PINS = "I0:A5" *)(* RLOC = "X2Y0" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h2) // Specify LUT Contents
) Inv_3 (
   .O(A3), // 1-bit LUT6 output
   .I0(A2)
);

(* BEL = "B6LUT" *)(* LOCK_PINS = "I0:A5" *)(* RLOC = "X3Y0" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h2) // Specify LUT Contents
) Inv_4 (
   .O(A4), // 1-bit LUT6 output
   .I0(A3)
);

(* BEL = "B6LUT" *)(* LOCK_PINS = "I0:A5" *)(* RLOC = "X4Y0" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h2) // Specify LUT Contents
) Inv_5 (
   .O(A5), // 1-bit LUT6 output
   .I0(A4)
);

(* BEL = "B6LUT" *)(* LOCK_PINS = "I0:A5" *)(* RLOC = "X5Y0" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h2) // Specify LUT Contents
) Inv_6 (
   .O(A6), // 1-bit LUT6 output
   .I0(A5)
);

(* BEL = "B6LUT" *)(* LOCK_PINS = "I0:A5" *)(* RLOC = "X6Y0" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h2) // Specify LUT Contents
) Inv_7 (
   .O(A7), // 1-bit LUT6 output
   .I0(A6)
);

(* BEL = "B6LUT" *)(* LOCK_PINS = "I0:A5" *)(* RLOC = "X7Y0" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h2) // Specify LUT Contents
) Inv_8 (
   .O(A8), // 1-bit LUT6 output
   .I0(A7)
);

(* BEL = "B6LUT" *)(* LOCK_PINS = "I0:A5" *)(* RLOC = "X8Y0" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h2) // Specify LUT Contents
) Inv_9 (
   .O(A9), // 1-bit LUT6 output
   .I0(A8)
);

(* BEL = "B6LUT" *)(* LOCK_PINS = "I0:A5" *)(* RLOC = "X9Y0" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h2) // Specify LUT Contents
) Inv_10 (
   .O(A10), // 1-bit LUT6 output
   .I0(A9)
);

(* BEL = "B6LUT" *)(* LOCK_PINS = "I0:A5" *)(* RLOC = "X10Y0" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h2) // Specify LUT Contents
) Inv_11 (
   .O(A11), // 1-bit LUT6 output
   .I0(A10)
);

(* BEL = "C6LUT" *)(* LOCK_PINS = "I0:A5" *)(* RLOC = "X11Y0" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h2) // Specify LUT Contents
) Inv_12 (
   .O(A12), // 1-bit LUT6 output
   .I0(A11)
);

(* BEL = "D6LUT" *)(* LOCK_PINS = "I0:A5" *)(* RLOC = "X12Y0" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h2) // Specify LUT Contents
) Inv_13 (
   .O(A13), // 1-bit LUT6 output
   .I0(A12)
);

(* BEL = "A6LUT" *)(* LOCK_PINS = "I0:A5" *)(* RLOC = "X13Y0" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h2) // Specify LUT Contents
) Inv_14 (
   .O(A14), // 1-bit LUT6 output
   .I0(A13)
);

(* BEL = "B6LUT" *)(* LOCK_PINS = "I0:A5" *)(* RLOC = "X14Y0" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h2) // Specify LUT Contents
) Inv_15 (
   .O(A15), // 1-bit LUT6 output
   .I0(A14)
);

(* BEL = "C6LUT" *)(* LOCK_PINS = "I0:A5" *)(* RLOC = "X15Y0" *)(*ALLOW_COMBINATORIAL_LOOPS= "true"*) (*DONT_TOUCH= "true"*) 
LUT1 #(
.INIT(64'h2) // Specify LUT Contents
) Inv_16 (
   .O(A0), // 1-bit LUT6 output
   .I0(A15)
);

endmodule
