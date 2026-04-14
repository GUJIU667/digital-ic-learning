module datapath (
    input clk,
    input rst,

    input we,
    input [2:0] alu_op,
    input mem_we,
    input mem_to_reg,

    input [1:0] rs1,
    input [1:0] rs2,
    input [1:0] rd,

    output zero_flag
);

wire [3:0] rdata1, rdata2;
wire [3:0] alu_result;
wire [3:0] mem_data;
wire [3:0] write_back;

// regfile
regfile_4x4 rf (
    .clk(clk),
    .rst(rst),
    .we(we),
    .waddr(rd),
    .wdata(write_back),
    .raddr1(rs1),
    .rdata1(rdata1),
    .raddr2(rs2),
    .rdata2(rdata2)
);

// alu
alu_4bit alu (
    .a(rdata1),
    .b(rdata2),
    .op(alu_op),
    .result(alu_result),
    .cout(cout)
);

// dmem
dmem dm (
    .clk(clk),
    .we(mem_we),
    .addr(rdata1[1:0]),
    .wdata(rdata2),
    .rdata(mem_data)
);

// write back
assign write_back = mem_to_reg ? mem_data : alu_result;

assign zero_flag = (alu_result == 0);

endmodule