module pc (
    input clk,
    input rst,
    output reg [3:0] pc
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pc <= 4'b0000; // Reset to 0
        end else begin
            pc <= pc + 1; // Increment PC
        end
    end
    
endmodule