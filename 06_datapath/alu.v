module alu_4bit (
    input [3:0] a,
    input [3:0] b,
    input [2:0] op,
    output reg [3:0] result,
    output reg cout
);

    always @(*) begin
        case (op)
            3'b000: {cout, result} = a + b;
            3'b001: {cout, result} = a - b;
            3'b010: result = a & b;
            3'b011: result = a | b;
            3'b100: result = a ^ b;
            default: result = 0;
        endcase
    end

endmodule