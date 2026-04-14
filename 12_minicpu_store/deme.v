module dmem (
    input clk,
    input we,
    input [1:0] addr,
    input [3:0] wdata,
    output [3:0] rdata
);

reg [3:0] mem [0:3];

initial begin
    mem[0] = 4'd2;
    mem[1] = 4'd3;
    mem[2] = 0;
    mem[3] = 0;
end

assign rdata = mem[addr];

always @(posedge clk) begin
    if (we)
        mem[addr] <= wdata;
end

endmodule