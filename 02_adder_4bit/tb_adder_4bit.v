`timescale 1ns/1ps

module tb_adder_4bit;

    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    // ???5bit??
    wire [4:0] result;
    assign result = {cout, sum};

    // DUT
    adder_4bit dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    integer i;

    initial begin
        $display(" a   b cin | result(bin) result(dec) | expect | status");
        $display("------------------------------------------------------");

        // ========= ?????? =========
        test_case(0, 0, 0);
        test_case(0, 0, 1);
        test_case(1, 1, 0);
        test_case(1, 1, 1);
        test_case(7, 8, 0);
        test_case(15, 15, 0);
        test_case(15, 15, 1);

        // ========= ???? =========
        for (i = 0; i < 20; i = i + 1) begin
            test_case($random % 16, $random % 16, $random % 2);
        end

        $display("------------------------------------------------------");
        $display("????");
        $finish;
    end

    // ========= ???????????=========
    task test_case;
        input [3:0] ta, tb;
        input       tcin;
        reg   [4:0] expected;
    begin
        a = ta;
        b = tb;
        cin = tcin;
        #10;

        expected = ta + tb + tcin;

        if (result !== expected) begin
            $display("%2d %2d  %1d  | %5b %3d | %3d | ? ERROR",
                     a, b, cin,
                     result, result,
                     expected);
        end else begin
            $display("%2d %2d  %1d  | %5b %3d | %3d | ? OK",
                     a, b, cin,
                     result, result,
                     expected);
        end
    end
    endtask

endmodule