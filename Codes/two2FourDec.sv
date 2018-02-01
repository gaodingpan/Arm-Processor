/* Name: Dinggao Pan, Liyuan Wang
	Date: 10/10/2016
	Lab: #1 Register
	Discription: This is a 2-to-4 Decoder which is the base module for the 
					 5-to-32 Decoder. It uses 4 and gates to determine which line 
					 should be set to true. All gates have a delay of 50ps. The 
					 outputs are also restrained by the enable bit that is passed in.
*/
`timescale 1ps/1ps
module two2FourDec #(parameter delay = 50ps) (sel, enable, out);
	input logic enable;
	input logic [1:0] sel;
	output logic [3:0] out;
	
	wire [1:0] nsel;
	// Negating the sel signal
	not #(delay) ngate_0(nsel[0], sel[0]);
	not #(delay) ngate_1(nsel[1], sel[1]);

	and #(delay) agate0(out[0], nsel[1], nsel[0], enable);
	and #(delay) agate1(out[1], nsel[1], sel[0], enable);
	and #(delay) agate2(out[2], sel[1], nsel[0], enable);
	and #(delay) agate3(out[3], sel[1], sel[0], enable);

endmodule
