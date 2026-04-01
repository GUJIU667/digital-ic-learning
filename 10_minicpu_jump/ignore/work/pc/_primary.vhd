library verilog;
use verilog.vl_types.all;
entity pc is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        halt            : in     vl_logic;
        jump            : in     vl_logic;
        jump_addr       : in     vl_logic_vector(1 downto 0);
        pc              : out    vl_logic_vector(1 downto 0)
    );
end pc;
