library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;
entity tb_demo is end;
architecture test of tb_demo is
 signal clk : std_logic:='0';signal rst : std_logic:='1';signal start : std_logic:='0';
 signal done,error,busy : std_logic;signal delivered : std_logic_vector(15 downto 0);
begin
 clk<=not clk after 5 ns;
 dut : entity work.noc_fpga_demo_top port map(clk,rst,start,done,error,busy,delivered);
 process begin
  wait until rising_edge(clk);wait until falling_edge(clk);rst<='0';start<='1';
  wait until rising_edge(clk);wait until falling_edge(clk);start<='0';
  for c in 0 to 2000 loop
   wait until rising_edge(clk);wait until falling_edge(clk);exit when done='1';
  end loop;
  assert done='1' and error='0' and to_integer(unsigned(delivered))=64 report "Demo status/count failure" severity failure;
  report "PASS tb_demo 64 delivered" severity note;finish;
 end process;
end;
