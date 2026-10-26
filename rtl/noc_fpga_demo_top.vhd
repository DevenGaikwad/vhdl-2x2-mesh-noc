library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.noc_pkg.all;
entity noc_fpga_demo_top is
  generic(DEPTH : positive:=4; PACKETS : positive:=16);
  port(clk,rst,start : in std_logic; done,error,busy : out std_logic;
    delivered : out std_logic_vector(15 downto 0));
end;
architecture structural of noc_fpga_demo_top is
  signal tx,rx : packets_t(0 to 3);
  signal tv,tr,rv,rr,finished,errors : std_logic_vector(3 downto 0);
  signal count : counts_t(0 to 3);
  signal total : natural;
  signal active : std_logic:='0';
begin
  assert PACKETS<=16383 report "Demo counters support at most 65532 total packets" severity failure;
  mesh : entity work.noc_2x2_core generic map(DEPTH)
    port map(clk,rst,tx,tv,tr,rx,rv,rr,open,open,open,open,open,open);
  nodes : for i in 0 to 3 generate
    endpoint : entity work.traffic_node generic map(i,PACKETS)
      port map(clk,rst,start,tx(i),tv(i),tr(i),rx(i),rv(i),rr(i),finished(i),errors(i),count(i));
  end generate;
  total<=count(0)+count(1)+count(2)+count(3);
  delivered<=std_logic_vector(to_unsigned(total,16));
  done<='1' when finished="1111" and total=4*PACKETS else '0';
  error<='1' when errors/="0000" else '0';
  busy<=active and not done;
  process(clk) begin if rising_edge(clk) then
    if rst='1' then active<='0';elsif start='1' then active<='1';end if;
  end if;end process;
end;
