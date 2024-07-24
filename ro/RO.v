`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2024 10:53:18
// Design Name: 
// Module Name: RO
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
module RO #(parameter STAGES = 24) (Enable, Output);
    input Enable;
    output Output;
    
//    wire [STAGES : 0] chain;

//    and(chain[0], Enable, chain[STAGES]);
    
//    genvar i;
//    generate
//        for (i = 1; i <= STAGES; i = i + 1) begin : stage
//            not(chain[i], chain[i - 1]);
//        end
//    endgenerate

//    assign Output = chain[STAGES];






//Using always statement

//    (* dont_touch = "true" *) reg [STAGES - 1 : 0] ring;
  
      
//    always @(ring, Enable) begin
//        ring[0] <= (~ring[STAGES - 1] & Enable); // Feedback from last element
//        ring[STAGES - 1 : 1] <= ring[STAGES - 2 : 0]; // Shift
//    end
    
//    assign Output = ring[STAGES - 1];






(* S= "TRUE"*)(* ALLOW_COMBINATORIAL_LOOPS = "true", KEEP = "true" *) 
	    wire [STAGES : 0]w; 
		
		genvar i;
		  
        and (w[0], ~Enable, Output);
        generate
            for(i = 0; i <= STAGES - 1; i = i + 1) begin
                not (w[i + 1], w[i]);        
            end      
        endgenerate                                               
        not (Output, w[STAGES]);







    
endmodule
