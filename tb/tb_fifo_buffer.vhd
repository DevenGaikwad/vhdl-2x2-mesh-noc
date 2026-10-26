library ieee;
use ieee.std_logic_1164.all;
use work.noc_pkg.all;
use std.env.all;
entity tb_fifo_buffer is generic(DEPTH : positive:=4);end;
architecture test of tb_fifo_buffer is
 signal clk : std_logic:='0';signal rst : std_logic:='1';
 signal iv,ir,ov,orr : std_logic:='0';signal din,dout : packet_t:=(others=>'0');
 signal count : natural;
begin
 clk<=not clk after 5 ns;
 dut : entity work.fifo_buffer generic map(DEPTH) port map(clk,rst,din,iv,ir,dout,ov,orr,count);
 process
  type queue_t is array(0 to 4095) of packet_t;
  variable q : queue_t;variable writes,reads,used : natural:=0;
  variable full_seen,simultaneous,full_pop,wrapped : boolean:=false;
  variable push,pop : boolean;
  procedure sample is
  begin
   wait until rising_edge(clk);
   assert count=used report "FIFO count mismatch" severity failure;
   assert (ir='1')=(used<DEPTH) and (ov='1')=(used>0) report "FIFO flags mismatch" severity failure;
   if ov='1' then assert dout=q(reads) report "FIFO order/data mismatch" severity failure;end if;
   push:=iv='1' and ir='1';pop:=ov='1' and orr='1';
   if used=DEPTH then full_seen:=true;
    if pop then full_pop:=true;assert not push report "Full boundary must reject push" severity failure;end if;
   end if;
   if push then q(writes):=din;writes:=writes+1;end if;
   if pop then reads:=reads+1;end if;
   if push and pop then simultaneous:=true;
   elsif push then used:=used+1;elsif pop then used:=used-1;end if;
   if writes>4*DEPTH and reads>4*DEPTH then wrapped:=true;end if;
   wait until falling_edge(clk);
  end;
 begin
  wait until rising_edge(clk);wait until falling_edge(clk);rst<='0';
  for c in 0 to 1199 loop
   din<=make_packet(0,1,c mod 16,c);
   if c<DEPTH+5 or c mod 7/=0 then iv<='1';else iv<='0';end if;
   if c<DEPTH+5 or c mod 11<4 then orr<='0';else orr<='1';end if;
   sample;
  end loop;
  iv<='0';orr<='1';for c in 0 to DEPTH+2 loop sample;end loop;
  assert used=0 and writes=reads and full_seen and full_pop and wrapped report "FIFO coverage incomplete" severity failure;
  if DEPTH>1 then assert simultaneous report "Simultaneous FIFO test missing" severity failure;end if;
  iv<='1';orr<='0';din<=make_packet(0,0,0,42);sample;
  rst<='1';wait until rising_edge(clk);wait until falling_edge(clk);
  assert count=0 and ov='0' report "FIFO reset did not flush" severity failure;
  report "PASS tb_fifo_buffer depth="&integer'image(DEPTH)&" writes="&integer'image(writes) severity note;
  finish;
 end process;
end;
