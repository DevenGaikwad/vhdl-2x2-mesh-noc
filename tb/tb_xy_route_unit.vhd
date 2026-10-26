library ieee;
use ieee.std_logic_1164.all;
use work.noc_pkg.all;
use std.env.all;
entity tb_xy_route_unit is end;
architecture test of tb_xy_route_unit is
 signal packet : packet_t:=(others=>'0');signal routes : counts_t(0 to 3);
begin
 route_instances : for c in 0 to 3 generate
  dut : entity work.xy_route_unit generic map(c) port map(packet,routes(c));
 end generate;
 process variable expected : natural;variable p : packet_t;
 begin
  for d in 0 to 3 loop
   packet<=make_packet(0,d,15,524287);wait for 1 ns;
   for c in 0 to 3 loop
    if c mod 2<d mod 2 then expected:=E;elsif c mod 2>d mod 2 then expected:=W;
    elsif c/2<d/2 then expected:=S;elsif c/2>d/2 then expected:=N;else expected:=L;end if;
    assert routes(c)=expected and active_mask(c)(expected)='1' report "XY route mismatch" severity failure;
   end loop;
  end loop;
  for src in 0 to 3 loop for dst in 0 to 3 loop
   p:=make_packet(src,dst,11,327683);
   assert source_of(p)=src and destination_of(p)=dst and id_of(p)=11 and payload_of(p)=327683 and legal_packet(p)
    report "Packet roundtrip failure" severity failure;
  end loop;end loop;
  p(30 downto 29):="11";assert not legal_packet(p) severity failure;
  report "PASS tb_xy_route_unit all 16 routes and packet roundtrip" severity note;finish;
 end process;
end;
