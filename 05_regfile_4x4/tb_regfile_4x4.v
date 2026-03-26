`timescale 1ns/1ps
module tb_regfile_4x4;
    reg clk;
    reg we;
    reg [1:0] waddr,raddr;
    reg [3:0] wdata;
    wire [3:0] rdata;
    regfile_4x4 dut (
        .clk(clk),
        .we(we),
        .waddr(waddr),
        .raddr(raddr),
        .wdata(wdata),
        .rdata(rdata)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    initial begin
        we = 1;
        waddr = 0; wdata = 4'b1010; #10; // Write to reg[0]
        waddr = 1; wdata = 4'b0101; #10; // Write to reg[1]
        waddr = 2; wdata = 4'b1111; #10; // Write to reg[2]
        waddr = 3; wdata = 4'b0000; #10; // Write to reg[3]
       
        we = 0; // Disable write
        raddr = 0; #10; // Read from reg[0]
        raddr = 1; #10; // Read from reg[1]
        raddr = 2; #10; // Read from reg[2]
        raddr = 3; #10; // Read from reg[3]
        $finish;
    end
endmodule