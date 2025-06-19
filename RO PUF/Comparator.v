`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CIST    
// Engineer: James Moore
// 
// Create Date: 18.04.2024 16:13:03
// Design Name: 
// Module Name: Comparator
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


module Comparator(
    input   wire [15:0]     A,
    input   wire [15:0]     B,
    output  reg             A_is_larger
);

always @(A or B) 
    if (A > B)
        A_is_larger <= 1;
    else
        A_is_larger <= 0;
        
endmodule


    

    