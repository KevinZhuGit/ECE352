// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module reg_32b 
(
	input               rst,
	input               clk,
	input [31:0]        data_in,
	input               enable,
	output reg [31:0]   data_out
);
	
	always @(posedge clock, posedge rst)    // posedge rst?
	begin
		if (rst)
			data_out <= 32'b0;
		else if (enable)
			data_out <= data_in;
	end

endmodule