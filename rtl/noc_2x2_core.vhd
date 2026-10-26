library ieee;
use ieee.std_logic_1164.all;
use work.noc_pkg.all;
entity noc_2x2_core is
  generic(DEPTH : positive := BASELINE_DEPTH);
  port(clk,rst : in std_logic;
    inject_data : in packets_t(0 to 3); inject_valid : in std_logic_vector(3 downto 0);
    inject_ready : out std_logic_vector(3 downto 0);
    eject_data : out packets_t(0 to 3); eject_valid : out std_logic_vector(3 downto 0);
    eject_ready : in std_logic_vector(3 downto 0);
    dbg_count : out counts_t(0 to 19); dbg_req,dbg_grant : out masks_t(0 to 19);
    dbg_out_data : out packets_t(0 to 19);
    dbg_out_valid,dbg_out_ready : out std_logic_vector(19 downto 0));
end;
architecture structural of noc_2x2_core is
  type mesh_packets_t is array(0 to 3) of packets_t(0 to 4);
  type mesh_ports_t is array(0 to 3) of ports_t;
  type mesh_counts_t is array(0 to 3) of counts_t(0 to 4);
  type mesh_masks_t is array(0 to 3) of masks_t(0 to 4);
  signal inputs,outputs : mesh_packets_t;
  signal iv,ir,ov,orr : mesh_ports_t;
  signal occupancy : mesh_counts_t;
  signal req,grants : mesh_masks_t;
begin
  routers : for r in 0 to 3 generate
    tile : entity work.router generic map(CURRENT=>r,DEPTH=>DEPTH)
      port map(clk,rst,inputs(r),iv(r),ir(r),outputs(r),ov(r),orr(r),occupancy(r),req(r),grants(r));
    inputs(r)(L)<=inject_data(r);iv(r)(L)<=inject_valid(r);inject_ready(r)<=ir(r)(L);
    eject_data(r)<=outputs(r)(L);eject_valid(r)<=ov(r)(L);orr(r)(L)<=eject_ready(r);
    directions : for p in 0 to 3 generate
      live : if active_mask(r)(p)='1' generate
        constant OTHER : natural := neighbor(r,p);
        constant OPPOSITE : natural := reverse_port(p);
      begin
        inputs(r)(p)<=outputs(OTHER)(OPPOSITE);iv(r)(p)<=ov(OTHER)(OPPOSITE);
        orr(r)(p)<=ir(OTHER)(OPPOSITE);
      end generate;
      edge : if active_mask(r)(p)='0' generate
        inputs(r)(p)<=(others=>'0');iv(r)(p)<='0';orr(r)(p)<='0';
      end generate;
    end generate;
    debug : for p in 0 to 4 generate
      dbg_count(5*r+p)<=occupancy(r)(p);dbg_req(5*r+p)<=req(r)(p);dbg_grant(5*r+p)<=grants(r)(p);
      dbg_out_data(5*r+p)<=outputs(r)(p);dbg_out_valid(5*r+p)<=ov(r)(p);dbg_out_ready(5*r+p)<=orr(r)(p);
    end generate;
  end generate;
end;
