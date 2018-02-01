/*
Name: Dinggao Pan, Liyuan Wang
Date: 11/17/2016
Lab: #4 Pipelined CPU
Discription: This is the module for the control signals to be set. 
*/

module control(clk, rst, instruction, memWrite, memRead, ADDI, LDUR, ALUOrMem, BR, BL, takeB, cond, RegWrite, 
					aluCtl, RdorRm, negative, NTemp, zero, ZTemp, overflow, OTemp, carry_out, CTemp, 
					PCInst, DecInst, ALUInst, DMemInst, RegWrtInst, ifRm, ifCBZ1, ifCBZ2, ifB, ifLoad, br, ifBl, blX30, blAlu, blMem);
					
	input logic  		  clk, rst, NTemp, ZTemp, OTemp, CTemp;
	input logic  [31:0] instruction;
	
	output logic 		  memWrite, memRead, ADDI, LDUR, BR, BL, 
							  takeB, cond, RegWrite, ALUOrMem, RdorRm, 
							  negative, zero, overflow, carry_out, ifRm, ifCBZ1, ifCBZ2, ifB, ifLoad, br, ifBl, blX30, blAlu, blMem;
	
	output logic [2:0]  aluCtl;
	output logic [31:0] PCInst, DecInst, ALUInst, DMemInst, RegWrtInst;

	
	always@(posedge clk) begin
		DecInst <= instruction;
		ALUInst <= DecInst;
		DMemInst <= ALUInst;
		RegWrtInst <= DMemInst;
	end
	
	always_comb begin
				case(instruction[31:21])
					{10'b1001000100, 
					instruction[21]}: 	begin 												// ADDI
													BR = 0; takeB = 0; cond = 1'bx; ifCBZ1 = 0;
												end
					{11'b10101011000}: 	begin 												// ADDS
													BR = 0; takeB = 0; cond = 1'bx; ifCBZ1 = 0;
												end
					{6'b000101, 
					instruction[25:21]}: begin 												// B
													BR = 1'b0; takeB = 0; cond = 0; ifCBZ1 = 1;
												end
					{8'b01010100, 
					instruction[23:21]}: begin 												// B.LT
													BR = 0; takeB = 0; cond = 1; ifCBZ1 = 1;
												end
					{6'b100101, 
					instruction[25:21]}: begin 												// BL
													BR = 0; takeB = 0; cond = 0; ifCBZ1 = 1;
												end
					{11'b11010110000}: 	begin 												// BR
													BR = 0; takeB = 0; cond = 1'bx; ifCBZ1 = 0;
												end
					{8'b10110100, 
					instruction[23:21]}: begin 												// CBZ
													BR = 0; takeB = 0; cond = 1; ifCBZ1 = 1;
												end
					{11'b11111000010}: 	begin 												// LDUR
													BR = 0; takeB = 0; cond = 1'bx; ifCBZ1 = 0;
												end
					{11'b11111000000}: 	begin 												// STUR
													BR = 0; takeB = 0; cond = 1'bx; ifCBZ1 = 0;
												end
					{11'b11101011000}: 	begin 												// SUBS
													BR = 0; takeB = 0; cond = 1'bx; ifCBZ1 = 0;
												end
					default: 				begin
													BR = 1'bx; takeB = 1'bx; cond = 1'bx; ifCBZ1 = 0;
												end
				endcase
				
				case(DecInst[31:21])
					{10'b1001000100, 
					DecInst[21]}: 			begin 												// ADDI
													ADDI = 1; LDUR = 0; RdorRm = 1'bx; ifRm = 0; ifCBZ2 = 0;
													ifB = 0; ifLoad = 0; br = 0; ifBl = 0;
												end
					{11'b10101011000}: 	begin 												// ADDS
													ADDI = 0; LDUR = 0; RdorRm = 0; ifRm = 1; ifCBZ2= 0;
													ifB = 0; ifLoad = 0; br = 0; ifBl = 0;
												end
					{6'b000101, 
					DecInst[25:21]}: 		begin 												// B
													ADDI = 1'bx; LDUR = 1'bx; RdorRm = 0; ifRm = 0; ifCBZ2 = 1;
													ifB = 1; ifLoad = 0; br = 0; ifBl = 0;
												end
					{8'b01010100, 
					DecInst[23:21]}: 		begin 												// B.LT
													ADDI = 1'bx; LDUR = 1'bx; RdorRm = 0; ifRm = 0; ifCBZ2 = 1;
													ifB = 0; ifLoad = 0; br = 0; ifBl = 0;
												end
					{6'b100101, 
					DecInst[25:21]}: 		begin 												// BL
													ADDI = 1'bx; LDUR = 1'bx; RdorRm = 0; ifRm = 0; ifCBZ2 = 1;
													ifB = 1; ifLoad = 0;br = 0; ifBl = 1;
												end
					{11'b11010110000}: 	begin 												// BR
													ADDI = 0; LDUR = 0; RdorRm = 1; ifRm = 0; ifCBZ2 = 1;
													ifB = 0; ifLoad = 0; br = 1; ifBl = 0;
												end
					{8'b10110100, 
					DecInst[23:21]}: 		begin 												// CBZ
													ADDI = 1'b0; LDUR = 1'b0; RdorRm = 1;ifRm = 1; ifCBZ2 = 1;
													ifB = 0; ifBl = 0; ifLoad = 0; br = 0;
												end
					{11'b11111000010}: 	begin 												// LDUR
													ADDI = 1'bx; LDUR = 1; RdorRm = 1'bx;ifRm = 0; ifCBZ2 = 0;
													ifB = 0; ifLoad = 1; br = 0; ifBl = 0;
												end
					{11'b11111000000}: 	begin 												// STUR
													ADDI = 1'bx; LDUR = 1; RdorRm = 1;ifRm = 0; ifCBZ2 = 0;
													ifB = 0; ifLoad = 0;br = 0; ifBl = 0;
												end
					{11'b11101011000}: 	begin 												// SUBS
													ADDI = 0; LDUR = 0; RdorRm = 0;ifRm = 1; ifCBZ2 = 0;
													ifB = 0; ifLoad = 0; br = 0; ifBl = 0;
												end
					default: 				begin
													ADDI = 1'bx; LDUR = 1'bx; RdorRm = 1'bx; ifRm = 0; ifCBZ2 = 0;
													ifB = 0; ifLoad = 0; br = 0; ifBl = 0;
												end
				endcase
				
				case(ALUInst[31:21])
					{10'b1001000100, 
					ALUInst[21]}: 			begin 												// ADDI
													aluCtl = 2; blAlu = 0;
												end
					{11'b10101011000}: 	begin 												// ADDS
													aluCtl = 2; negative = NTemp; zero = ZTemp; 
													overflow = OTemp; carry_out = CTemp;blAlu = 0;
												end
					{6'b000101, 
					ALUInst[25:21]}: 		begin 												// B
													aluCtl = 3'bxxx;blAlu = 0;
												end
					{8'b01010100, 
					ALUInst[23:21]}: 		begin 												// B.LT
													aluCtl = aluCtl;blAlu = 0;
												end
					{6'b100101, 
					ALUInst[25:21]}: 		begin 												// BL
													aluCtl = 3'b000; blAlu = 1;
												end
					{11'b11010110000}: 	begin 												// BR
													aluCtl = 3'bxxx;blAlu = 0;
												end
					{8'b10110100, 
					ALUInst[23:21]}: 		begin 												// CBZ
													aluCtl = 3'b000;blAlu = 0;
												end
					{11'b11111000010}: 	begin 												// LDUR
													aluCtl = 2;blAlu = 0;
												end
					{11'b11111000000}:	begin 												// STUR
													aluCtl = 2;blAlu = 0;
												end
					{11'b11101011000}: 	begin 												// SUBS
													aluCtl = 3; negative = NTemp; zero = ZTemp; 
													overflow = OTemp; carry_out = CTemp;blAlu = 0;
												end
					default: 				begin
													aluCtl = 3'bxxx; blAlu = 0;
												end
				endcase
				
				case(DMemInst[31:21])
					{10'b1001000100, 
					DMemInst[21]}: 		begin 												// ADDI
													memWrite = 0; memRead = 0;ALUOrMem = 0; BL = 0; blMem = 0;
												end
					{11'b10101011000}: 	begin 												// ADDS
													memWrite = 0; memRead = 0;ALUOrMem = 0; BL = 0; blMem = 0;
												end
					{6'b000101, 
					DMemInst[25:21]}: 	begin 												// B
													memWrite = 0; memRead = 0;ALUOrMem = 1'bx; BL = 1'bx; blMem = 0;
												end
					{8'b01010100, 
					DMemInst[23:21]}: 	begin 												// B.LT
													memWrite = 0; memRead = 0;ALUOrMem = 1'bx; BL = 1'bx; blMem = 0;
												end
					{6'b100101, 
					DMemInst[25:21]}: 	begin 												// BL
													memWrite = 0; memRead = 0;ALUOrMem = 0; BL = 0; blMem = 1;
												end
					{11'b11010110000}:	begin 												// BR
													memWrite = 0; memRead = 0;ALUOrMem = 0; BL = 1'bx; blMem = 0;
												end
					{8'b10110100, 
					DMemInst[23:21]}: 	begin 												// CBZ
													memWrite = 0; memRead = 0;ALUOrMem = 1'b0; BL = 1'bx; blMem = 0;
												end
					{11'b11111000010}: 	begin 												// LDUR
													memWrite = 0; memRead = 1;ALUOrMem = 1; BL = 0; blMem = 0;
												end
					{11'b11111000000}: 	begin 												// STUR
													memWrite = 1; memRead = 1;ALUOrMem = 1; BL = 1'bx; blMem = 0;
												end
					{11'b11101011000}: 	begin 												// SUBS
													memWrite = 0; memRead = 0;ALUOrMem = 0; BL = 0; blMem = 0;
												end
					default: 				begin
													memWrite = 1'b0; memRead = 0; ALUOrMem = 1'bx; BL = 1'bx; blMem = 0;
												end
				endcase
				
				case(RegWrtInst[31:21])
					{10'b1001000100, 
					RegWrtInst[21]}: 		begin 												// ADDI
													RegWrite = 1; blX30 = 0;
												end
					{11'b10101011000}: 	begin 												// ADDS
													RegWrite = 1; blX30 = 0;
												end
					{6'b000101, 
					RegWrtInst[25:21]}: 	begin 												// B
													RegWrite = 0; blX30 = 0;
												end
					{8'b01010100, 
					RegWrtInst[23:21]}: 	begin 												// B.LT
													RegWrite = 0; blX30 = 0;
												end
					{6'b100101, 
					RegWrtInst[25:21]}: 	begin 												// BL
													RegWrite = 1; blX30 = 1;
												end
					{11'b11010110000}: 	begin 												// BR
													RegWrite = 0; blX30 = 0;
												end
					{8'b10110100, 
					RegWrtInst[23:21]}: 	begin 												// CBZ
													RegWrite = 0; blX30 = 0;
												end
					{11'b11111000010}: 	begin 												// LDUR
													RegWrite = 1; blX30 = 0;
												end
					{11'b11111000000}: 	begin 												// STUR
													RegWrite = 0; blX30 = 0;
												end
					{11'b11101011000}: 	begin 												// SUBS
													RegWrite = 1; blX30 = 0;
												end
					default: 				begin
													RegWrite = 1'b0; blX30 = 0;
												end
				endcase
		end
endmodule
