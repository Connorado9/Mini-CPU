// Connor Humiston
// ECEN2350 Digital Logic
// University of Colorado, Boulder

module Logical (x, y, SW9, SW8, andout, orout, xorout, notout, logrslt);
	input [3:0] x, y;
	input SW9, SW8;
	output [9:0] andout, orout, xorout, notout;
	output [9:0]logrslt;

	and_gate and1(x, y, andout);
	or_gate or1(x, y, orout);
	xor_gate exor1(x, y, xorout);
	not_gate not1(x, y, z, notout);
	
	//for SW9 & SW8
	//00 is for AND
	//01 is for OR
	//10 is for XOR
	//11 is for NOT
	Multiplexer op_log(andout, orout, xorout, notout, SW9, SW8, logrslt);
endmodule


//AND
module and_gate(x, y, andout);
	input [3:0] x, y;
	output [3:0] andout;
	
	assign andout = x & y;
endmodule


//OR
module or_gate(x, y, orout);
	input [3:0] x, y;
	output [3:0] orout;
	
	assign orout = x | y;
endmodule


//XOR
module xor_gate(x, y, exorout);
	input [3:0] x, y;
	output[3:0] exorout;
	
	assign exout = x ^ y;
endmodule


//NOT
module not_gate(x, y, z, notout);
	input [3:0] x, y;
	output [7:0] z;
	output [7:0] notout;
	
	assign z = {x, y};
	assign notout = ~z;
endmodule
