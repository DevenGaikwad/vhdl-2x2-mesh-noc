library ieee;
use ieee.std_logic_1164.all;
use work.noc_pkg.all;
entity packet_generator is
  generic(NODE : coord_t:=0; PACKETS : positive:=16);
  port(clk,rst,start : in std_logic; data : out packet_t;
    valid : out std_logic; ready : in std_logic; done : out std_logic);
end;
architecture rtl of packet_generator is
  signal sent : natural range 0 to PACKETS:=0;
  signal running : std_logic:='0';
begin
  data<=make_packet(NODE,sent mod 4,sent mod 16,NODE*65536+sent);
  valid<='1' when running='1' and sent<PACKETS else '0';
  done<='1' when sent=PACKETS else '0';
  process(clk) begin if rising_edge(clk) then
    if rst='1' then sent<=0;running<='0';
    else
      if start='1' then running<='1';end if;
      if valid='1' and ready='1' then sent<=sent+1;end if;
    end if;
  end if;end process;
end;
