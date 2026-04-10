module datapath (
    input clk,
    input rst,
    input we,
    input [1:0] rs1, rs2,
    input [1:0] rd,
    input [2:0] op,

    output zero_flag   // ⭐ 新增
);

    wire [3:0] data1, data2;
    wire [3:0] alu_result;
    wire cout;

    // ⭐ Zero Flag
    assign zero_flag = (alu_result == 4'b0000);

    regfile_4x4 rf (
        .clk(clk),
        .rst(rst),
        .we(we),
        .waddr(rd),
        .wdata(alu_result),
        .raddr1(rs1),
        .rdata1(data1),
        .raddr2(rs2),
        .rdata2(data2)
    );

    alu_4bit alu (
        .a(data1),
        .b(data2),
        .op(op),
        .result(alu_result),
        .cout(cout)
    );

endmodule