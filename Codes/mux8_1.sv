/* Name: Dinggao Pan, Liyuan Wang
	Date: 10/10/2016
	Lab: #1 Register
	Discription: This is a submodule for the 32-to-1 Mux that we will build.
					 It is an 8-to-1 Mux building from 2 4-to-1 muxes and 1 2-to-1
					 mux. It is controled only by the sel control. It will output only
					 one bit of output.
*/
`timescale 1ps/1ps
module mux8_1(sel, in, out);
	output logic out;
	input logic [2:0] sel;
	input logic [7:0] in;
	
	wire v0, v1; // Temperary wire for the control decoded from the top bit of control line.
	
	mux4_1 m4_0(.out(v0), .in(in[3:0]), .sel(sel[1:0]));
	mux4_1 m4_1(.out(v1), .in(in[7:4]), .sel(sel[1:0]));
	mux2_1 m2  (.out(out), .i0(v0), .i1(v1), .sel(sel[2]));
endmodule

module mux8_1_testbench();
	logic out;
	logic [2:0] sel;
	logic [7:0] in;
	mux8_1 dut(.out, .in, .sel);
	
	initial begin
		#(500ps) in = 4'b0001;
		#(500ps) sel = 3'b000;
		#(500ps) in = 8'h01;
		#(500ps) sel = 3'b001;
		#(500ps) in = 8'h02;
		#(500ps) sel = 3'b010;
		#(500ps) in = 8'h04;
		#(500ps) sel = 3'b011;
		#(500ps) in = 8'h08;
		#(500ps) sel = 3'b100;
		#(500ps) in = 8'h10;
		#(500ps) sel = 3'b101;
		#(500ps) in = 8'h20;
		#(500ps) sel = 3'b110;
		#(500ps) in = 8'h40;
		#(500ps) sel = 3'b111;
		#(500ps) in = 8'h80;
		#(500ps) ;
		#(500ps) in = 8'h00;
		#(500ps) ;
		#(500ps) ;
	end
endmodule