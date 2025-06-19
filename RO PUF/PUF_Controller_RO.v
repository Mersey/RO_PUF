`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSIT
// Engineer: James Moore
// 
// Create Date: 21.06.2024 11:20:10
// Design Name: 
// Module Name: PUF_Controller
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
    
    

module PUF_Controller_RO(
    input wire EN_master,
    input wire CLK,
    input wire Response_1,
    input wire finished,
    output reg EN,
    output reg CLR,
    output reg CE,
    output reg Finished_master,
    output reg Response_master,
    output reg PUF_busy
    );
    
reg EN_latch;
reg [1:0] Mode_tracker;  
reg [7:0] Count_of_runs;
reg [7:0] Count_of_responses;

always @ (posedge CLK) begin
    
    EN_latch <= EN_master;
 
    if (EN_latch == 1'b0) begin
        if (EN_master == 1'b1) begin
            CLR                 <= 1'b1;
            Mode_tracker        <= 2'b00;
            Count_of_runs       <= 8'b00000000;
            Count_of_responses  <= 8'b00000000;          
        end else begin 
            CLR <= 1'b0;
        end
    end else begin 
        if (EN_master == 1'b1) begin
            if (CE == 1'b0) begin 
                if (finished == 1'b1) begin
                    CLR <= 1'b1;
                end else begin
                    CLR <= 1'b0;
                end
            end else begin 
                CLR <= 1'b0;
            end     
        end else begin 
            CLR <= 1'b0;
        end 
    end    
    
    if (EN_master == 1'b1) begin
        if (Finished_master == 1'b0) begin
            PUF_busy <= 1'b1;
        end else begin
            PUF_busy <= 1'b0;
        end
    end else begin 
        PUF_busy <= 1'b0;
    end
        
    if (EN_master == 1'b1) begin
        if (EN_latch == 1'b1) begin
            if (finished == 1'b0) begin
                if (Count_of_runs < 63) begin
                    CE <= 1'b1;
                end else begin
                    CE <= 1'b0;
                end
            end else begin
                CE <= 1'b0;
            end
        end else begin
            CE <= 1'b0;
        end          
    end else begin
        CE <= 1'b0;
    end
    
    if (EN_latch == 1'b1) begin
        if (Finished_master == 1'b0) begin
            if (CE) begin 
                if (Mode_tracker == 2'b00) begin 
                    EN <= 1;
                end
               
            end else begin
                EN <= 0;
            end
        end else begin
            EN <= 0;
        end 
    end else begin
        EN <= 0;
    end
    
    if (EN_latch) begin
        if (finished) begin
            if (CE == 1'b0) begin
                if (EN == 1) begin
                    Mode_tracker <= 2'b00;
                end
            end 
            
            if (EN == 1) begin
                if (CE == 1'b0) begin 
                    Count_of_runs <= Count_of_runs + 1;                
                    if (Response_1) begin
                        Count_of_responses <= Count_of_responses + 1;
                    end
                end
            end     
        end
    end else begin 
        Count_of_runs       <= 8'b00000000;
        Count_of_responses  <= 8'b00000000;
    end
    
    if (Count_of_runs == 63) begin
        Finished_master <= 1'b1;
    end else begin
        Finished_master <= 1'b0;
    end
    
    if (Count_of_responses >= 31) begin
        Response_master <= 1'b1;
    end else begin
        Response_master <= 1'b0;
    end
end
        
endmodule




