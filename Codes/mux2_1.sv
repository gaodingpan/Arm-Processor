/* Name: Dinggao Pan, Liyuan Wang
	Date: 10/10/2016
	Lab: #1 Register
	Discription: This is the lowest level module for the Muxes,
					 We constructed the 2 to 1 mux using 2 and gates
					 and 1 or gates with each gate delaying 50ps.
					 The module takes in 2inputs and 1 control bit,
					 when the control bit is 0, second input i1 will be
					 the output, when the controlbit is 1, the first input
					 i0 will be the output. The inputs and the output are 
					 all exactly one bit.
*/
`timescale 1ps/1ps
module mux2_1 #(parameter delay = 50ps) (out, i0, i1, sel);
		output logic out;
		input  logic i0, i1, sel;
		
		wire andTemp0, andTemp1, nsel; // Wire passing the result from the and gates to the or gate
		
		not #(delay) nGate(nsel, sel); // Negating the sel signal
		
		and #(delay) aGate_0(andTemp0, i0, nsel);
		and #(delay) aGate_1(andTemp1, i1, sel);
		or  #(delay) oGate(out, andTemp0, andTemp1); // out = i0 if sel = 0; out = i1 if sel = 1;
endmodule

module mux2_1_testbench();
	logic out, i0, i1, sel;
	mux2_1 dut(.out, .i0, .i1, .sel);
	
	initial begin
		i0 = 1; i1 = 0;
		#(250ps) sel = 0;
		#(250ps);
		i0 = 0; i1 = 1;
		#(250ps) sel = 1;
		#(250ps);
	end
endmodule
