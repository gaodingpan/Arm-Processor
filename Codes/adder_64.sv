/*
Name: Dinggao Pan, Liyuan Wang
Date: 11/17/2016
Lab: #3 Single Cycle CPU
Discription: This is the module for a 64-bits adder built from the full adder we construct.
*/
module adder_64 (out, A, B);
	input logic [63:0] A, B;
	output logic [63:0] out;
	wire [63:0] carries;
	
	fulladder adder_0(.co(carries[0]), .sum(out[0]), .ci(1'b0), .a(A[0]), .b(B[0]));
	genvar i;
	generate
		for (i = 1; i < 64; i++) begin: eachadder
			fulladder adders(.co(carries[i]), .sum(out[i]), .ci(carries[i - 1]), .a(A[i]), .b(B[i]));
		end
	endgenerate
endmodule
