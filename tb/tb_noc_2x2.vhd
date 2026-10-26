library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use std.env.all;
use work.noc_pkg.all;
entity tb_noc_2x2 is
 generic(DEPTH : positive:=4; SCENARIO : natural:=0; RATE : natural:=250;
   SEED : positive:=101; WARMUP : natural:=100; MEASURE : positive:=1000;
   TRACE_FILE : string:="trace.csv"; RUN_ID : string:="directed"; TRACE_LEVEL : natural:=2);
end;
architecture test of tb_noc_2x2 is
 signal clk : std_logic:='0';signal rst : std_logic:='1';
 signal tx,rx : packets_t(0 to 3):=(others=>(others=>'0'));
 signal tv,tr,rv,rr : std_logic_vector(3 downto 0):=(others=>'0');
 signal count : counts_t(0 to 19);signal req,grant : masks_t(0 to 19);
 signal od : packets_t(0 to 19);signal ov,orr : std_logic_vector(19 downto 0);
begin
 clk<=not clk after 5 ns;
 dut : entity work.noc_2x2_core generic map(DEPTH)
   port map(clk,rst,tx,tv,tr,rx,rv,rr,count,req,grant,od,ov,orr);
 process
  constant CAPACITY : positive:=16384;
  type packet_table_t is array(0 to CAPACITY-1) of packet_t;
  type int_table_t is array(0 to CAPACITY-1) of natural;
  type bool_table_t is array(0 to CAPACITY-1) of boolean;
  variable expected : packet_table_t;
  variable injection,location,hop,stream_seq : int_table_t:=(others=>0);
  variable pending : bool_table_t:=(others=>false);
  variable stream_in,stream_out : counts_t(0 to 15):=(others=>0);
  variable uid,cycle,accepted,delivered,discarded,phase,attempts,max_outstanding : natural:=0;
  variable link_seen : std_logic_vector(19 downto 0):=(others=>'0');
  variable pair_seen : std_logic_vector(15 downto 0):=(others=>'0');
  variable concurrent_edges : natural:=0;
  variable stall_seen,full_seen : boolean:=false;
  variable rng : unsigned(31 downto 0):=to_unsigned(SEED,32);
  variable pv : packets_t(0 to 3):=(others=>(others=>'0'));
  variable vv : std_logic_vector(3 downto 0):=(others=>'0');
  variable ln : line;
  file trace : text open write_mode is TRACE_FILE;
  procedure emit(event : string; r,p : natural; packet : packet_t; occupancy : integer:=-1) is
   variable row : line;
  begin
   write(row,RUN_ID&","&integer'image(SCENARIO)&","&integer'image(cycle)&","&integer'image(phase)&","&event&","&
     integer'image(r)&","&port_name(p)&","&integer'image(source_of(packet))&","&
     integer'image(destination_of(packet))&","&integer'image(id_of(packet))&","&
     integer'image(payload_of(packet))&","&to_hstring(packet)&","&integer'image(occupancy)&",,,");
   writeline(trace,row);
  end;
  procedure state_emit(r,p : natural) is
   variable row : line;variable j : natural;variable ready_char : character;
  begin
   j:=5*r+p;if orr(j)='1' then ready_char:='1';else ready_char:='0';end if;
   write(row,RUN_ID&","&integer'image(SCENARIO)&","&integer'image(cycle)&","&integer'image(phase)&",state,"&
    integer'image(r)&","&port_name(p)&",-1,-1,-1,-1,,"&integer'image(count(j))&","&
    integer'image(to_integer(unsigned(req(j))))&","&integer'image(to_integer(unsigned(grant(j))))&","&ready_char);
   writeline(trace,row);
  end;
  procedure sample is
   variable id,s,next_port,transfers,route_hops,outstanding,stream : natural;
  begin
   tv<=vv;tx<=pv;
   wait until rising_edge(clk);cycle:=cycle+1;transfers:=0;
   if rst='1' then
    for t in 1 to uid loop if pending(t) then
      pending(t):=false;discarded:=discarded+1;emit("reset_discard",location(t),L,expected(t));
    end if;end loop;
    stream_in:=(others=>0);stream_out:=(others=>0);
   else
    assert not is_x(tr & rv & ov & orr) report "Mesh control unknown" severity failure;
    for src in 0 to 3 loop
     if vv(src)='1' then
      attempts:=attempts+1;emit("offer",src,L,pv(src));
      if tr(src)='1' then
       id:=payload_of(pv(src));assert id<CAPACITY and not pending(id) report "Ambiguous transaction identity" severity failure;
       expected(id):=pv(src);pending(id):=true;injection(id):=cycle;location(id):=src;hop(id):=0;
       stream:=4*src+destination_of(pv(src));stream_seq(id):=stream_in(stream);stream_in(stream):=stream_in(stream)+1;
       accepted:=accepted+1;emit("inject",src,L,pv(src));vv(src):='0';
      end if;
     end if;
    end loop;
    for j in 0 to 19 loop
     if TRACE_LEVEL=2 then state_emit(j/5,j mod 5);end if;
     if count(j)=DEPTH then full_seen:=true;end if;
     if ov(j)='1' and orr(j)='0' then
      stall_seen:=true;if TRACE_LEVEL>0 then emit("stall",j/5,j mod 5,od(j));end if;
     end if;
     if j mod 5/=L and ov(j)='1' and orr(j)='1' then
      id:=payload_of(od(j));
      assert pending(id) and od(j)=expected(id) report "Unexpected/corrupt link packet" severity failure;
      next_port:=route_to(location(id),destination_of(od(j)));
      assert location(id)=j/5 and next_port=j mod 5 report "Non-XY or incorrect physical link" severity failure;
      location(id):=neighbor(j/5,j mod 5);hop(id):=hop(id)+1;link_seen(j):='1';transfers:=transfers+1;
      if TRACE_LEVEL>0 then emit("link",j/5,j mod 5,od(j));end if;
     end if;
    end loop;
    for dst in 0 to 3 loop
     if rv(dst)='1' and rr(dst)='1' then
      id:=payload_of(rx(dst));
      assert id<CAPACITY and pending(id) report "Unexpected/duplicate delivery" severity failure;
      assert rx(dst)=expected(id) and destination_of(rx(dst))=dst and location(id)=dst report "Corrupt/misrouted delivery" severity failure;
      s:=source_of(rx(dst));route_hops:=0;
      if s mod 2/=dst mod 2 then route_hops:=route_hops+1;end if;
      if s/2/=dst/2 then route_hops:=route_hops+1;end if;
      assert hop(id)=route_hops report "Wrong shortest path length" severity failure;
      stream:=4*s+dst;
      assert stream_seq(id)=stream_out(stream) report "Reorder within source/destination stream" severity failure;
      stream_out(stream):=stream_out(stream)+1;pending(id):=false;delivered:=delivered+1;
      pair_seen(4*s+dst):='1';transfers:=transfers+1;emit("deliver",dst,L,rx(dst));
     end if;
    end loop;
    if transfers>1 then concurrent_edges:=concurrent_edges+1;end if;
    outstanding:=accepted-delivered-discarded;
    if outstanding>max_outstanding then max_outstanding:=outstanding;end if;
   end if;
   assert cycle<30000 report "Mesh watchdog timeout" severity failure;
   wait until falling_edge(clk);
  end;
  procedure launch(s,d : natural) is
  begin
   assert vv(s)='0' report "Producer overwrote stalled request" severity failure;
   uid:=uid+1;assert uid<CAPACITY severity failure;
   pv(s):=make_packet(s,d,uid mod 16,uid);vv(s):='1';
  end;
  procedure drain is
  begin
   rr<="1111";
   for c in 0 to 5000 loop
    sample;exit when vv="0000" and accepted=delivered+discarded;
   end loop;
   assert accepted=delivered+discarded report "Unexplained packet loss after drain" severity failure;
   for t in 1 to uid loop assert not pending(t) report "Outstanding scoreboard entry" severity failure;end loop;
  end;
 begin
  write(ln,string'("run_id,scenario,cycle,phase,event,router,port,src,dst,packet_id,payload,packet_hex,fifo_count,req_mask,grant_mask,ready"));writeline(trace,ln);
  rr<="1111";sample;sample;rst<='0';
  if SCENARIO=0 then
   phase:=1;
   for s in 0 to 3 loop for d in 0 to 3 loop launch(s,d);drain;end loop;end loop;
   for c in 0 to 79 loop
    if c<35 then rr<="0000";else rr<="1111";end if;
    for s in 0 to 3 loop if vv(s)='0' then launch(s,1);end if;end loop;sample;
   end loop;drain;
   rr<="0000";
   for c in 0 to DEPTH+6 loop
    for s in 0 to 3 loop if vv(s)='0' then launch(s,(s+3) mod 4);end if;end loop;sample;
   end loop;
   vv:="0000";rst<='1';sample;sample;rst<='0';
   for s in 0 to 3 loop launch(s,s);end loop;drain;
   assert pair_seen=x"FFFF" report "Missing coordinate pair coverage" severity failure;
   for r in 0 to 3 loop for p in 0 to 3 loop
    if active_mask(r)(p)='1' then assert link_seen(5*r+p)='1' report "Directed link missing" severity failure;end if;
   end loop;end loop;
   assert discarded>0 and concurrent_edges>0 and full_seen and stall_seen report "Mesh coverage incomplete" severity failure;
  else
   for c in 0 to WARMUP+MEASURE-1 loop
    if c<WARMUP then phase:=0;else phase:=1;end if;
    if SCENARIO=7 and c mod 160<60 then rr<="0000";else rr<="1111";end if;
    for s in 0 to 3 loop
     rng:=rng xor shift_left(rng,13);rng:=rng xor shift_right(rng,17);rng:=rng xor shift_left(rng,5);
     if vv(s)='0' then
      case SCENARIO is
       when 1 => if s=0 and c mod 40=0 then launch(s,3);end if;
       when 2 => if s<2 and c mod 4=0 then launch(s,2+s);end if;
       when 3 => if to_integer(rng(15 downto 0)) mod 1000<RATE then launch(s,to_integer(rng(17 downto 16)));end if;
       when 4 => if to_integer(rng(15 downto 0)) mod 1000<RATE then launch(s,1);end if;
       when 5 => if c mod 100<20 then launch(s,(s+3) mod 4);end if;
       when 6 => launch(s,1);
       when 7 => if to_integer(rng(15 downto 0)) mod 1000<RATE then launch(s,(s+3) mod 4);end if;
       when others => assert false report "Unknown scenario" severity failure;
      end case;
     end if;
    end loop;sample;
   end loop;
   phase:=2;drain;
  end if;
  report "PASS tb_noc_2x2 accepted="&integer'image(accepted)&" delivered="&integer'image(delivered)&
   " reset_discarded="&integer'image(discarded)&" attempted_cycles="&integer'image(attempts)&
   " concurrent_edges="&integer'image(concurrent_edges)&" max_outstanding="&integer'image(max_outstanding) severity note;
  file_close(trace);finish;
 end process;
end;
