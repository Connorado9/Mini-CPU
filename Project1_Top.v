// Connor Humiston
// ECEN2350 Digital Logic
// University of Colorado, Boulder

module Project1_Top(KEY, SW, HEX0, HEX1, LEDR); //added LEDR
	input [1:0] KEY;
	input [9:0] SW;
	output [7:0] HEX0, HEX1;
	output [9:0] LEDR;
	
	wire [9:0] muxout, arithout1, logicout2, compout3, muxout4;
	wire [7:0] compare;
	wire [7:0] arithrslt;
	wire [7:0] logrslt;
	reg K0, K1;
	
	//x = SW[7:4] aka first nibble
	//y = SW[3:0] aka second nibble
	
	always @(posedge KEY[0]) //The button keys on my board were very finickey and did not function correctly on negedge.
	begin
		if (KEY[0] == 1)
			K0 = K0;
		else 
			K0 = ~K0;
	end

	always @(posedge KEY[1]) //The button keys on my board were very finickey and did not function correctly on negedge.
	begin
		if (KEY[1] == 1)
			K1 = K1;
		else
			K1 = ~K1;
	end
	
	Arithmetic(SW[7:4], SW[3:0], SW[9], SW[8], addrslt, subrslt, multiplyrslt, divrslt, arithout1[9:0]);
	Logical(SW[7:4], SW[3:0], SW[9], SW[8], andout, orout, exout, notout, logicout2[9:0]);
	Comparison(SW[7:4], SW[3:0], SW[9], SW[8], eqout, grout, lsout, maxout, compout3[9:0]);
	
	Multiplexer mult1(arithout1[9:0], arithout1[9:0], logicout2[9:0], compout3[9:0], K0, K1, muxout[9:0]);
	SevenSegment sevenout1(muxout[9:0], HEX0[7:0], HEX1[7:0]);

	assign LEDR[9:0] = muxout[9:0];
endmodule
