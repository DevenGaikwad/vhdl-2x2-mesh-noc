library ieee;
use ieee.std_logic_1164.all;
use work.noc_pkg.all;
entity traffic_node is
  generic(NODE : coord_t:=0; PACKETS : positive:=16);
  port(clk,rst,start : in std_logic; tx : out packet_t; tx_valid : out std_logic;
    tx_ready : in std_logic; rx : in packet_t; rx_valid : in std_logic;
    rx_ready,done,error : out std_logic; received : out natural);
end;
architecture structural of traffic_node is
begin
  generator : entity work.packet_generator generic map(NODE,PACKETS)
    port map(clk,rst,start,tx,tx_valid,tx_ready,done);
  receiver : entity work.packet_receiver generic map(NODE,PACKETS)
    port map(clk,rst,rx,rx_valid,rx_ready,received,error);
end;
