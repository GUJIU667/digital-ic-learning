module tb;

    reg clk = 0;
    reg rst;

    // 实例化CPU
    cpu uut (
        .clk(clk),
        .rst(rst)
    );

    // 时钟：10ns周期
    always #5 clk = ~clk;

    initial begin
        // =====================
        // 初始化
        // =====================
        rst = 1;
        #10;
        rst = 0;

        // 初始化寄存器（关键！）
        uut.dp.rf.regfile[0] = 3; // R0 = 3
        uut.dp.rf.regfile[1] = 2; // R1 = 2
        uut.dp.rf.regfile[2] = 0;
        uut.dp.rf.regfile[3] = 0;

        // =====================
        // 运行一段时间
        // =====================
        #200;

        $finish;
    end

endmodule