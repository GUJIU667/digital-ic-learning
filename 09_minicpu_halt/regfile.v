module regfile_4x4 (
    input clk,
    input rst,
    input we,
    input [1:0] waddr,
    input [3:0] wdata,

    input [1:0] raddr1,
    output [3:0] rdata1,

    input [1:0] raddr2,
    output [3:0] rdata2
);

    reg [3:0] regfile [3:0];
    integer i;

    assign rdata1 = regfile[raddr1];
    assign rdata2 = regfile[raddr2];

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 4; i = i + 1)
                regfile[i] <= 0;
        end else if (we) begin
            regfile[waddr] <= wdata;
        end
    end

endmodule

