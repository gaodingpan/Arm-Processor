/* Name: Dinggao Pan, Liyuan Wang
	Date: 10/10/2016
	Lab: #1 Register
	Discription: This is 5-to-32 Decoder built from 1 2-to-4 decoder and
					 4 3-to-8 Decoders. It is controled by the 5-bits control
					 line and an enable control. The output will have exactly
					 one line set to true when the line is indicated by the 
					 5-bits control with the enable bit being true. The output
					 is used as the control for the 32 registers we will have 
					 in the top module as the enable line. One bit matching 
					 exactly one register.
					 
*/
module fiveTo32Dec(sel, enable, out);
	input logic enable;
	input logic [4:0] sel;
	output logic [31:0] out;
	
	wire [3:0] fourControl;
	
	two2FourDec my2to4(sel[4:3], enable, fourControl);
	three2EightDec my3to8_0(sel[2:0], fourControl[0], out[7:0]);
	three2EightDec my3to8_1(sel[2:0], fourControl[1], out[15:8]);
	three2EightDec my3to8_2(sel[2:0], fourControl[2], out[23:16]);
	three2EightDec my3to8_3(sel[2:0], fourControl[3], out[31:24]);
	
endmodule

