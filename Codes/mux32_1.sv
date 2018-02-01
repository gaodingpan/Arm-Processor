/* Name: Dinggao Pan, Liyuan Wang
	Date: 10/10/2016
	Lab: #1 Register
	Discription: This is a submodule for the register file that we will build.
					 It is an 32-to-1 Mux building from 4 8-to-1 muxes and 1 4-to-1
					 mux. It is controled only by the sel control. It will output only
					 one bit of output from the 32 one bit inputs.
*/
`timescale 1ps/1ps
module mux32_1(sel, in, out);
	output logic out;
	input logic [4:0] sel;
	input logic [31:0] in;
	
	wire [3:0] v; // The wire connecting the control decoded from the first 2 bits of control.
	
	mux8_1 m8_0(.out(v[0]), .in(in[7:0]), .sel(sel[2:0]));
	mux8_1 m8_1(.out(v[1]), .in(in[15:8]), .sel(sel[2:0]));
	mux8_1 m8_2(.out(v[2]), .in(in[23:16]), .sel(sel[2:0]));
	mux8_1 m8_3(.out(v[3]), .in(in[31:24]), .sel(sel[2:0]));
	mux4_1 m4  (.out, .in(v), .sel(sel[4:3]));
endmodule

module mux32_1_testbench();
	logic out;
	logic [4:0] sel;
	logic [31:0] in;
	mux32_1 dut(.out, .in, .sel);
	
	initial begin
		#(500ps) sel = 5'b00000;
		#(500ps) in = 32'h00000001;
		#(500ps) sel = 5'b00001;
		#(500ps) in = 32'h00000002;
		#(500ps) sel = 5'b00010;
		#(500ps) in = 32'h00000004;
		#(500ps) sel = 5'b00011;
		#(500ps) in = 32'h00000008;
		#(500ps) sel = 5'b00100;
		#(500ps) in = 32'h00000010;
		#(500ps) sel = 5'b00101;
		#(500ps) in = 32'h00000020;
		#(500ps) sel = 5'b00110;
		#(500ps) in = 32'h00000040;
		#(500ps) sel = 5'b00111;
		#(500ps) in = 32'h00000080;
		#(500ps) sel = 5'b01000;
		#(500ps) in = 32'h00000100;
		#(500ps) sel = 5'b01001;
		#(500ps) in = 32'h00000200;
		#(500ps) sel = 5'b01010;
		#(500ps) in = 32'h00000400;
		#(500ps) sel = 5'b01011;
		#(500ps) in = 32'h00000800;
		#(500ps) sel = 5'b01100;
		#(500ps) in = 32'h00001000;
		#(500ps) sel = 5'b01101;
		#(500ps) in = 32'h00002000;
		#(500ps) sel = 5'b01110;
		#(500ps) in = 32'h00004000;
		#(500ps) sel = 5'b01111;
		#(500ps) in = 32'h00008000;
		#(500ps) sel = 5'b10000;
		#(500ps) in = 32'h00010000;
		#(500ps) sel = 5'b10001;
		#(500ps) in = 32'h00020000;
		#(500ps) sel = 5'b10010;
		#(500ps) in = 32'h00040000;
		#(500ps) sel = 5'b10011;
		#(500ps) in = 32'h00080000;
		#(500ps) sel = 5'b10100;
		#(500ps) in = 32'h00100000;
		#(500ps) sel = 5'b10101;
		#(500ps) in = 32'h00200000;
		#(500ps) sel = 5'b10110;
		#(500ps) in = 32'h00400000;
		#(500ps) sel = 5'b10111;
		#(500ps) in = 32'h00800000;
		#(500ps) sel = 5'b11000;
		#(500ps) in = 32'h01000000;
		#(500ps) sel = 5'b11001;
		#(500ps) in = 32'h02000000;
		#(500ps) sel = 5'b11010;
		#(500ps) in = 32'h04000000;
		#(500ps) sel = 5'b11011;
		#(500ps) in = 32'h08000000;
		#(500ps) sel = 5'b11100;
		#(500ps) in = 32'h10000000;
		#(500ps) sel = 5'b11101;
		#(500ps) in = 32'h20000000;
		#(500ps) sel = 5'b11110;
		#(500ps) in = 32'h40000000;
		#(500ps) sel = 5'b11111;
		#(500ps) in = 32'h80000000;
		#(500ps) ;
		#(500ps) in = 32'h00000000;
		#(500ps) ;
		#(500ps) ;
	end
endmodule