module cpu_top (
    input clk,
    input rst
);

wire [1:0] pc_val;
wire [7:0] instr;

wire [1:0] opcode = instr[7:6];
wire [1:0] rs1    = instr[5:4];
wire [1:0] rs2    = instr[3:2];
wire [1:0] rd     = instr[1:0];

wire we, mem_we, mem_to_reg, halt;
wire [2:0] alu_op;

// pc
pc pc_inst (
    .clk(clk),
    .rst(rst),
    .halt(halt),
    .pc(pc_val)
);

// imem
imem im (
    .addr(pc_val),
    .instr(instr)
);

// control
control ctrl (
    .opcode(opcode),
    .rd(rd),
    .we(we),
    .alu_op(alu_op),
    .mem_we(mem_we),
    .mem_to_reg(mem_to_reg),
    .halt(halt)
);

// datapath
datapath dp (
    .clk(clk),
    .rst(rst),
    .we(we),
    .alu_op(alu_op),
    .mem_we(mem_we),
    .mem_to_reg(mem_to_reg),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .zero_flag()
);

endmodule