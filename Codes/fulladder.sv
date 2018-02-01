`timescale 1ps/1ps
module fulladder #(parameter delay = 50ps) (co, sum, ci, a, b);
	output logic co, sum;
	input  logic ci, a, b;
	wire andtemp_0, andtemp_1, andtemp_2;
	
	and #(delay) agate_0(andtemp_0, a, b);
	and #(delay) agate_1(andtemp_1, a, ci);
	and #(delay) agate_2(andtemp_2, ci, b);
	
	or  #(delay) ogate(co, andtemp_0, andtemp_1, andtemp_2);
	xor #(delay) xogate(sum, a, b, ci);
endmodule
