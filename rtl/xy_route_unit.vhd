library ieee;
use ieee.std_logic_1164.all;
use work.noc_pkg.all;
entity xy_route_unit is
  generic(CURRENT : coord_t := 0);
  port(packet : in packet_t; requested_port : out natural);
end;
architecture rtl of xy_route_unit is
begin
  -- Do not convert uninitialised packet fields during the initial delta cycle.
  requested_port<=route_to(CURRENT,destination_of(packet)) when not is_x(packet) else L;
end;
