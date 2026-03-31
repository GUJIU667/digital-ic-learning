module pc (
    input clk,
    input rst,
    input halt,
    output reg [3:0] pc
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pc <= 4'b0000; // Reset to 0
        end else if (halt) begin
            pc <= pc; // Hold PC value when halt is active
        end else begin
            pc <= pc + 1; // Increment PC
        end

    end
    
endmodule