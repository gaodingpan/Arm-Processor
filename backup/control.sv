module control(clk, instruction, memWrite, memRead, ADDI, LDUR, ALUOrMem, BR, BL, takeB, cond, RegWrite, 
					aluCtl, RdorRm, LTCtl, negative, NTemp, zero, ZTemp, overflow, OTemp, carry_out, CTemp, 
					PCInst, DecInst, ALUInst, DMemInst, RegWrtInst);
					
	input logic  		  clk, LTCtl, NTemp, ZTemp, OTemp, CTemp;
	input logic  [31:0] instruction;
	
	output logic 		  memWrite, memRead, ADDI, LDUR, BR, BL, 
							  takeB, cond, RegWrite, ALUOrMem, RdorRm, 
							  negative, zero, overflow, carry_out;
	
	output logic [2:0]  aluCtl;
	output logic [31:0] PCInst, DecInst, ALUInst, DMemInst, RegWrtInst;

	
	always@(posedge clk) begin
		PCInst <= instruction;
		DecInst <= PCInst;
		ALUInst <= DecInst;
		DMemInst <= ALUInst;
		RegWrtInst <= DMemInst;
	end
	
	always_comb begin
				case(PCInst[31:21])
					{10'b1001000100, PCInst[21]}: begin 							// ADDI
																	BR = 0; takeB = 0; cond = 1'bx;
																  end
					{11'b10101011000}: begin 												// ADDS
												BR = 0; takeB = 0; cond = 1'bx;
											 end
					{6'b000101, PCInst[25:21]}: begin 								// B
																BR = 1'b0; takeB = 1; cond = 0;
															  end
					{8'b01010100, PCInst[23:21]}: begin 							// B.LT
																	BR = 0; takeB = LTCtl; cond = LTCtl;
																  end
					{11'b10100011010}: begin 												// BL??
												BR = 0; takeB = 1; cond = 0;
											 end
					{11'b11010110000}: begin 												// BR
												BR = 1; takeB = 1'bx; cond = 1'bx;
											 end
					{8'b10110100, PCInst[23:21]}: begin 							// CBZ
																	BR = 0; takeB = ZTemp; cond = ZTemp;
																 end
					{11'b11111000010}: begin 												// LDUR
												BR = 0; takeB = 0; cond = 1'bx;
											 end
					{11'b11111000000}: begin 												// STUR
												BR = 0; takeB = 0; cond = 1'bx;
											 end
					{11'b11101011000}: begin 												// SUBS
												BR = 0; takeB = 0; cond = 1'bx;
											 end
					default: begin
									BR = 1'bx; takeB = 1'bx; cond = 1'bx;
								end
				endcase
				
				case(DecInst[31:21])
					{10'b1001000100, DecInst[21]}: begin 							// ADDI
																	ADDI = 1; LDUR = 0; RdorRm = 1'bx;
																  end
					{11'b10101011000}: begin 												// ADDS
												ADDI = 0; LDUR = 0; RdorRm = 0;
											 end
					{6'b000101, DecInst[25:21]}: begin 								// B
																ADDI = 1'bx; LDUR = 1'bx; RdorRm = 0;
															  end
					{8'b01010100, DecInst[23:21]}: begin 							// B.LT
																	ADDI = 1'bx; LDUR = 1'bx; RdorRm = 0;
																  end
					{11'b10100011010}: begin 												// BL??
												ADDI = 1'bx; LDUR = 1'bx; RdorRm = 0;
											 end
					{11'b11010110000}: begin 												// BR
												ADDI = 0; LDUR = 0; RdorRm = 1;
											 end
					{8'b10110100, DecInst[23:21]}: begin 							// CBZ
																	ADDI = 1'b0; LDUR = 1'b0; RdorRm = 1;
																 end
					{11'b11111000010}: begin 												// LDUR
												ADDI = 1'bx; LDUR = 1; RdorRm = 1'bx;
											 end
					{11'b11111000000}: begin 												// STUR
												ADDI = 1'bx; LDUR = 1; RdorRm = 1;
											 end
					{11'b11101011000}: begin 												// SUBS
												ADDI = 0; LDUR = 0; RdorRm = 0;
											 end
					default: begin
									ADDI = 1'bx; LDUR = 1'bx; RdorRm = 1'bx;
								end
				endcase
				
				case(ALUInst[31:21])
					{10'b1001000100, ALUInst[21]}: begin 							// ADDI
																	aluCtl = 2;
																  end
					{11'b10101011000}: begin 												// ADDS
												aluCtl = 2; negative = NTemp; zero = ZTemp; overflow = OTemp; carry_out = CTemp;
											 end
					{6'b000101, ALUInst[25:21]}: begin 								// B
																aluCtl = 3'bxxx;
															  end
					{8'b01010100, ALUInst[23:21]}: begin 							// B.LT
																	aluCtl = aluCtl;
																  end
					{11'b10100011010}: begin 												// BL??
												aluCtl = 3'bxxx;
											 end
					{11'b11010110000}: begin 												// BR
												aluCtl = 3'bxxx;
											 end
					{8'b10110100, ALUInst[23:21]}: begin 							// CBZ
																	aluCtl = 3'b000;
																 end
					{11'b11111000010}: begin 												// LDUR
												aluCtl = 2;
											 end
					{11'b11111000000}: begin 												// STUR
												aluCtl = 2;
											 end
					{11'b11101011000}: begin 												// SUBS
												aluCtl = 3; negative = NTemp; zero = ZTemp; overflow = OTemp; carry_out = CTemp;
											 end
					default: begin
									aluCtl = 3'bxxx;
								end
				endcase
				
				case(DMemInst[31:21])
					{10'b1001000100, DMemInst[21]}: begin 							// ADDI
																	memWrite = 0; memRead = 0;
																  end
					{11'b10101011000}: begin 												// ADDS
												memWrite = 0; memRead = 0;
											 end
					{6'b000101, DMemInst[25:21]}: begin 								// B
																	memWrite = 0; memRead = 0;
															  end
					{8'b01010100, DMemInst[23:21]}: begin 							// B.LT
																	memWrite = 0; memRead = 0;
																  end
					{11'b10100011010}: begin 												// BL??
												memWrite = 0; memRead = 0;
											 end
					{11'b11010110000}: begin 												// BR
												memWrite = 0; memRead = 0;
											 end
					{8'b10110100, DMemInst[23:21]}: begin 							// CBZ
																	memWrite = 0; memRead = 0;
																 end
					{11'b11111000010}: begin 												// LDUR
												memWrite = 0; memRead = 1;
											 end
					{11'b11111000000}: begin 												// STUR
												memWrite = 1; memRead = 1;
											 end
					{11'b11101011000}: begin 												// SUBS
												memWrite = 0; memRead = 0;
											 end
					default: begin
									memWrite = 1'b0; memRead = 0;
								end
				endcase
				
				case(RegWrtInst[31:21])
					{10'b1001000100, RegWrtInst[21]}: begin 							// ADDI
																	ALUOrMem = 0; BL = 0;RegWrite = 1;
																  end
					{11'b10101011000}: begin 												// ADDS
												ALUOrMem = 0; BL = 0;RegWrite = 1;
											 end
					{6'b000101, RegWrtInst[25:21]}: begin 								// B
																ALUOrMem = 1'bx; BL = 1'bx;RegWrite = 0;
															  end
					{8'b01010100, RegWrtInst[23:21]}: begin 							// B.LT
																	ALUOrMem = 1'bx; BL = 1'bx;RegWrite = 0;
																  end
					{11'b10100011010}: begin 												// BL??
												ALUOrMem = 1'bx; BL = 1;RegWrite = 1;RegWrite = 1;
											 end
					{11'b11010110000}: begin 												// BR
												ALUOrMem = 0; BL = 1'bx;RegWrite = 0;
											 end
					{8'b10110100, RegWrtInst[23:21]}: begin 							// CBZ
																	ALUOrMem = 1'b0; BL = 1'bx;RegWrite = 0;
																 end
					{11'b11111000010}: begin 												// LDUR
												ALUOrMem = 1; BL = 0;RegWrite = 1;
											 end
					{11'b11111000000}: begin 												// STUR
												ALUOrMem = 1; BL = 1'bx;RegWrite = 0;
											 end
					{11'b11101011000}: begin 												// SUBS
												ALUOrMem = 0; BL = 0;RegWrite = 1;
											 end
					default: begin
									ALUOrMem = 1'bx; BL = 1'bx;
								end
				endcase
		end
endmodule
