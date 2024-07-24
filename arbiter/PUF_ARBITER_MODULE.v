`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2024 11:30:01
// Design Name: 
// Module Name: PUF_ARBITER_MODULE
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

module PUF_ARBITER_MODULE #(parameter SIZE = 8)(Enable, Challenge, Response);
input wire Enable;
input [SIZE - 1 : 0] Challenge;
output Response;

wire [SIZE - 1 : 0] swap0;
wire [SIZE - 1 : 0] swap1;

genvar i;

SWAP sw0(Challenge[0], Enable, Enable, swap0[0], swap1[0]);

generate  
for(i = 1; i <= SIZE - 1; i = i + 1) begin
    SWAP sw(Challenge[i], swap0[i - 1], swap1[i - 1], swap0[i], swap1[i]);
end
endgenerate

D_FF dff(swap0[SIZE - 1], swap1[SIZE - 1], Response);

endmodule