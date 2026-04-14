module imem (
    input [1:0] addr,
    output reg [7:0] instr
);

always @(*) begin
    case (addr)
        2'd0: instr = 8'b10_00_00_01; // LOAD r1, [r0]
        2'd1: instr = 8'b10_00_00_10; // LOAD r2, [r0]
        2'd2: instr = 8'b00_01_10_11; // ADD r3 = r1 + r2
        2'd3: instr = 8'b11_00_11_01; // STORE r3 -> mem[r0]
    endcase
end

endmodule