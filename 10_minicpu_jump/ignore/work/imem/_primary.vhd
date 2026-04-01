library verilog;
use verilog.vl_types.all;
entity imem is
    port(
        addr            : in     vl_logic_vector(1 downto 0);
        instr           : out    vl_logic_vector(7 downto 0)
    );
end imem;
