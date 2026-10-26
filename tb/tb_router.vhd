library ieee;
use ieee.std_logic_1164.all;
use work.noc_pkg.all;
use std.env.all;
entity tb_router is generic(CURRENT : coord_t:=0; DEPTH : positive:=4);end;
architecture test of tb_router is
 signal clk : std_logic:='0';signal rst : std_logic:='1';
 signal din,dout : packets_t(0 to 4):=(others=>(others=>'0'));
 signal iv,ir,ov,orr : ports_t:=(others=>'0');signal count : counts_t(0 to 4);
 signal req,grant : masks_t(0 to 4);
begin
 clk<=not clk after 5 ns;
 dut : entity work.router generic map(CURRENT,DEPTH) port map(clk,rst,din,iv,ir,dout,ov,orr,count,req,grant);
 process
  type table_t is array(0 to 4095) of packet_t;
  type flags_t is array(0 to 4095) of boolean;
  variable expected : table_t;variable pending : flags_t:=(others=>false);
  variable uid,accepted,delivered,cycles,concurrent,stall_cycles,contentions : natural:=0;
  variable seq : counts_t(0 to 4):=(others=>0);
  variable p : packet_t;variable dest,o : natural;
  constant ACTIVE : ports_t:=active_mask(CURRENT);
  procedure sample is variable txns,idx : natural;
  begin
   wait until rising_edge(clk);cycles:=cycles+1;txns:=0;
   for i in 0 to 4 loop
    if iv(i)='1' and ir(i)='1' then
     idx:=payload_of(din(i));expected(idx):=din(i);pending(idx):=true;accepted:=accepted+1;
    end if;
   end loop;
   for output in 0 to 4 loop
    if popcount(req(output))>1 then contentions:=contentions+1;end if;
    if ov(output)='1' and orr(output)='0' then stall_cycles:=stall_cycles+1;end if;
    if ov(output)='1' and orr(output)='1' then
     idx:=payload_of(dout(output));
     assert pending(idx) and expected(idx)=dout(output) report "Router unexpected/duplicate/corrupt packet" severity failure;
     assert route_to(CURRENT,destination_of(dout(output)))=output report "Router wrong output" severity failure;
     pending(idx):=false;delivered:=delivered+1;txns:=txns+1;
    end if;
   end loop;
   if txns>1 then concurrent:=concurrent+1;end if;
   wait until falling_edge(clk);
  end;
  procedure idle_drain is begin
   iv<=(others=>'0');orr<=ACTIVE;
   for c in 0 to 100 loop sample;exit when accepted=delivered;end loop;
   assert accepted=delivered report "Router drain loss" severity failure;
  end;
 begin
  wait until rising_edge(clk);wait until falling_edge(clk);rst<='0';
  for output in 0 to 4 loop
   if ACTIVE(output)='1' then
    dest:=CURRENT;
    for d in 0 to 3 loop if route_to(CURRENT,d)=output then dest:=d;exit;end if;end loop;
    for i in 0 to 4 loop if ACTIVE(i)='1' then
     uid:=uid+1;din(i)<=make_packet(i mod 4,dest,uid mod 16,uid);end if;end loop;
    iv<=ACTIVE;orr<=(others=>'0');sample;iv<=(others=>'0');
    for c in 0 to 8 loop sample;end loop;
    idle_drain;
   end if;
  end loop;
  -- Three independent inputs each request a distinct output on the same edge.
  o:=0;
  for i in 0 to 4 loop if ACTIVE(i)='1' then
   while ACTIVE(o)='0' loop o:=o+1;end loop;
   dest:=CURRENT;for d in 0 to 3 loop if route_to(CURRENT,d)=o then dest:=d;exit;end if;end loop;
   uid:=uid+1;din(i)<=make_packet(i mod 4,dest,uid mod 16,uid);o:=o+1;
  end if;end loop;
  iv<=ACTIVE;orr<=ACTIVE;sample;idle_drain;
  assert concurrent>0 and stall_cycles>0 and contentions>0 report "Router coverage incomplete" severity failure;
  report "PASS tb_router coordinate="&integer'image(CURRENT)&" accepted="&integer'image(accepted)&
   " delivered="&integer'image(delivered)&" concurrent="&integer'image(concurrent) severity note;finish;
 end process;
end;
