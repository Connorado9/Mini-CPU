// Connor Humiston
// ECEN2350 Digital Logic
// University of Colorado, Boulder

module Multiplexer (a, b, c, d, select0, select1, multplxout);
	input [9:0] a, b, c, d;
	input select0, select1;
	output reg [9:0] multplxout;

	always @ (select0, select1)
		case ({select0, select1})
		2'b00: multplxout = a;
		2'b01: multplxout = b;
		2'b10: multplxout = c;
		2'b11: multplxout = d;
	endcase
endmodule
