module pipelining(clk, rst, dataPrv, dataNxt);
	input logic clk, rst;
	input logic [63: 0] dataPrv, dataNxt;
	
	always@(posedge clk) begin
		dataNxt <= dataPrv
	end

endmodule
