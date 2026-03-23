`timescale 1ns/1ps  

module adder_tb;
reg [3:0] a, b;
wire [4:0] sum;

adder uut (
    .a(a),
    .b(b),
    .sum(sum)
);

initial begin
    a=0; b=0;
    #10 a=3; b=5;
    #10 a=7; b=8;
    #10 a=15; b=1;
    #10 $stop;
end
endmodule

