`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CIST
// Engineer: James Moore
// 
// Create Date: 19.06.2024 13:34:15
// Design Name: 
// Module Name: 16_bit_counter
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


module counter_16_bit(
    input wire CLK,
    input wire EN, 
    input wire CE,
    input wire CLR,
    output wire finished,
    output reg [15:0] A
    );
   
assign finished = A[14];

initial begin
    A <= 0;
end    

always @ (posedge CLK) begin
    if (!CLR) begin 
        if (CE) begin
            if (EN) begin
                A <= A + 1;   
            end
        end
    end else begin 
        A <= 0;
    end            
end

endmodule




   

