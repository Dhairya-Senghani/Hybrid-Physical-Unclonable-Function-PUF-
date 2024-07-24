`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2024 10:21:37
// Design Name: 
// Module Name: PUF_RO_MODULE
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

module PUF_RO_MODULE #(parameter SIZE = 8, COUNTER_SIZE = 32)(Enable, Challenge, Response);
    input wire Enable;
    input [SIZE - 1 : 0] Challenge;
    output Response;
    
    wire [2**(SIZE / 2) - 1 : 0] ro2mux;
    wire clock0;
    wire clock1;
    wire [COUNTER_SIZE - 1 : 0] count0;
    wire [COUNTER_SIZE - 1 : 0] count1;
    genvar i;
    
   generate
        for(i = 0; i <= 2**(SIZE / 2) - 1; i = i + 1) begin
            (* dont_touch = "true" *)
            RO ro (Enable, ro2mux[i]);
        end
    endgenerate
    
(* dont_touch = "true" *)
MUX mux0(ro2mux, Challenge[3 : 0], clock0);
(* dont_touch = "true" *)
MUX mux1(ro2mux, Challenge[7 : 4], clock1);

(* dont_touch = "true" *)
COUNTER counter0(clock0, Enable, count0);
(* dont_touch = "true" *)
COUNTER counter1(clock1, Enable, count1);

(* dont_touch = "true" *)
COMPARATOR comparator (count0, count1, Response);
    
endmodule