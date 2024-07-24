`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2024 10:46:59
// Design Name: 
// Module Name: COMPARATOR
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

module COMPARATOR #(parameter SIZE = 32)(Input1, Input2, Output);
    input [SIZE - 1 : 0] Input1;
    input [SIZE - 1 : 0] Input2;
    output Output;
        
    assign Output = (Input1 > Input2) ? 1'b1 : 1'b0;
    
endmodule
