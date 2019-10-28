// Connor Humiston
// ECEN2350 Digital Logic
// University of Colorado, Boulder

module Arithmetic(x, y, SW9, SW8, addrslt, subrslt, multiplyrslt, divrslt, arithrslt);
	input [3:0] x, y;
	input SW8, SW9;
	output [9:0] addrslt, subrslt, multiplyrslt, divrslt, arithrslt;

	addern rca(x, y, 0, addrslt);
	full_subtract fs(x, y, 1, subrslt);
	multiply_by_two mbt({x, y}, carrym, multiplyrslt);
	divide_by_two dbt({x, y}, divrslt[9], divrslt[8:0]);

	//for SW9 & SW8
	//00 is addition
	//01 is subtraction
	//10 is multiply by 2
	//11 is divide by 2
	Multiplexer op_arith(addrslt, subrslt, multiplyrslt, divrslt, SW9, SW8, arithrslt);
endmodule


//n-bit ripple carry adder
module addern (x, y, Cin, sum);
	parameter n = 4;
	input [n-1:0] x, y;
	input Cin;
	output [4:0] sum;
	wire [4:0] C;
	
	assign C[0] = Cin;
	assign sum[n] = C[n];
	
	genvar i;
	generate
		for (i = 0; i < n; i = i + 1)
		begin: fulladd
			fulladder fa1(x[i], y[i], C[i+1], C[i], sum[i]);
		end
	endgenerate
	assign Cout = C[n];
endmodule


//n-bit full subtractor
module full_subtract(x, y, Cin, difference);
	parameter n = 4;
	input [n-1:0] x, y;
	input Cin;
	output [4:0] difference;
	wire [4:0] C;
	
	assign C[0] = Cin;
	assign difference[n] = ~C[n];
	
	genvar i;
	generate
		for (i = 0; i < n; i = i + 1)
		begin: fullsub
			fulladder fa2(x[i], ~y[i], C[i+1], C[i], difference[i]);
		end
	endgenerate
	
	assign Cout = C[n];
endmodule


//multiply-by-2
module multiply_by_two(z, carrym, product);
	input [8:0] z;
	output [8:0] product;
	output carrym;
	
	assign carrym = z[8];
	assign product = z << 1;
endmodule


//divide-by-2
module divide_by_two(z, carryq, quotient);
	input [7:0] z;
	output [9:0] quotient;
	output carryq;
	
	assign carryq = z[0];
	assign quotient = z >> 1;
endmodule

//full adder
module fulladder(x, y, Cout, Cin, sum);
	input x, y, Cin;
	output Cout, sum;
	
	assign sum = x ^ y ^ Cin;
	assign Cout = (x & y) | (y & Cin) | (x & Cin);
endmodule
