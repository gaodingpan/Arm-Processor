/* Name: Dinggao Pan, Liyuan Wang
	Date: 10/10/2016
	Lab: #1 Register
	Discription: This is the top level module for the register we built. All the submodules
					 are connected together in this module. It creates 32 singleReg with the last
					 one hard coded as always all 0s. It creats one 5-to-32 decoder to take in the 
					 control from the CPU. It also builds 2 sets of 64 32-to-1 Muxes that take care of 
					 selecting all the bits that we want from the targetted register.
*/
module regfile(ReadData1, ReadData2, WriteData, ReadRegister1, ReadRegister2, WriteRegister, RegWrite, clk);
	input  logic 			RegWrite, clk;
	input  logic [4:0] ReadRegister1, ReadRegister2, WriteRegister;
	input  logic [63:0]	WriteData;
	output logic [63:0]	ReadData1, ReadData2;
	
	wire [31:0] regCtl; // Wire connecting the control lines of the 32 register.
	wire [31:0][63:0] data; // Wires connecting the data in the register to the muxes.
	
	fiveTo32Dec myDec(.sel(WriteRegister), .enable(RegWrite), .out(regCtl)); // Decoder initialized.
	
	genvar i, j;
	generate
		for(i = 0; i < 31; i++) begin: eachSingleReg // Generating 31 64bits registers
			singleReg myReg(.clk, .reset(1'b0), .dataIn(WriteData), .dataOut(data[i]), .regWrite(regCtl[i]));
		end
		
	// Create the last register to be hard coded as always all 0s no matter what.
	singleReg myReg31(.clk, .reset(1'b1), .dataIn(64'b0), .dataOut(data[31]), .regWrite(regCtl[31]));	
	
		for(j = 0; j < 64; j++) begin: eachMux32_1 // Creating 64 32-to-1 Muxes taking care of 64 bits of data.
			mux32_1 myMux1(.sel(ReadRegister1), 
									// Connecting the targeted bits from the 32 register to the targeted mux.
								.in({ data[31][j], data[30][j], data[29][j], data[28][j], data[27][j], data[26][j], data[25][j], data[24][j], 
										data[23][j], data[22][j], data[21][j], data[20][j], data[19][j], data[18][j], data[17][j], data[16][j], 
										data[15][j], data[14][j], data[13][j], data[12][j], data[11][j], data[10][j], data[9][j], data[8][j], 
										data[7][j], data[6][j], data[5][j], data[4][j], data[3][j], data[2][j], data[1][j], data[0][j]}), 
								.out(ReadData1[j]));
								
			mux32_1 myMux2(.sel(ReadRegister2), 
								.in({ data[31][j], data[30][j], data[29][j], data[28][j], data[27][j], data[26][j], data[25][j], data[24][j], 
										data[23][j], data[22][j], data[21][j], data[20][j], data[19][j], data[18][j], data[17][j], data[16][j], 
										data[15][j], data[14][j], data[13][j], data[12][j], data[11][j], data[10][j], data[9][j], data[8][j], 
										data[7][j], data[6][j], data[5][j], data[4][j], data[3][j], data[2][j], data[1][j], data[0][j]}), 
								.out(ReadData2[j]));
		end
	endgenerate

endmodule
