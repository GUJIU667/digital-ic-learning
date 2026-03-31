module cpu_debug (
    input clk,
    input rst,

    // 👇 debug输出（建议加！）
    output [1:0] pc_out,
    output [7:0] instr_out,
    output we_out,
    output [2:0] op_out
);

    wire [1:0] pc;
    wire [7:0] instr;
    wire [1:0] opcode, rs1, rs2, rd;
    wire we;
    wire [2:0] op;

    // PC
    pc pc_inst (
        .clk(clk),
        .rst(rst),
        .pc(pc)
    );

    // IMEM
    imem imem_inst (
        .addr(pc),
        .instr(instr)
    );

    // Decode
    assign opcode = instr[7:6];
    assign rs1    = instr[5:4];
    assign rs2    = instr[3:2];
    assign rd     = instr[1:0];

    // Control
    control ctrl (
        .opcode(opcode),
        .we(we),
        .op(op)
    );

    // Datapath
    datapath dp (
        .clk(clk),
        .rst(rst),
        .we(we),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .op(op)
    );

    // 👇 输出到波形
    assign pc_out    = pc;
    assign instr_out = instr;
    assign we_out    = we;
    assign op_out    = op;

endmodule