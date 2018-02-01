/*
Name: Dinggao Pan, Liyuan Wang
Date: 11/17/2016
Lab: #4 Pipelined CPU
Discription: This is the top module for the pipeLinedCPU which will setup the control signals
				 and connect all the parts together.
*/
`timescale 1ps/1ps
module pipeLinedCPU (clk, rst);
	input logic clk, rst;
	
	logic [63:0] instructionAddr, instructionAddrtemp, memDataRead, aluResult, RegOutA, RegOutB, regIn, 
					 ALUInA, ALUInB, operandB, MemAdrIn, MemDataIn, dataWrite, ifADDI, regOrMem, PCadd4,
					 ZEImm12, SEImm9, aluResult1, RegOutB1,RegA,RegB, branchTo, branchTotemp, rtZero;

	logic [31:0] instruction, PCInst, DecInst, ALUInst, DMemInst, RegWrtInst;
	logic [2:0]  aluCtl, startF;
	logic [4:0]  Addr2, aluRn, aluRm, memRn, memRm, regW, x30, ifBlAlu, ifBlMem;
	logic memWrite, memRead, ADDI, LDUR, ALUOrMem, BR, BL, takeB, cond, RegWrite, negative, NTemp, 
			zero, ZTemp, overflow, OTemp, carry_out, CTemp, RdorRm, aluFRn, aluFRm,aluFRmtemp, memFRn, memFRm,
			memFRmtemp, firstSelB,firstSelA,ifRm,firstSelBtemp, nclk, ifCBZ1, ifCBZ2, CBZ, rtRZero, ifB, acclBrnch, blt,
			ifLoad, br, aluRd, memRd, alurd, memrd, RegAF, aluFA, aluFB, RegBF, memFA, memFB, ifBl,  blX30, blAlu, blMem;
		
	// Sign extending Imm9
	assign SEImm9  = {{55{DecInst[20]}}, DecInst[20:12]};
	// Zero extending Imm12
	assign ZEImm12 = {{52{1'b0}}, DecInst[21:10]};	
	assign x30 = 5'b11110;

	control myCtl(.clk, .rst, .instruction, .memWrite, .memRead, .ADDI, .LDUR, .aluCtl,
					  .BR, .BL, .takeB, .cond, .RegWrite, .ALUOrMem, .negative, .NTemp, 
					  .zero, .ZTemp, .overflow, .OTemp, .carry_out, .CTemp, .RdorRm, 
					  .PCInst, .DecInst, .ALUInst, .DMemInst, .RegWrtInst, .ifRm, .ifCBZ1, 
					  .ifCBZ2, .ifB, .ifLoad, .br, .ifBl, .blX30, .blAlu, .blMem);
	
	programCounter myPC(.clk, .rst, .instruction, .aluResult, .BR, .takeB, .cond, .instructionAddr,
								.instructionAddrtemp, .PCadd4, .branchTo, .ifB, .ifCBZ2, .CBZ, .blt, .br, .RegB);

	// Initializing InstructionMEM
	instructmem myIMem(.clk, .address(instructionAddr), .instruction);
	
	// Initializing Regfile
	not #(50ps) notgate(nclk, clk);
	regfile myReg(.ReadData1(RegOutA), .ReadData2(RegOutB), .WriteData(regIn), .ReadRegister1(DecInst[9:5]),
					  .ReadRegister2(Addr2), .WriteRegister(regW), .RegWrite, .clk(nclk));
	
	// Initializing ALU
	alu myAlu(.A(ALUInA), .B(ALUInB), .cntrl(aluCtl), .result(aluResult),
				 .negative(NTemp), .zero(ZTemp), .overflow(OTemp), .carry_out(CTemp));
				 
	// Initializing DataMem
	datamem myDMem(.clk, .address(MemAdrIn), .write_enable(memWrite), .read_enable(memRead), 
						.write_data(MemDataIn), .xfer_size(4'b1000), .read_data(memDataRead));
	
	xor #(50ps) xogate1(blt, OTemp, NTemp);
	
	//cbz test
	or #(50ps) zeroes_0(rtZero[0], RegB[0], RegB[1]);
	not #(50ps) ngate4Zero(rtRZero, rtZero[63]);
	and #(50ps) andgate5(CBZ, ifCBZ2, rtRZero);
	
	//forwarding testing if the Rn and Rm are the same as Rd in ALU and Mem Stage
	and #(50ps) andgate1(aluFRn, aluRn[0], aluRn[1], aluRn[2], aluRn[3], aluRn[4]);
	and #(50ps) andgate2(aluFRmtemp, aluRm[0], aluRm[1], aluRm[2], aluRm[3], aluRm[4]);
	and #(50ps) andgate3(memFRn, memRn[0], memRn[1], memRn[2], memRn[3], memRn[4]);
	and #(50ps) andgate4(memFRm, memRm[0], memRm[1], memRm[2], memRm[3], memRm[4]);
	or #(50ps) orgate5(firstSelBtemp, memFRm, aluFRm);
	or #(50ps) orgate6(firstSelA, memFRn, aluFRn);

	//test x31
	and #(50ps) andgate6(aluRd, ALUInst[0], ALUInst[1], ALUInst[2], ALUInst[3], ALUInst[4]);
	and #(50ps) andgate7(memRd, DMemInst[0], DMemInst[1], DMemInst[2], DMemInst[3], DMemInst[4]);
	not #(50ps) notgate1(alurd, aluRd);
	not #(50ps) notgate2(memrd, memRd);
	and #(50ps) andgate8(aluFA, alurd, firstSelA);
	and #(50ps) andgate9(memFA, memrd, firstSelA);
	or #(50ps) orgate7(RegAF, aluFA, memFA);
	and #(50ps) andgate10(aluFB, alurd, firstSelB);
	and #(50ps) andgate11(memFB, memrd, firstSelB);
	or #(50ps) orgate8(RegBF, aluFB, memFB);
	
	mux2_1 muxIfRm(.out(firstSelB), .i0(1'b0), .i1(firstSelBtemp), .sel(ifRm));
	mux2_1 muxIfRm1(.out(aluFRm), .i0(1'b0), .i1(aluFRmtemp), .sel(ifRm));
	
	genvar i, j;
	generate
		for(i = 0; i < 64; i++) begin: eachData
			// selecting if dataWrite is the result from ALU or Data from dataMEM
			mux2_1 muxData(.out(regOrMem[i]), .i0(aluResult1[i]), .i1(memDataRead[i]), .sel(ALUOrMem));
			// selecting if it is Db or Imm12
			mux2_1 muxifAddI(.out(ifADDI[i]), .i0(RegOutB[i]), .i1(ZEImm12[i]), .sel(ADDI));
			// selecting if it is Imm9
			mux2_1 muxOperand(.out(operandB[i]), .i0(ifADDI[i]), .i1(SEImm9[i]), .sel(LDUR));
			// Selecting it the data write is from PC + 4
			mux2_1 muxPC(.out(dataWrite[i]), .i0(regOrMem[i]), .i1(PCadd4[i]), .sel(BL));
			//forwarding
			mux4_1 muxForwA(.out(RegA[i]), .in({aluResult[i], RegOutA[i], dataWrite[i], RegOutA[i]}),.sel({aluFRn, RegAF}));
			mux4_1 muxForwB(.out(RegB[i]), .in({aluResult[i], operandB[i], dataWrite[i], operandB[i]}),.sel({aluFRm, RegBF}));
			//CBZ testing if RegB is Zero
			or #(50ps) rtZero(rtZero[i], rtZero[i - 1], RegB[i]);
		end
		
		// Dertermining are we reading Rd or Rm
		for(j = 0; j < 5; j++) begin: eachAddr
			mux2_1 muxAddr(.out(Addr2[j]), .i0(DecInst[j + 16]), .i1(DecInst[j]), .sel(RdorRm));
			// Checking if current Rm, Rn is the same as the Rd in ALU stage and Mem Stage
			xnor #(50ps) xogate1(aluRn[j], DecInst[j+5], ifBlAlu[j]);
			xnor #(50ps) xogate2(aluRm[j], Addr2[j], ifBlAlu[j]);
			xnor #(50ps) xogate3(memRn[j], DecInst[j+5], ifBlMem[j]);
			xnor #(50ps) xogate4(memRm[j], Addr2[j], ifBlMem[j]);
			// Checking if we are doing Bl by putting X30 into position
			mux2_1 muxBl(.out(regW[j]), .i0(RegWrtInst[j]), .i1(x30[j]), .sel(blX30));
			mux2_1 muxBlAlu(.out(ifBlAlu[j]), .i0(ALUInst[j]), .i1(x30[j]), .sel(blAlu));
			mux2_1 muxBlMem(.out(ifBlMem[j]), .i0(DMemInst[j]), .i1(x30[j]), .sel(blMem));
		end
		
	endgenerate
	
	// Pipelining hadling cold start too.
	always@(posedge clk) begin
		if (rst) begin 
			startF <= 3'b010;
		end else if (startF == 3'b010) begin
			startF <= startF - 3'b001;
			instructionAddrtemp <= instructionAddr;
		end else if (startF == 3'b001) begin
			startF <= startF - 3'b001;
			if (aluFRn) begin
				ALUInA <= aluResult;
			end else begin
				ALUInA <= RegOutA;
			end
			if (aluFRm) begin 
				ALUInB <= aluResult;
			end else begin
				ALUInB <= operandB;
			end
			MemAdrIn <= aluResult;
			aluResult1 <= aluResult;
			RegOutB1 <= RegOutB;
			instructionAddrtemp <= instructionAddr;
		end else if (startF == 3'b000) begin
			startF <= startF - 3'b001;
			if (aluFRn) begin
				ALUInA <= aluResult;
			end else begin
				ALUInA <= RegOutA;
			end
			if (aluFRm) begin 
				ALUInB <= aluResult;
			end else begin
				ALUInB <= operandB;
			end
			MemAdrIn <= aluResult;
			aluResult1 <= aluResult;
			MemDataIn <= RegOutB1;
			instructionAddrtemp <= instructionAddr;
		end else begin
			if (ifCBZ1) begin
				instructionAddrtemp <= branchTo;	
			end else begin
				instructionAddrtemp <= instructionAddr;
			end
			if (ifBl) begin
				ALUInB <= instructionAddr;
			end else begin	
				ALUInB <= RegB;
			end	
			ALUInA <= RegA;
			MemAdrIn <= aluResult;
			aluResult1 <= aluResult;
			RegOutB1 <= RegOutB;
			MemDataIn <= RegOutB1;
			regIn <= dataWrite;
		end
	end
	
endmodule

module pipeLinedCPU_testbench();
	
	parameter ClockDelay = 8000ps;
	logic					clk, rst;
	logic [8:0] instructionCounter;
	
	pipeLinedCPU dut (.clk, .rst);
	
	initial begin // Set up the clock
		clk = 0; rst = 0;
		#(ClockDelay/2) clk <= 1; rst <= 1;
		instructionCounter <= 0;
		#(ClockDelay/2) clk <= 0; rst <= 0;
		while(instructionCounter < 200) begin
			#(ClockDelay/2) clk <= ~clk;
			instructionCounter = instructionCounter + 1'b1;
		end
	end
endmodule
