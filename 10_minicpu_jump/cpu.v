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
    
    pc pc_inst (
        .clk(clk),
        .rst(rst),
        .halt(halt),
        .jump(jump),
        .jump_addr(instr[1:0]), // 👈 直接用低2位
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

    assign opcode = instr[7:6];
    assign rs1    = instr[5:4];
    assign rs2    = instr[3:2];
    assign rd     = instr[1:0];

    // =====================
    // Control
    // =====================
    wire we;
    wire [2:0] op;


    control ctrl (
        .opcode(opcode),
        .we(we),
        .op(op),
        .halt(halt),
        .jump(jump)
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
        .op(op)
    );

endmodule