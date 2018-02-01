/* Name: Dinggao Pan, Liyuan Wang
	Date: 10/10/2016
	Lab: #2 ALU
	Discription: This is the module for the ALU unit we built for the single cycle CPU.
					 The ALU is built in gate level. All gates have a delay of 50ps. The unit
					 takes in two 64 bits binary numbers and do the operation required by the user.
					 The operation is determined by the control bit passed in by the user.
					 The ALU has totally 4 flags indicating if the result is negative or zero or
					 overflow and the carry_out of the result.
					 The ALU have 6 operations: Pass_B, Add, Subtract, Bitwise and, Bitwise or
					 and Bitwise Xor.
*/

`timescale 1ps/1ps
module alu #(parameter delay = 50ps) (A, B, cntrl, result, negative, zero, overflow, carry_out);
	output logic [63:0] result;
	output logic 		  negative, zero, overflow, carry_out;
	input  logic [63:0] A, B;
	input  logic [2:0]  cntrl;
	
	wire [63:0] NotB, BOperant, addOrSubs, carries, BWAnd, BWOr, BWXor, ifzero; // wires to connect the result of each operation 
																										 // to the output
	
	genvar i, j;
	generate
		for(j = 0; j < 64; j++) begin: eachBit
			// negate B
			not #(delay) ngate(NotB[j], B[j]);
			// bitwise and
			and #(delay) agate(BWAnd[j], A[j], B[j]);
			// bitwise or
			or  #(delay) ogate(BWOr[j], A[j], B[j]);
			// bitwise xor
			xor #(delay) xogate(BWXor[j], A[j], B[j]);
			// setting output
			mux8_1 myMux(.out(result[j]), .sel(cntrl), .in({1'bx, BWXor[j], BWOr[j], BWAnd[j], addOrSubs[j], addOrSubs[j], 1'bx, B[j]}));
		end

		// first bit operation for add/subtract and zero flag
		mux2_1 opMux_0(.out(BOperant[0]), .i0(B[0]), .i1(NotB[0]), .sel(cntrl[0]));
		fulladder myAdder_0(.co(carries[0]), .sum(addOrSubs[0]), .ci(cntrl[0]), .a(A[0]), .b(BOperant[0]));
		or #(delay) zeroes_0(ifzero[0], result[0], result[1]);
		
		// operation for bits in [63:1] 
		for(i = 1; i < 64; i++) begin: eachAddSubs
			// determining if the ALU is performing add or substract
			mux2_1 opMux_0(.out(BOperant[i]), .i0(B[i]), .i1(NotB[i]), .sel(cntrl[0]));
			fulladder myAdder(.co(carries[i]), .sum(addOrSubs[i]), .ci(carries[i - 1]), .a(A[i]), .b(BOperant[i]));
			
			// determining zero flag
			or #(delay) zeroes(ifzero[i], ifzero[i - 1], result[i]);
		end
	endgenerate
	
	// zero flag
	not #(delay) ngate4Zero(zero, ifzero[63]);

	// overflow flag
	xor #(delay) xogate_Overflow(overflow, carries[63], carries[62]);

	// negative flag
	assign negative = result[63];

	// carry_out
	assign carry_out = carries[63];
endmodule
