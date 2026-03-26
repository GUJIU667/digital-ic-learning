module regfile_4x4 (
    input clk,
    input rst,
    input we,
    input [1:0] waddr,
    input [1:0] raddr,
    input [3:0] wdata,
    output [3:0] rdata
);
    reg [3:0] regfile [3:0];
    // Write operation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            regfile[0] <= 4'b0000;
            regfile[1] <= 4'b0000;
            regfile[2] <= 4'b0000;
            regfile[3] <= 4'b0000;
        end else if (we) begin
            regfile[waddr] <= wdata;
        end
    end

    // Read operation
    assign rdata = regfile[raddr];

endmodule
