library ieee;
use ieee.std_logic_1164.all;
use work.noc_pkg.all;
entity crossbar_5x5 is
  port(heads : in packets_t(0 to 4); grants : in masks_t(0 to 4);
    outputs : out packets_t(0 to 4));
end;
architecture rtl of crossbar_5x5 is
begin
  process(all)
    variable data : packets_t(0 to 4);
  begin
    data:=(others=>(others=>'0'));
    for o in 0 to 4 loop
      for i in 0 to 4 loop if grants(o)(i)='1' then data(o):=heads(i);end if;end loop;
    end loop;
    outputs<=data;
  end process;
end;
