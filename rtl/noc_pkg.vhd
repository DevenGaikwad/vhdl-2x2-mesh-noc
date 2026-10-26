library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
package noc_pkg is
  constant PACKET_WIDTH : positive := 32;
  constant BASELINE_DEPTH : positive := 4;
  constant N : natural := 0; constant S : natural := 1;
  constant E : natural := 2; constant W : natural := 3; constant L : natural := 4;
  subtype packet_t is std_logic_vector(31 downto 0);
  subtype ports_t is std_logic_vector(4 downto 0);
  type packets_t is array(natural range <>) of packet_t;
  type counts_t is array(natural range <>) of natural;
  type masks_t is array(natural range <>) of ports_t;
  subtype coord_t is natural range 0 to 3; -- linear index = X + 2*Y
  function make_packet(src,dst : coord_t; id,payload : natural) return packet_t;
  function source_of(p : packet_t) return coord_t;
  function destination_of(p : packet_t) return coord_t;
  function id_of(p : packet_t) return natural;
  function payload_of(p : packet_t) return natural;
  function legal_packet(p : packet_t) return boolean;
  function route_to(current,dest : coord_t) return natural;
  function active_mask(current : coord_t) return ports_t;
  function neighbor(current,port_id : natural) return natural;
  function reverse_port(port_id : natural) return natural;
  function port_name(port_id : natural) return string;
  function popcount(v : std_logic_vector) return natural;
end package;
package body noc_pkg is
  function make_packet(src,dst : coord_t; id,payload : natural) return packet_t is
    variable p : packet_t := (others=>'0');
  begin
    assert id<16 and payload<524288 report "Packet field outside range" severity failure;
    p(31):='1'; p(30 downto 29):="00"; -- DATA only; reserved types are unsupported
    p(28):=std_logic(to_unsigned(src mod 2,1)(0));
    p(27):=std_logic(to_unsigned(src/2,1)(0));
    p(26):=std_logic(to_unsigned(dst mod 2,1)(0));
    p(25):=std_logic(to_unsigned(dst/2,1)(0));
    p(24 downto 21):=std_logic_vector(to_unsigned(id,4));
    p(18 downto 0):=std_logic_vector(to_unsigned(payload,19));
    return p;
  end;
  function source_of(p : packet_t) return coord_t is
  begin return to_integer(unsigned(p(28 downto 28)))+2*to_integer(unsigned(p(27 downto 27))); end;
  function destination_of(p : packet_t) return coord_t is
  begin return to_integer(unsigned(p(26 downto 26)))+2*to_integer(unsigned(p(25 downto 25))); end;
  function id_of(p : packet_t) return natural is
  begin return to_integer(unsigned(p(24 downto 21))); end;
  function payload_of(p : packet_t) return natural is
  begin return to_integer(unsigned(p(18 downto 0))); end;
  function legal_packet(p : packet_t) return boolean is
  begin return not is_x(p) and p(31)='1' and p(30 downto 29)="00"; end;
  function route_to(current,dest : coord_t) return natural is
  begin
    if dest mod 2 > current mod 2 then return E;
    elsif dest mod 2 < current mod 2 then return W;
    elsif dest/2 > current/2 then return S;
    elsif dest/2 < current/2 then return N;
    else return L; end if;
  end;
  function active_mask(current : coord_t) return ports_t is
    variable m : ports_t := (others=>'0');
  begin
    m(L):='1';
    if current mod 2=0 then m(E):='1'; else m(W):='1'; end if;
    if current/2=0 then m(S):='1'; else m(N):='1'; end if;
    return m;
  end;
  function neighbor(current,port_id : natural) return natural is
  begin
    case port_id is
      when N => return current-2;
      when S => return current+2;
      when E => return current+1;
      when W => return current-1;
      when others => return current;
    end case;
  end;
  function reverse_port(port_id : natural) return natural is
  begin case port_id is when N=>return S; when S=>return N;
    when E=>return W; when W=>return E; when others=>return L; end case; end;
  function port_name(port_id : natural) return string is
  begin case port_id is when N=>return "N"; when S=>return "S";
    when E=>return "E"; when W=>return "W"; when others=>return "L"; end case; end;
  function popcount(v : std_logic_vector) return natural is
    variable c : natural:=0;
  begin for i in v'range loop if v(i)='1' then c:=c+1; end if; end loop; return c; end;
end package body;
