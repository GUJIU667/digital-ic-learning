module pc (
    input clk,
    input rst,
    input halt,
    output reg [1:0] pc
);

always @(posedge clk or posedge rst) begin
    if (rst)
        pc <= 0;
    else if (!halt)
        pc <= pc + 1;
end

endmodule