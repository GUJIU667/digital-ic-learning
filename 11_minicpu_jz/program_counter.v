module pc (
    input clk,
    input rst,
    input halt,
    input jump,
    input jz,              // ⭐ 新增
    input [1:0] jump_addr,
    output reg [1:0] pc
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            pc <= 0;
        else if (halt)
            pc <= pc;
        else if (jump || jz)   // ⭐ 关键
            pc <= jump_addr;
        else
            pc <= pc + 1;
    end

endmodule