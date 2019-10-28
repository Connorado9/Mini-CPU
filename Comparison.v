// Connor Humiston
// ECEN2350 Digital Logic
// University of Colorado, Boulder

module Comparison(x, y, SW9, SW8, eqrslt, grrslt, lsrslt, mxout, compare);
	input [3:0] x, y;
	input SW9, SW8;
	output [9:0] eqrslt, grrslt, lsrslt, mxout, compare;

	equal eql(x, y, eqrslt);
	greaterthan grt(x, y, grrslt);
	lessthan less(x, y, lsrslt);
	max mx(x, y, mxout);
	
	//for SW9 & SW8
	//00 is for equal
	//01 is for greater than
	//10 is for less than
	//11 is for max
	Multiplexer op_comp(eqrslt, grrslt, lsrslt, mxout, SW9, SW8, compare);
endmodule


//EQUAL
//outputs 1 if equal and 0 if not equal
module equal(x, y, eqrslt);
	input [3:0] x, y;
	output reg [3:0] eqrslt;
	
	always @(x, y, eqrslt)
		begin
			if (x == y)
				eqrslt = 1;
			else
			eqrslt = 0;
		end
endmodule


//GREATER
//outputs 1 if x > y and 0 if y >= x
module greaterthan(x, y, grrslt);
	input [3:0] x, y;
	output reg [3:0] grrslt;
	
	always @(x, y, grrslt)
		begin
			if (x > y)
				grrslt = 1;
			else
				grrslt = 0;
		end
endmodule


//LESS
//outputs 1 if x < y and 0 if y <= x
module lessthan(x, y, lsrslt);
	input [3:0] x, y;
	output reg [3:0] lsrslt;
	
	always @(x, y, lsrslt)
		begin
			if (x < y)
				lsrslt = 1;
			else
				lsrslt = 0;
		end
endmodule


//MAX
//outputs x if x is maximum and y if y is maximum
module max(x, y, mxout);
	input [3:0] x, y;
	output reg [3:0] mxout;
	
	always @(mxout)
		begin
			begin
				if (x[3] == 1 & y[3] == 0)
					mxout = x;
			end
			begin
				if (y[3] == 1 & x[3] == 0)
					mxout = y; 
			end	
			begin
				if (x[3] == y[3] & x[2] == 1 & y[2] == 0)
					mxout = x;
			end
			begin 
				if (x[3] == y[3] & x[2] == 0 & y[2] == 1)
					mxout = y;
			end
			begin
				if (x[3] == y[3] & x[2] == y[2] & x[1] == 1 & y[1] == 0)
					mxout = x;
			end
			begin
				if (x[3] == y[3] & x[2] == y[2] & x[1] == 0 & y[1] == 1)
					mxout = y;
			end
			begin
				if (x[3] == y[3] & x[2] == y[2] & x[1] == y[1] & x[0] == 1 & y[0] == 0)
					mxout = x;
			end
			begin
				if (x[3] == y[3] & x[2] == y[2] & x[1] == y[1] & x[0] == 0 & y[0]== 1)
					mxout = y;
			end
		end
endmodule

