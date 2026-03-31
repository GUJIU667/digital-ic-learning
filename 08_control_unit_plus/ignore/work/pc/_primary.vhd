library verilog;
use verilog.vl_types.all;
entity pc is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pc              : out    vl_logic_vector(3 downto 0)
    );
end pc;
