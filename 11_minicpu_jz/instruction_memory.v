module imem (
    input  [1:0] addr,
    output reg [7:0] instr
);

    always @(*) begin
        case (addr)
            2'd0: instr = 8'b01_00_00_00; // XOR R0,R0 → 清零 → zero_flag=1
            2'd1: instr = 8'b11_10_00_11; // JZ addr=3（bit5=1）
            2'd2: instr = 8'b00_00_00_00; // ADD（不该执行）
            2'd3: instr = 8'b10_00_00_00; // HALT

            default: instr = 8'b10_00_00_00;
        endcase
    end

endmodule