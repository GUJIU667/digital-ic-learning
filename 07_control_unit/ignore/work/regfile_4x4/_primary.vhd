library verilog;
use verilog.vl_types.all;
entity regfile_4x4 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        we              : in     vl_logic;
        waddr           : in     vl_logic_vector(1 downto 0);
        wdata           : in     vl_logic_vector(3 downto 0);
        raddr1          : in     vl_logic_vector(1 downto 0);
        rdata1          : out    vl_logic_vector(3 downto 0);
        raddr2          : in     vl_logic_vector(1 downto 0);
        rdata2          : out    vl_logic_vector(3 downto 0)
    );
end regfile_4x4;
