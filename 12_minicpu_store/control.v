module control (
    input [1:0] opcode,
    input [1:0] rd,

    output reg we,
    output reg [2:0] alu_op,
    output reg mem_we,
    output reg mem_to_reg,
    output reg halt
);

always @(*) begin
    // 默认值
    we = 0;
    alu_op = 3'b000;
    mem_we = 0;
    mem_to_reg = 0;
    halt = 0;

    case (opcode)

        2'b00: begin // ADD
            we = 1;
            alu_op = 3'b000;
        end

        2'b01: begin // XOR
            we = 1;
            alu_op = 3'b100;
        end

        2'b10: begin // LOAD
            we = 1;
            mem_to_reg = 1;
        end

        2'b11: begin
            if (rd == 2'b00) begin
                halt = 1;
            end else begin
                mem_we = 1; // STORE
            end
        end

    endcase
end

endmodule