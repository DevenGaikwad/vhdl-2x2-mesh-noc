library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.noc_pkg.all;
entity packet_receiver is
  generic(NODE : coord_t:=0; PACKETS : positive:=16);
  port(clk,rst : in std_logic; data : in packet_t; valid : in std_logic;
    ready : out std_logic; received : out natural; error : out std_logic);
end;
architecture rtl of packet_receiver is
  signal count : unsigned(15 downto 0):=(others=>'0');
  signal failed : std_logic:='0';
begin
  ready<='1';received<=to_integer(count);error<=failed;
  process(clk)
    variable payload,src,seq : natural;
  begin if rising_edge(clk) then
    if rst='1' then count<=(others=>'0');failed<='0';
    elsif valid='1' then
      count<=count+1;payload:=payload_of(data);src:=source_of(data);seq:=payload mod 65536;
      if not legal_packet(data) or destination_of(data)/=NODE or payload/65536/=src
        or seq>=PACKETS or seq mod 4/=NODE or id_of(data)/=seq mod 16 then failed<='1';end if;
    end if;
  end if;end process;
end;
