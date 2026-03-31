module cpu_top (
    input clk,
    input rst,
    input [7:0] instr
);

    wire [1:0] opcode;
    wire [1:0] rs1, rs2, rd;
    wire we;
    wire [2:0] op;

    assign opcode = instr[7:6];
    assign rs1    = instr[5:4];
    assign rs2    = instr[3:2];
    assign rd     = instr[1:0];

    control ctrl (
        .opcode(opcode),
        .we(we),
        .op(op)
    );

    datapath dp (
        .clk(clk),
        .rst(rst),
        .we(we),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .op(op)
    );

endmodule
