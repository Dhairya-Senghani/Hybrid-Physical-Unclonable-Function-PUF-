`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2024 14:05:13
// Design Name: 
// Module Name: RANDOM
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

module RANDOM(Clock, Reset, Output);
    input Clock;
    input Reset;
    output [7:0] Output;

    reg [7 : 0] register;
//    reg [3:0] addition;

    always @(posedge Clock or posedge Reset) begin
        if (Reset == 1'b1) begin
            register <= 8'b0; 
        end 
        else begin
//                addition <= {register[5], register[6], register[0], 1'b1};
//                register <= register + addition;
                register <= register + 1'b1;
        end
    end

assign Output = {register[6:0], register[7]};
//assign Output = register;
endmodule

