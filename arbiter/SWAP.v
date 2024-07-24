(* dont_touch = "yes" *)
module SWAP(C, Input0, Input1, Output0, Output1);
input C;
input Input0;
input Input1;
output Output0;
output Output1;

//MUX_2_1 mux0(Input0, Input1, C, Output0);
//MUX_2_1 mux1(Input1, Input0, C, Output1);

assign Output0 = (C == 1'b0) ? Input0 : Input1;
assign Output1 = (C == 1'b0) ? Input1 : Input0;

endmodule