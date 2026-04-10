module cpu (
    input clk,
    input rst
);

    // =====================
    // PC & Instruction
    // =====================
    wire [1:0] pc;
    wire [7:0] instr;
    wire halt;
    wire jump;
    wire jz;          // ⭐ 新增
    wire zero_flag;   // ⭐ 新增

    pc pc_inst (
        .clk(clk),
        .rst(rst),
        .halt(halt),
        .jump(jump),
        .jz(jz),                    // ⭐ 新增
        .jump_addr(instr[1:0]),
        .pc(pc)
    );

    imem imem_inst (
        .addr(pc),
        .instr(instr)
    );

    // =====================
    // Decode
    // =====================
    wire [1:0] opcode;
    wire [1:0] rs1, rs2, rd;
    wire is_jz;  // ⭐ 新增

    assign opcode = instr[7:6];
    assign rs1    = instr[5:4];
    assign rs2    = instr[3:2];
    assign rd     = instr[1:0];

    // ⭐ JZ 判断
    assign is_jz = (opcode == 2'b11) && instr[5];

    // =====================
    // Control
    // =====================
    wire we;
    wire [2:0] op;

    control ctrl (
        .opcode(opcode),
        .zero_flag(zero_flag), // ⭐
        .is_jz(is_jz),         // ⭐

        .we(we),
        .op(op),
        .halt(halt),
        .jump(jump),
        .jz(jz)                // ⭐
    );

    // =====================
    // Datapath
    // =====================
    datapath dp (
        .clk(clk),
        .rst(rst),
        .we(we),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .op(op),
        .zero_flag(zero_flag)  // ⭐
    );

endmodule