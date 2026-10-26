library ieee;
use ieee.std_logic_1164.all;
use work.noc_pkg.all;
use std.env.all;
entity tb_rr_arbiter is end;
architecture test of tb_rr_arbiter is
 signal clk : std_logic:='0';signal rst : std_logic:='1';
 signal req,grant : ports_t:=(others=>'0');signal accept : std_logic:='0';signal pointer : natural range 0 to 4;
begin
 clk<=not clk after 5 ns;
 dut : entity work.rr_arbiter port map(clk,rst,req,accept,grant,pointer);
 process
  variable previous : ports_t;variable start,accepted,last : natural:=0;
  variable service,age : counts_t(0 to 4):=(others=>0);
 begin
  wait until rising_edge(clk);wait until falling_edge(clk);rst<='0';req<="11111";
  wait until rising_edge(clk);wait until falling_edge(clk);previous:=grant;start:=pointer;
  assert popcount(grant)=1 severity failure;
  req<="00000";
  for c in 0 to 7 loop
   wait until rising_edge(clk);wait until falling_edge(clk);
   assert grant=previous and pointer=start report "Arbiter grant/pointer changed under stall" severity failure;
  end loop;
  req<="11111";accept<='1';
  for c in 0 to 79 loop
   wait until rising_edge(clk);
   assert popcount(grant)<=1 report "Arbiter not one-hot" severity failure;
   if grant/="00000" then
    for i in 0 to 4 loop
     if grant(i)='1' then
      assert i=accepted mod 5 report "Round-robin sequence incorrect" severity failure;
      service(i):=service(i)+1;age(i):=0;last:=i;
     else age(i):=age(i)+1;assert age(i)<=5 report "Successful-grant fairness bound exceeded" severity failure;end if;
    end loop;
    accepted:=accepted+1;
   end if;
   wait until falling_edge(clk);
  end loop;
  for i in 0 to 4 loop assert service(i)>=7 report "Requester not repeatedly served" severity failure;end loop;
  rst<='1';wait until rising_edge(clk);wait until falling_edge(clk);
  assert grant="00000" and pointer=0 report "Arbiter reset failure" severity failure;
  report "PASS tb_rr_arbiter held grant, rotation, 5-successful-grant fairness" severity note;finish;
 end process;
end;
