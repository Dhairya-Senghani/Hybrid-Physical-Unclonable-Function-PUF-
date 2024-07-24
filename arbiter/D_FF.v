module D_FF(D, Clock, Q);
input D;
input Clock;
output reg Q;

always @(posedge Clock) begin
  Q <= D;
end

endmodule