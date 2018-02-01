/*
Name: Dinggao Pan, Liyuan Wang
Date: 11/17/2016
Lab: #3 Single Cycle CPU
Discription: This is the module for the program counter which will update the instruciton address at
				 the posedge of the clock.
*/

`timescale 1ps/1ps
module programCounter(clk, rst, instruction, aluResult, BR, takeB, cond, instructionAddr, 
							instructionAddrtemp, PCadd4, branchTo, ifCBZ2, ifB, CBZ, blt, br, RegB);
	input logic [63:0] aluResult, instructionAddrtemp, RegB;
	input logic [31:0] instruction;
	input logic			 clk, rst, BR, takeB, cond, ifB, ifCBZ2, CBZ, blt, br;
	
	output logic[63:0] instructionAddr, PCadd4, branchTo;
	
	logic[63:0]  Brancher, nextProgram, SEImm19, SEImm26, addr;
	logic B, Blt, Br;
	
	// Sign extending Imm19, 26, 
	assign SEImm26 = {{36{instruction[25]}}, instruction[25:0], 1'b0, 1'b0};
	assign SEImm19 = {{43{instruction[23]}}, instruction[23:5], 1'b0, 1'b0};
	// Calculating PC + 4
	adder_64 PC_Add4 (.out(PCadd4), .A(instructionAddr), .B(64'h000000000000004));
	
	// Calculating PC + [where you want to branch to]
	adder_64 branch (.out(branchTo), .A(instructionAddr), .B(Brancher));
	
	genvar i;
	generate
		for(i = 0; i < 64; i++) begin: eachMux
			// selecting the real instruction Address
			mux2_1 muxInsAddr(.out(addr[i]), .i0(nextProgram[i]), .i1(aluResult[i]), .sel(BR));
			// selecting if we are using Imm26 or Imm19
			mux2_1 muxImm(.out(Brancher[i]), .i0(SEImm26[i]), .i1(SEImm19[i]), .sel(cond));
			// selecting if we are brunching
			mux2_1 muxBranch(.out(nextProgram[i]), .i0(PCadd4[i]), .i1(branchTo[i]), .sel(takeB));
		end
	endgenerate

	// Making sure the jump of instruction only happens in the second stage of the branches.
	and #(50ps) andgate(B, ifCBZ2, ifB);
	and #(50ps) andgate1(Blt, ifCBZ2, blt);
	and #(50ps) andgate2(Br, ifCBZ2, br);
	
	// Handling the jump for each branches
	always@(posedge clk) begin
		if(rst) begin
			instructionAddr <= 0;
		end else begin
			if (CBZ) begin
			instructionAddr <= instructionAddrtemp;
			end else if (B) begin
			instructionAddr <= instructionAddrtemp;
			end else if (Blt) begin
			instructionAddr <= instructionAddrtemp;
			end else if (Br) begin
			instructionAddr <= RegB;
			end else begin
			instructionAddr <= addr;
			end
		end
	end
endmodule 