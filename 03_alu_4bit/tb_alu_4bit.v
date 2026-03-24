`timescale 1ns/1ps

module tb_alu_4bit;

    reg  [3:0] a, b;
    reg  [2:0] op;
    wire [3:0] result;
    wire       cout;

    wire [4:0] full_result;
    assign full_result = {cout, result};

    alu_4bit dut (
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .cout(cout)
    );

    integer i;
    reg [4:0] expected;

    initial begin
        $display(" a   b  op | result | expect | status");
        $display("--------------------------------------");

        // 固定测试
        test(5, 3, 3'b000); // add
        test(5, 3, 3'b001); // sub
        test(5, 3, 3'b010); // and
        test(5, 3, 3'b011); // or
        test(5, 3, 3'b100); // xor

        // 随机测试
        for (i = 0; i < 20; i = i + 1) begin
            test($random % 16, $random % 16, $random % 5);
        end

        $display("--------------------------------------");
        $display("测试完成");
        $finish;
    end

    task test;
        input [3:0] ta, tb;
        input [2:0] top;
    begin
        a = ta;
        b = tb;
        op = top;
        #10;

        // 计算期望值
        case (top)
            3'b000: expected = ta + tb;
            3'b001: expected = ta - tb;
            3'b010: expected = ta & tb;
            3'b011: expected = ta | tb;
            3'b100: expected = ta ^ tb;
            default: expected = 0;
        endcase

        if (full_result !== expected) begin
            $display("%2d %2d %3b | %5b | %5b |  ERROR",
                     ta, tb, top, full_result, expected);
        end else begin
            $display("%2d %2d %3b | %5b | %5b |  OK",
                     ta, tb, top, full_result, expected);
        end
    end
    endtask

endmodule