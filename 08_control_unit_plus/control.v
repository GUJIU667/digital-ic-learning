module control (
    input [1:0] opcode,
    output reg we,
    output reg [2:0] op
);

    always @(*) begin
        case (opcode)
            2'b00: begin // ADD
                we = 1;
                op = 3'b000;
            end
            2'b01: begin // XOR
                we = 1;
                op = 3'b100;
            end
            default: begin
                we = 0;
                op = 3'b000;
            end
        endcase
    end

endmodule

