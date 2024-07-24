`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2024 10:46:59
// Design Name: 
// Module Name: COUNTER
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


module COUNTER #(parameter SIZE = 32)(Clock, Reset, Output);
    input Clock;
    input Reset;
    output reg [SIZE - 1 : 0] Output;
    reg clk0, clk1, clk2;
    
    initial clk0 = 1'b0;
    initial clk1 = 1'b0;
    initial clk2 = 1'b0;
    
    always @(posedge Clock) begin
    clk0 = ~clk0;
    end
    
    always @(posedge clk0) begin
    clk1 = ~clk1;
    end
    
    always @(posedge clk1) begin
    clk2 = ~clk2;
    end
    always @(posedge clk2 or posedge Reset) begin
        if(Reset == 1'b1) begin
            Output <= 0;
        end 
        else begin
            Output <= Output + 1;
        end 
      
    end
    
endmodule
