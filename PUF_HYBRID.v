`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2024 08:41:33
// Design Name: 
// Module Name: PUF_HYBRID
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


module PUF_HYBRID(Clock, Reset, Selection, Response);
    input wire Clock;
    input Reset;
    input Selection;
    output [7:0] Response;
    
    wire Clock_Arbiter;
    wire Clock_Ro;
    wire [7 : 0] Response_Arbiter;
    wire [7 : 0] Response_Ro;
    wire [7 : 0] Challenge;

    RANDOM_CHALLENGE random (Clock, Reset, Challenge);
    
    PUF_ARBITER puf_arbiter (Clock_Arbiter, Challenge, Response_Arbiter);
    
    PUF_RO puf_ro (Clock_Ro, Challenge, Response_Ro);
    
    assign Clock_Arbiter = (Selection == 1'b0) ? Clock : 1'b0;
    assign Clock_Ro =      (Selection == 1'b1) ? Clock : 1'b0;
    assign Response =      (Selection == 1'b0) ? Response_Arbiter : Response_Ro;
    
endmodule
