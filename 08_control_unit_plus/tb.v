module tb;

    reg clk = 0;
    reg rst;

    wire [1:0] pc;
    wire [7:0] instr;
    wire we;
    wire [2:0] op;

    cpu_debug uut (
        .clk(clk),
        .rst(rst),
        .pc_out(pc),
        .instr_out(instr),
        .we_out(we),
        .op_out(op)
    );

    always #5 clk = ~clk;

    initial begin
        rst = 1;
        #10 rst = 0;

        // 初始化寄存器
        uut.dp.rf.regfile[0] = 3;
        uut.dp.rf.regfile[1] = 2;

        #100 $finish;
    end

endmodule