library ieee;
use ieee.std_logic_1164.all;
use work.noc_pkg.all;
entity router is
  generic(CURRENT : coord_t := 0; DEPTH : positive := BASELINE_DEPTH);
  port(clk,rst : in std_logic;
    in_data : in packets_t(0 to 4); in_valid : in ports_t; in_ready : out ports_t;
    out_data : out packets_t(0 to 4); out_valid : out ports_t; out_ready : in ports_t;
    dbg_count : out counts_t(0 to 4); dbg_req,dbg_grant : out masks_t(0 to 4));
end;
architecture rtl of router is
  constant ACTIVE : ports_t := active_mask(CURRENT);
  signal heads : packets_t(0 to 4);
  signal available,pop,accepted : ports_t;
  signal requests,grants : masks_t(0 to 4);
  signal routes : counts_t(0 to 4);
begin
  inputs : for i in 0 to 4 generate
    live : if ACTIVE(i)='1' generate
      fifo : entity work.fifo_buffer generic map(DEPTH=>DEPTH)
        port map(clk,rst,in_data(i),in_valid(i),in_ready(i),heads(i),available(i),pop(i),dbg_count(i));
      route : entity work.xy_route_unit generic map(CURRENT=>CURRENT)
        port map(heads(i),routes(i));
    end generate;
    edge : if ACTIVE(i)='0' generate
      in_ready(i)<='0';heads(i)<=(others=>'0');available(i)<='0';dbg_count(i)<=0;routes(i)<=L;
    end generate;
  end generate;
  process(all)
    variable req : masks_t(0 to 4);
    variable reads : ports_t;
  begin
    req:=(others=>(others=>'0'));reads:=(others=>'0');
    for i in 0 to 4 loop
      if available(i)='1' and ACTIVE(routes(i))='1' then req(routes(i))(i):='1';end if;
      for o in 0 to 4 loop
        if grants(o)(i)='1' and accepted(o)='1' then reads(i):='1';end if;
      end loop;
    end loop;
    requests<=req;pop<=reads;
  end process;
  outputs : for o in 0 to 4 generate
    live : if ACTIVE(o)='1' generate
      arb : entity work.rr_arbiter port map(clk,rst,requests(o),accepted(o),grants(o),open);
      out_valid(o)<='1' when grants(o)/="00000" else '0';
      accepted(o)<=out_valid(o) and out_ready(o);
    end generate;
    edge : if ACTIVE(o)='0' generate
      grants(o)<=(others=>'0');out_valid(o)<='0';accepted(o)<='0';
    end generate;
  end generate;
  crossbar : entity work.crossbar_5x5 port map(heads,grants,out_data);
  dbg_req<=requests;dbg_grant<=grants;
  -- synthesis translate_off
  process(clk)
    variable offered : packets_t(0 to 4) := (others=>(others=>'0'));
    variable stalled : ports_t := (others=>'0');
    variable selected : natural;
  begin
    if rising_edge(clk) then
      if rst='1' then stalled:=(others=>'0');
      else
        assert not is_x(in_valid & out_ready & out_valid & in_ready) report "Unknown router control" severity failure;
        for o in 0 to 4 loop
          assert popcount(grants(o))<=1 report "Non one-hot grant" severity failure;
          assert ACTIVE(o)='1' or (requests(o)="00000" and out_valid(o)='0') report "Boundary selected" severity failure;
          if stalled(o)='1' then
            assert out_valid(o)='1' and out_data(o)=offered(o) report "Output changed during stall" severity failure;
          end if;
          stalled(o):=out_valid(o) and not out_ready(o);offered(o):=out_data(o);
        end loop;
        for i in 0 to 4 loop
          selected:=0;
          for o in 0 to 4 loop if grants(o)(i)='1' then selected:=selected+1;end if;end loop;
          assert selected<=1 report "Input selected by multiple outputs" severity failure;
          if available(i)='1' then
            assert ACTIVE(routes(i))='1' report "Illegal next hop" severity failure;
          end if;
          if in_valid(i)='1' and in_ready(i)='1' then
            assert legal_packet(in_data(i)) report "Unsupported packet encoding" severity failure;
          end if;
        end loop;
      end if;
    end if;
  end process;
  -- synthesis translate_on
end;
