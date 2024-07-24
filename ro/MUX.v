`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2024 10:46:59
// Design Name: 
// Module Name: MUX
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

//(* dont_touch = "true" *)
module MUX(Input, Selection, Output);
    input [15 : 0] Input;
    input [4 : 0] Selection;
    output Output;

    assign Output = Input[Selection];

endmodule
