`timescale 1ns/1ps

module tb_full_adder;

reg  a, b, cin;
wire sum, cout;

integer i;   

full_adder dut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
    $display("period\t a b cin | sum cout");
    $display("-----------------------");
    for (i = 0; i < 8; i = i + 1) begin
        {a, b, cin} = i;
        #10;
        $display("%t\t %b %b %b  |  %b   %b", $time, a, b, cin, sum, cout);
    end
    $display("-----------------------");
    $display("finish");
    $finish;
end

endmodule

