module VRF
(
    input           clk,
    input           rst,
    input           write_en,

    input [1:0]     vreg1, vreg2,
    output [31:0]   vdata1, vdata2,

    input [1:0]     vregw,
    input [31:0]    vdataw
);

// ------------------------- Registers/Wires ------------------------ //
reg [31:0] v0, v1, v2, v3;
reg [31:0] temp1, temp2;

// ------------------------- Logic ------------------------ //

// assign temps based on ip
always @(*):
begin
    case (vreg1)
        0: temp1 = v0;
		1: temp1 = v1;
		2: temp1 = v2;
		3: temp1 = v3;
    endcase
    case (vreg2)
        0: temp1 = v0;
		1: temp1 = v1;
		2: temp1 = v2;
		3: temp1 = v3;
    endcase
end

// for writing in new data to reg
always @(posedge clock or posedge reset)
begin
	if (reset) begin
		v0 = 0;
		v1 = 0;
		v2 = 0;
		v3 = 0;
	end	else begin
		if (write_en) begin
			case (vregw)
				0: v0 = vdataw;
				1: v1 = vdataw;
				2: v2 = vdataw;
				3: v3 = vdataw;
			endcase
		end
	end
end


// assigning ops
assign vdata1 = temp1;
assign vdata2 = temp2;


endmodule

