`timescale 1ns/1ps

module tb_register_4bit;

reg clk;
reg rst;
reg en;
reg [3:0] d;
wire [3:0] q;
    
    register_4bit dut (
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(d),
    .q(q)
    );

initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

initial begin
    $display("time clk rst en d | q");

    rst = 1; en = 0; d = 4'b0000; #10;
    rst = 0;
    
    en = 1; d = 4'b0101; #10;
    en = 1; d = 4'b1001; #10;
    en = 0; d = 4'b0011; #10;
    en = 1; d = 4'b0111; #10;

    $finish;
end

endmodule
