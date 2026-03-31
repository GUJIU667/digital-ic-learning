module tb;

    reg clk = 0;
    reg rst;
    reg [7:0] instr;

    cpu_top uut (
        .clk(clk),
        .rst(rst),
        .instr(instr)
    );

    always #5 clk = ~clk;

    initial begin
        rst = 1;
        #10 rst = 0;

        // 初始化寄存器
        uut.dp.rf.regfile[0] = 3;
        uut.dp.rf.regfile[1] = 2;

        #10;

        // ADD: R2 = R0 + R1
        instr = 8'b00_00_01_10;
        #10;

        // XOR: R3 = R2 ^ R1
        instr = 8'b01_10_01_11;
        #10;

        #20 $finish;
    end

endmodule
