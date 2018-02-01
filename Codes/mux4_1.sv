/* Name: Dinggao Pan, Liyuan Wang
	Date: 10/10/2016
	Lab: #1 Register
	Discription: This is the This is a 4 to 1 mux built from the 2 to 1
					 mux we built. It uses three 2 to 1 muxes. The inputs 
					 and the output are all exactly one bit in length.
*/
`timescale 1ps/1ps
module mux4_1(out, in, sel);
		output logic out;
		input logic [3:0] in;
		input logic [1:0] sel;
		
		wire v0, v1; // Wire connecting the control wires
		
		mux2_1 m0(.out(v0), .i0(in[0]), .i1(in[1]), .sel(sel[0]));
		mux2_1 m1(.out(v1), .i0(in[2]), .i1(in[3]), .sel(sel[0]));
		mux2_1 m (.out(out), .i0(v0), .i1(v1), .sel(sel[1]));
endmodule

module mux4_1_testbench();
	logic out;
	logic [1:0] sel;
	logic [3:0] in;
	mux4_1 dut(.out, .in, .sel);
	
	initial begin
		in = 4'b0001;
		#(500ps) sel = 2'b00;
		#(500ps) in = 4'b0010;
		#(500ps) sel = 2'b01;
		#(500ps) in = 4'b0100;
		#(500ps) sel = 2'b10;
		#(500ps) in = 4'b1000;
		#(500ps) sel = 2'b11;
		#(500ps) ;
		#(500ps) ;
	end
endmodule