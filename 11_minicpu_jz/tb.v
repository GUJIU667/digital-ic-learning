`timescale 1ns/1ps

module tb_cpu;

    reg clk;
    reg rst;

    // 实例化 CPU
    cpu uut (
        .clk(clk),
        .rst(rst)
    );

    // 时钟：10ns周期
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        rst = 1;

        #10;
        rst = 0;

        // 跑一段时间
        #100;

        $finish;
    end

endmodule