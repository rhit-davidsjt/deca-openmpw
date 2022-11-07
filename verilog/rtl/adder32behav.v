module adder32behav 
  (
`ifdef USE_POWER_PINS
   .vccd1(vccd1),	// User area 1 1.8V power
   .vssd1(vssd1),	// User area 1 digital ground
`endif
   
   input [31:0] A,
   input [31:0] B,
   output [31:0] X,
   output carry,
   output [32:0] io_oeb);
  
  assign io_oeb = 33'b0;
  assign {carry, X} = A+B;
  
endmodule
