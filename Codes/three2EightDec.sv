/* Name: Dinggao Pan, Liyuan Wang
	Date: 10/10/2016
	Lab: #1 Register
	Discription: This is a 3-to-8 Decoder which is the base module for the 
					 5-to-32 Decoder. It uses 8 and gates to determine which line 
					 should be set to true. All gates have a delay of 50ps. The 
					 outputs are also restrained by the enable bit that is passed in.
*/
`timescale 1ps/1ps
module three2EightDec #(parameter delay = 50ps) (sel, enable, out);
	input logic enable;
	input logic [2:0] sel;
	output logic [7:0] out;
	
	wire [2:0] nsel;
	// negating the sel signal
	not #(delay) ngate_0(nsel[0], sel[0]);
	not #(delay) ngate_1(nsel[1], sel[1]);
	not #(delay) ngate_2(nsel[2], sel[2]);

	and #(delay) agate0(out[0], nsel[2], nsel[1], nsel[0], enable);
	and #(delay) agate1(out[1], nsel[2], nsel[1], sel[0], enable);
	and #(delay) agate2(out[2], nsel[2], sel[1], nsel[0], enable);
	and #(delay) agate3(out[3], nsel[2], sel[1], sel[0], enable);
	and #(delay) agate4(out[4], sel[2], nsel[1], nsel[0], enable);
	and #(delay) agate5(out[5], sel[2], nsel[1], sel[0], enable);
	and #(delay) agate6(out[6], sel[2], sel[1], nsel[0], enable);
	and #(delay) agate7(out[7], sel[2], sel[1], sel[0], enable);

endmodule