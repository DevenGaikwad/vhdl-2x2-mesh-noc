library ieee;
use ieee.std_logic_1164.all;
use work.noc_pkg.all;
entity rr_arbiter is
  port(clk,rst : in std_logic; req : in ports_t; accept : in std_logic;
    grant : out ports_t; pointer : out natural range 0 to 4);
end;
architecture rtl of rr_arbiter is
  signal held : ports_t := (others=>'0');
  signal start : natural range 0 to 4 := 0;
begin
  grant<=held;pointer<=start;
  process(clk)
    variable next_grant : ports_t;
    variable index : natural;
    variable found : boolean;
  begin
    if rising_edge(clk) then
      if rst='1' then held<=(others=>'0');start<=0;
      elsif held/="00000" then
        if accept='1' then
          for i in 0 to 4 loop if held(i)='1' then start<=(i+1) mod 5;end if;end loop;
          held<=(others=>'0'); -- deliberate one-cycle arbitration bubble
        end if;
      else
        next_grant:=(others=>'0');found:=false;
        for offset in 0 to 4 loop
          index:=(start+offset) mod 5;
          if req(index)='1' and not found then next_grant(index):='1';found:=true;end if;
        end loop;
        held<=next_grant;
      end if;
    end if;
  end process;
end;
