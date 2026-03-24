module alu_4bit (
    input  [3:0] a,
    input  [3:0] b,
    input  [2:0] op,
    output reg [3:0] result,
    output reg       cout
);
always @(*) begin
    case (op)
        3'b000: {cout, result} = a + b;       // 加法
        3'b001: {cout, result} = a - b;       // 减法
        3'b010: begin
            result = a & b;
            cout = 0;
        end
        3'b011: begin
            result = a | b;
            cout = 0;
        end
        3'b100: begin
            result = a ^ b;
            cout = 0;
        end
        default: begin
            result = 0;
            cout = 0;
        end
    endcase
end

endmodule
