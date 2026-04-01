module control (
    input [1:0] opcode,
    output reg we,
    output reg [2:0] op,
    output reg halt,
    output reg jump
);

    always @(*) begin
        case (opcode)
            2'b00: begin // ADD
                we = 1;
                op = 3'b000;
                halt = 0;
                jump = 0;
            end

            2'b01: begin // XOR
                we = 1;
                op = 3'b100;
                halt = 0;
                jump = 0;
            end

            2'b10: begin // HALT
                we = 0;
                op = 3'b000;
                halt = 1;
                jump = 0;
            end

            2'b11: begin // JUMP
                we = 0;
                op = 3'b000;
                halt = 0;
                jump = 1;
            end

            default: begin
                we = 0;
                op = 3'b000;
                halt = 0;
                jump = 0;
            end
        endcase
    end

endmodule