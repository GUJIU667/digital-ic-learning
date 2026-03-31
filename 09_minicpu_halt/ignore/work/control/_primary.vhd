library verilog;
use verilog.vl_types.all;
entity control is
    port(
        opcode          : in     vl_logic_vector(1 downto 0);
        we              : out    vl_logic;
        op              : out    vl_logic_vector(2 downto 0);
        halt            : out    vl_logic
    );
end control;
