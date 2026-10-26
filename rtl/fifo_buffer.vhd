library ieee;
use ieee.std_logic_1164.all;
use work.noc_pkg.all;
entity fifo_buffer is
  generic(DEPTH : positive := BASELINE_DEPTH);
  port(clk,rst : in std_logic;
    in_data : in packet_t; in_valid : in std_logic; in_ready : out std_logic;
    out_data : out packet_t; out_valid : out std_logic; out_ready : in std_logic;
    count : out natural);
end;
architecture rtl of fifo_buffer is
  type memory_t is array(0 to DEPTH-1) of packet_t;
  signal mem : memory_t;
  signal rd,wr : natural range 0 to DEPTH-1 := 0;
  signal used : natural range 0 to DEPTH := 0;
  function advance(p : natural) return natural is
  begin if p=DEPTH-1 then return 0; else return p+1; end if; end;
begin
  -- Capacity depends only on registered occupancy. A full FIFO refuses a
  -- simultaneous push even when a pop occurs: the producer retries next cycle.
  in_ready <= '1' when used<DEPTH else '0';
  out_valid <= '1' when used>0 else '0';
  out_data <= mem(rd) when used>0 else (others=>'0');
  count <= used;
  process(clk)
    variable push,pop : boolean;
  begin
    if rising_edge(clk) then
      if rst='1' then rd<=0;wr<=0;used<=0;
      else
        push:=in_valid='1' and used<DEPTH;
        pop:=out_ready='1' and used>0;
        if push then mem(wr)<=in_data;wr<=advance(wr);end if;
        if pop then rd<=advance(rd);end if;
        if push and not pop then used<=used+1;
        elsif pop and not push then used<=used-1;end if;
      end if;
    end if;
  end process;
end;
