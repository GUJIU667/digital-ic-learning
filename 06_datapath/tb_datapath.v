module tb_datapath;

    reg clk = 0;
    reg rst;
    reg we;
    reg [1:0] rs1, rs2, rd;
    reg [2:0] op;

    datapath uut (
        .clk(clk),
        .rst(rst),
        .we(we),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .op(op)
    );

    always #5 clk = ~clk;

    initial begin
        rst = 1; we = 0;
        #10 rst = 0;

        we = 1;

        uut.rf.regfile[0]=5;
        uut.rf.regfile[1]=3;

        rs1 = 0; rs2 = 1; rd = 2; op = 3'b000; #10; //R2 = R0 + R1
        rs1 = 2; rs2 = 1; rd = 3; op = 3'b100; #10; //R3 = R2 ^ R1

        $finish;
    end

endmodule

    /*initial begin
        
        we = 1;
        
        dut.rf1.regfile[0]=5;
        dut.rf1.regfile[1]=3;

        rs1 = 0; rs2 = 1; rd = 2; op = 3'b000; #10; //R2 = R0 + R1
        rs1 = 2; rs2 = 1; rd = 3; op = 3'b100; #10; //R3 = R2 ^ R1
        
        $finish;
    end

endmodule*/
