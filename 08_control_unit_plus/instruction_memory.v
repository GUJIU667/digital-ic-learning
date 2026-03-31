module imem (
    input [1:0] addr,
    output [7:0] instr
);

    reg [7:0] mem [0:3];

    initial begin
        mem[0] = 8'b00_00_01_10; // R2 = R0 + R1
        mem[1] = 8'b01_10_01_11; // R3 = R2 ^ R1
        mem[2] = 8'b00_10_11_00; // R0 = R2 + R3
        mem[3] = 8'b01_00_01_01; // R1 = R0 ^ R1
    end

    assign instr = mem[addr];

endmodule