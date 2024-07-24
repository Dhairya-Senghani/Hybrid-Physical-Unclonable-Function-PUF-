`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2024 10:46:59
// Design Name: 
// Module Name: PUF_RO
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

module PUF_RO #(parameter SIZE = 8)(Enable, Challenge, Response);
    input Enable;
    input [SIZE - 1 : 0] Challenge;
    output [SIZE - 1 : 0] Response;
        
    genvar i;
    
    generate
        for(i = 0; i <= SIZE - 1; i = i + 1) begin
            PUF_RO_MODULE pf(Enable, Challenge, Response[i]);        
        end
    endgenerate
    
endmodule 
