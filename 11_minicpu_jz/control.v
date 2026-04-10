module control (
    input [1:0] opcode,
    input zero_flag,   // ⭐ 新增
    input is_jz,       // ⭐ 新增

    output reg we,
    output reg [2:0] op,
    output reg halt,
    output reg jump,
    output reg jz      // ⭐ 新增
);

    always @(*) begin
        case (opcode)
            2'b00: begin // ADD
                we = 1;
                op = 3'b000;
                halt = 0;
                jump = 0;
                jz = 0;
            end

            2'b01: begin // XOR
                we = 1;
                op = 3'b100;
                halt = 0;
                jump = 0;
                jz = 0;
            end

            2'b10: begin // HALT
                we = 0;
                op = 3'b000;
                halt = 1;
                jump = 0;
                jz = 0;
            end

            2'b11: begin // JUMP / JZ
                we = 0;
                op = 3'b000;
                halt = 0;

                if (is_jz) begin
                    jump = 0;
                    jz = zero_flag;  // ⭐ 关键：条件成立才跳
                end else begin
                    jump = 1;
                    jz = 0;
                end
            end

            default: begin
                we = 0;
                op = 3'b000;
                halt = 0;
                jump = 0;
                jz = 0;
            end
        endcase
    end

endmodule