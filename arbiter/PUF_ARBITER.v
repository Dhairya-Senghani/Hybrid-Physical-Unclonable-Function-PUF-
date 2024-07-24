`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2024 12:26:43
// Design Name: 
// Module Name: PUF_ARBITER
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

module PUF_ARBITER #(parameter SIZE = 8)(Enable, Challenge, Response);
    input Enable;
    input [SIZE - 1 : 0] Challenge;
    output [SIZE - 1 : 0] Response;
    
    genvar i;
    
    generate 
        for(i = 0; i <= SIZE - 1; i = i + 1) begin
              (* dont_touch = "yes" *)
            PUF_ARBITER_MODULE pf_module(Enable, Challenge, Response[i]);
        end
    endgenerate
   
endmodule