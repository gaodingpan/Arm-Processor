/* Name: Dinggao Pan, Liyuan Wang
	Date: 10/10/2016
	Lab: #1 Register
	Discription: This is the sub module for the single register we built for the 32
					 registers. It stores the value to the DFFs only when the enable signal
					 is given using gatelevel logics. All gates have a delay of 50ps.
*/
module singleReg #(parameter delay = 50ps) (clk, reset, dataIn, dataOut, regWrite);
	input logic clk, reset, regWrite;
	input logic [63:0] dataIn;
	output logic [63:0] dataOut;
	
	wire [63:0] data; // Temperory wires for updating the DFFs at the right time.
	
	genvar i;
	generate
		for(i = 0; i < 64; i++) begin: eachDff // Setting up the DFFs.
			mux2_1 myMux(.out(data[i]), .i0(dataOut[i]), .i1(dataIn[i]), .sel(regWrite));
			D_FF dFF (.d(data[i]), .q(dataOut[i]), .clk(clk), .reset(reset));
		end
	endgenerate

endmodule

