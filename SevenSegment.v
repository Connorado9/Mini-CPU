// Connor Humiston
// ECEN2350 Digital Logic
// University of Colorado, Boulder

module SevenSegment(binaryinput, HEX0, HEX1);
	input [9:0] binaryinput;
	output reg [7:0] HEX0, HEX1;
	
	always @(binaryinput)
	begin
		case (binaryinput[3:0])
		4'b0000: HEX0[6:0] = 7'b1000000; //if 0 desired, turns on all but g in gfedcba
		4'b0001: HEX0[6:0] = 7'b1111001; //1
		4'b0010: HEX0[6:0] = 7'b0100100; //2
		4'b0011: HEX0[6:0] = 7'b0110000; //3
		4'b0100: HEX0[6:0] = 7'b0011001; //4
		4'b0101: HEX0[6:0] = 7'b0010010; //5
		4'b0110: HEX0[6:0] = 7'b0000010; //6
		4'b0111: HEX0[6:0] = 7'b1111000; //7
		4'b1000: HEX0[6:0] = 7'b0000000; //8
		4'b1001: HEX0[6:0] = 7'b0010000; //9
		4'b1010: HEX0[6:0] = 7'b0001000; //A
		4'b1011: HEX0[6:0] = 7'b0000011; //B
		4'b1100: HEX0[6:0] = 7'b1000110; //C
		4'b1101: HEX0[6:0] = 7'b0100001; //D
		4'b1110: HEX0[6:0] = 7'b0000110; //E
		4'b1111: HEX0[6:0] = 7'b0001110; //F
		default: HEX0[6:0] = 7'b0111111; //default/error signal is a dash
		endcase
	end
		
	always @(binaryinput)
	begin
		case(binaryinput[7:4])
		4'b0000: HEX1[6:0] = 7'b1000000; //0
		4'b0001: HEX1[6:0] = 7'b1111001; //1
		4'b0010: HEX1[6:0] = 7'b0100100; //2
		4'b0011: HEX1[6:0] = 7'b0110000; //3
		4'b0100: HEX1[6:0] = 7'b0011001; //4
		4'b0101: HEX1[6:0] = 7'b0010010; //5
		4'b0110: HEX1[6:0] = 7'b0000010; //6
		4'b0111: HEX1[6:0] = 7'b1111000; //7
		4'b1000: HEX1[6:0] = 7'b0000000; //8
		4'b1001: HEX1[6:0] = 7'b0010000; //9
		4'b1010: HEX1[6:0] = 7'b0001000; //A
		4'b1011: HEX1[6:0] = 7'b0000011; //B
		4'b1100: HEX1[6:0] = 7'b1000110; //C
		4'b1101: HEX1[6:0] = 7'b0100001; //D
		4'b1110: HEX1[6:0] = 7'b0000110; //E
		4'b1111: HEX1[6:0] = 7'b0001110; //F
		default: HEX1[6:0] = 7'b0111111; //default/error signal is a dash
		endcase
	end


	always @(binaryinput)
	begin
		case(binaryinput[9]) 				//for division
		1'b1: HEX0[7] = 1'b0; 				//decimal point on
		1'b0: HEX0[7] = 1'b1; 				//decimal off
		endcase
	end


	always @(binaryinput)
	begin
		case(binaryinput[8]) 				//for multiplication
		1'b1: HEX1[7] = 1'b0; 				//decimal point on
		1'b0: HEX1[7] = 1'b1; 				//decimal off
		endcase
	end 
endmodule
