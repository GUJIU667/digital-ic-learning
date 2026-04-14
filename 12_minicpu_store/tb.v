module tb;

reg clk;
reg rst;

cpu_top uut (
    .clk(clk),
    .rst(rst)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;

    #100 $finish;
end

endmodule