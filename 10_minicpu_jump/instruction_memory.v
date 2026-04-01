module imem (
    input [1:0] addr,
    output [7:0] instr
);

    reg [7:0] mem [0:3];

    initial begin
    mem[0] = 8'b00_00_01_10; // R2 = R0 + R1
    mem[1] = 8'b01_10_01_11; // R3 = R2 ^ R1
    mem[2] = 8'b11_00_00_00; // JUMP to 0
    mem[3] = 8'b10_00_00_00; // HALT（执行不到）
end

    assign instr = mem[addr];

endmodule