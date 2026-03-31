library verilog;
use verilog.vl_types.all;
entity cpu_top is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        instr           : in     vl_logic_vector(7 downto 0)
    );
end cpu_top;
