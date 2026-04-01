module pc (
    input clk,
    input rst,
    input halt,
    input jump,
    input [1:0] jump_addr,
    output reg [1:0] pc
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            pc <= 0;
        else if (halt)
            pc <= pc;          // 停住
        else if (jump)
            pc <= jump_addr;   // 跳转
        else
            pc <= pc + 1;      // 正常+1
    end

endmodule