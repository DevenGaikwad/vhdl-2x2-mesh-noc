library ieee;
use ieee.std_logic_1164.all;
use work.noc_pkg.all;
entity noc_2x2_core is
  generic (
    DEPTH: positive := 4
  );
  port (
    clk, rst: in std_logic;
    inject_data: in packets_t (0 to 3);
    inject_valid: in std_logic_vector (3 downto 0);
    inject_ready: out std_logic_vector (3 downto 0);
    eject_data: out packets_t (0 to 3);
    eject_valid: out std_logic_vector (3 downto 0);
    eject_ready: in std_logic_vector (3 downto 0);
    dbg_count: out counts_t (0 to 19);
    dbg_req, dbg_grant: out masks_t (0 to 19);
    dbg_out_data: out packets_t (0 to 19);
    dbg_out_valid, dbg_out_ready: out std_logic_vector (19 downto 0)
  );
end;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity xy_route_unit_3 is
  port (
    packet : in std_logic_vector (31 downto 0);
    requested_port : out std_logic_vector (30 downto 0));
end entity xy_route_unit_3;

architecture rtl of xy_route_unit_3 is
  signal n3000_o : std_logic;
  signal n3001_o : std_logic_vector (30 downto 0);
  signal n3002_o : std_logic_vector (31 downto 0);
  signal n3003_o : std_logic;
  signal n3004_o : std_logic_vector (30 downto 0);
  signal n3005_o : std_logic_vector (31 downto 0);
  signal n3007_o : std_logic_vector (31 downto 0);
  signal n3008_o : std_logic_vector (31 downto 0);
  signal n3009_o : std_logic_vector (1 downto 0);
  signal n3014_o : std_logic_vector (31 downto 0);
  signal n3015_o : std_logic;
  signal n3016_o : std_logic_vector (31 downto 0);
  signal n3018_o : std_logic;
  signal n3020_o : std_logic_vector (31 downto 0);
  signal n3021_o : std_logic;
  signal n3022_o : std_logic_vector (31 downto 0);
  signal n3024_o : std_logic;
  signal n3026_o : std_logic_vector (31 downto 0);
  signal n3028_o : std_logic_vector (31 downto 0);
  signal n3030_o : std_logic;
  signal n3032_o : std_logic_vector (31 downto 0);
  signal n3034_o : std_logic_vector (31 downto 0);
  signal n3036_o : std_logic;
  signal n3039_o : std_logic_vector (30 downto 0);
  signal n3040_o : std_logic_vector (30 downto 0);
  signal n3041_o : std_logic_vector (30 downto 0);
  signal n3042_o : std_logic_vector (30 downto 0);
  signal n3044_o : std_logic_vector (30 downto 0);
begin
  requested_port <= n3044_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:37
  n3000_o <= packet (26);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:16
  n3001_o <= "000000000000000000000000000000" & n3000_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:53
  n3002_o <= "0" & n3001_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:77
  n3003_o <= packet (25);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:56
  n3004_o <= "000000000000000000000000000000" & n3003_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:55
  n3005_o <= "0" & n3004_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:55
  n3007_o <= std_logic_vector (resize (signed'("00000000000000000000000000000010") * signed (n3005_o), 32));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:53
  n3008_o <= std_logic_vector (unsigned (n3002_o) + unsigned (n3007_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:9
  n3009_o <= n3008_o (1 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:54:13
  n3014_o <= "000000000000000000000000000000" & n3009_o;  --  uext
  n3015_o <= n3014_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:54:13
  n3016_o <= "0000000000000000000000000000000" & n3015_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:54:19
  n3018_o <= '1' when signed (n3016_o) > signed'("00000000000000000000000000000001") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:55:16
  n3020_o <= "000000000000000000000000000000" & n3009_o;  --  uext
  n3021_o <= n3020_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:55:16
  n3022_o <= "0000000000000000000000000000000" & n3021_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:55:22
  n3024_o <= '1' when signed (n3022_o) < signed'("00000000000000000000000000000001") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:56:15
  n3026_o <= "000000000000000000000000000000" & n3009_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:56:15
  n3028_o <= std_logic_vector (signed (n3026_o) / signed'("00000000000000000000000000000010"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:56:18
  n3030_o <= '1' when signed (n3028_o) > signed'("00000000000000000000000000000001") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:57:15
  n3032_o <= "000000000000000000000000000000" & n3009_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:57:15
  n3034_o <= std_logic_vector (signed (n3032_o) / signed'("00000000000000000000000000000010"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:57:18
  n3036_o <= '1' when signed (n3034_o) < signed'("00000000000000000000000000000001") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:57:5
  n3039_o <= "0000000000000000000000000000100" when n3036_o = '0' else "0000000000000000000000000000000";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:56:5
  n3040_o <= n3039_o when n3030_o = '0' else "0000000000000000000000000000001";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:55:5
  n3041_o <= n3040_o when n3024_o = '0' else "0000000000000000000000000000011";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:54:5
  n3042_o <= n3041_o when n3018_o = '0' else "0000000000000000000000000000010";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/xy_route_unit.vhd:11:60
  n3044_o <= "0000000000000000000000000000100" when std_logic'('1') = '0' else n3042_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity xy_route_unit_2 is
  port (
    packet : in std_logic_vector (31 downto 0);
    requested_port : out std_logic_vector (30 downto 0));
end entity xy_route_unit_2;

architecture rtl of xy_route_unit_2 is
  signal n2947_o : std_logic;
  signal n2948_o : std_logic_vector (30 downto 0);
  signal n2949_o : std_logic_vector (31 downto 0);
  signal n2950_o : std_logic;
  signal n2951_o : std_logic_vector (30 downto 0);
  signal n2952_o : std_logic_vector (31 downto 0);
  signal n2954_o : std_logic_vector (31 downto 0);
  signal n2955_o : std_logic_vector (31 downto 0);
  signal n2956_o : std_logic_vector (1 downto 0);
  signal n2961_o : std_logic_vector (31 downto 0);
  signal n2962_o : std_logic;
  signal n2963_o : std_logic_vector (31 downto 0);
  signal n2965_o : std_logic;
  signal n2967_o : std_logic_vector (31 downto 0);
  signal n2968_o : std_logic;
  signal n2969_o : std_logic_vector (31 downto 0);
  signal n2971_o : std_logic;
  signal n2973_o : std_logic_vector (31 downto 0);
  signal n2975_o : std_logic_vector (31 downto 0);
  signal n2977_o : std_logic;
  signal n2979_o : std_logic_vector (31 downto 0);
  signal n2981_o : std_logic_vector (31 downto 0);
  signal n2983_o : std_logic;
  signal n2986_o : std_logic_vector (30 downto 0);
  signal n2987_o : std_logic_vector (30 downto 0);
  signal n2988_o : std_logic_vector (30 downto 0);
  signal n2989_o : std_logic_vector (30 downto 0);
  signal n2991_o : std_logic_vector (30 downto 0);
begin
  requested_port <= n2991_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:37
  n2947_o <= packet (26);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:16
  n2948_o <= "000000000000000000000000000000" & n2947_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:53
  n2949_o <= "0" & n2948_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:77
  n2950_o <= packet (25);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:56
  n2951_o <= "000000000000000000000000000000" & n2950_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:55
  n2952_o <= "0" & n2951_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:55
  n2954_o <= std_logic_vector (resize (signed'("00000000000000000000000000000010") * signed (n2952_o), 32));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:53
  n2955_o <= std_logic_vector (unsigned (n2949_o) + unsigned (n2954_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:9
  n2956_o <= n2955_o (1 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:54:13
  n2961_o <= "000000000000000000000000000000" & n2956_o;  --  uext
  n2962_o <= n2961_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:54:13
  n2963_o <= "0000000000000000000000000000000" & n2962_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:54:19
  n2965_o <= '1' when signed (n2963_o) > signed'("00000000000000000000000000000000") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:55:16
  n2967_o <= "000000000000000000000000000000" & n2956_o;  --  uext
  n2968_o <= n2967_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:55:16
  n2969_o <= "0000000000000000000000000000000" & n2968_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:55:22
  n2971_o <= '1' when signed (n2969_o) < signed'("00000000000000000000000000000000") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:56:15
  n2973_o <= "000000000000000000000000000000" & n2956_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:56:15
  n2975_o <= std_logic_vector (signed (n2973_o) / signed'("00000000000000000000000000000010"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:56:18
  n2977_o <= '1' when signed (n2975_o) > signed'("00000000000000000000000000000001") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:57:15
  n2979_o <= "000000000000000000000000000000" & n2956_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:57:15
  n2981_o <= std_logic_vector (signed (n2979_o) / signed'("00000000000000000000000000000010"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:57:18
  n2983_o <= '1' when signed (n2981_o) < signed'("00000000000000000000000000000001") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:57:5
  n2986_o <= "0000000000000000000000000000100" when n2983_o = '0' else "0000000000000000000000000000000";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:56:5
  n2987_o <= n2986_o when n2977_o = '0' else "0000000000000000000000000000001";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:55:5
  n2988_o <= n2987_o when n2971_o = '0' else "0000000000000000000000000000011";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:54:5
  n2989_o <= n2988_o when n2965_o = '0' else "0000000000000000000000000000010";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/xy_route_unit.vhd:11:60
  n2991_o <= "0000000000000000000000000000100" when std_logic'('1') = '0' else n2989_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity xy_route_unit_1 is
  port (
    packet : in std_logic_vector (31 downto 0);
    requested_port : out std_logic_vector (30 downto 0));
end entity xy_route_unit_1;

architecture rtl of xy_route_unit_1 is
  signal n2894_o : std_logic;
  signal n2895_o : std_logic_vector (30 downto 0);
  signal n2896_o : std_logic_vector (31 downto 0);
  signal n2897_o : std_logic;
  signal n2898_o : std_logic_vector (30 downto 0);
  signal n2899_o : std_logic_vector (31 downto 0);
  signal n2901_o : std_logic_vector (31 downto 0);
  signal n2902_o : std_logic_vector (31 downto 0);
  signal n2903_o : std_logic_vector (1 downto 0);
  signal n2908_o : std_logic_vector (31 downto 0);
  signal n2909_o : std_logic;
  signal n2910_o : std_logic_vector (31 downto 0);
  signal n2912_o : std_logic;
  signal n2914_o : std_logic_vector (31 downto 0);
  signal n2915_o : std_logic;
  signal n2916_o : std_logic_vector (31 downto 0);
  signal n2918_o : std_logic;
  signal n2920_o : std_logic_vector (31 downto 0);
  signal n2922_o : std_logic_vector (31 downto 0);
  signal n2924_o : std_logic;
  signal n2926_o : std_logic_vector (31 downto 0);
  signal n2928_o : std_logic_vector (31 downto 0);
  signal n2930_o : std_logic;
  signal n2933_o : std_logic_vector (30 downto 0);
  signal n2934_o : std_logic_vector (30 downto 0);
  signal n2935_o : std_logic_vector (30 downto 0);
  signal n2936_o : std_logic_vector (30 downto 0);
  signal n2938_o : std_logic_vector (30 downto 0);
begin
  requested_port <= n2938_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:37
  n2894_o <= packet (26);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:16
  n2895_o <= "000000000000000000000000000000" & n2894_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:53
  n2896_o <= "0" & n2895_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:77
  n2897_o <= packet (25);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:56
  n2898_o <= "000000000000000000000000000000" & n2897_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:55
  n2899_o <= "0" & n2898_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:55
  n2901_o <= std_logic_vector (resize (signed'("00000000000000000000000000000010") * signed (n2899_o), 32));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:53
  n2902_o <= std_logic_vector (unsigned (n2896_o) + unsigned (n2901_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:9
  n2903_o <= n2902_o (1 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:54:13
  n2908_o <= "000000000000000000000000000000" & n2903_o;  --  uext
  n2909_o <= n2908_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:54:13
  n2910_o <= "0000000000000000000000000000000" & n2909_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:54:19
  n2912_o <= '1' when signed (n2910_o) > signed'("00000000000000000000000000000001") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:55:16
  n2914_o <= "000000000000000000000000000000" & n2903_o;  --  uext
  n2915_o <= n2914_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:55:16
  n2916_o <= "0000000000000000000000000000000" & n2915_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:55:22
  n2918_o <= '1' when signed (n2916_o) < signed'("00000000000000000000000000000001") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:56:15
  n2920_o <= "000000000000000000000000000000" & n2903_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:56:15
  n2922_o <= std_logic_vector (signed (n2920_o) / signed'("00000000000000000000000000000010"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:56:18
  n2924_o <= '1' when signed (n2922_o) > signed'("00000000000000000000000000000000") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:57:15
  n2926_o <= "000000000000000000000000000000" & n2903_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:57:15
  n2928_o <= std_logic_vector (signed (n2926_o) / signed'("00000000000000000000000000000010"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:57:18
  n2930_o <= '1' when signed (n2928_o) < signed'("00000000000000000000000000000000") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:57:5
  n2933_o <= "0000000000000000000000000000100" when n2930_o = '0' else "0000000000000000000000000000000";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:56:5
  n2934_o <= n2933_o when n2924_o = '0' else "0000000000000000000000000000001";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:55:5
  n2935_o <= n2934_o when n2918_o = '0' else "0000000000000000000000000000011";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:54:5
  n2936_o <= n2935_o when n2912_o = '0' else "0000000000000000000000000000010";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/xy_route_unit.vhd:11:60
  n2938_o <= "0000000000000000000000000000100" when std_logic'('1') = '0' else n2936_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity crossbar_5x5 is
  port (
    heads : in std_logic_vector (159 downto 0);
    grants : in std_logic_vector (24 downto 0);
    outputs : out std_logic_vector (159 downto 0));
end entity crossbar_5x5;

architecture rtl of crossbar_5x5 is
  signal n2800_o : std_logic;
  signal n2801_o : std_logic_vector (31 downto 0);
  signal n2803_o : std_logic_vector (31 downto 0);
  constant n2804_o : std_logic_vector (159 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  signal n2806_o : std_logic;
  signal n2807_o : std_logic_vector (31 downto 0);
  signal n2808_o : std_logic_vector (31 downto 0);
  signal n2809_o : std_logic;
  signal n2810_o : std_logic_vector (31 downto 0);
  signal n2811_o : std_logic_vector (31 downto 0);
  signal n2812_o : std_logic;
  signal n2813_o : std_logic_vector (31 downto 0);
  signal n2814_o : std_logic_vector (31 downto 0);
  signal n2815_o : std_logic;
  signal n2816_o : std_logic_vector (31 downto 0);
  signal n2817_o : std_logic_vector (31 downto 0);
  signal n2818_o : std_logic;
  signal n2819_o : std_logic_vector (31 downto 0);
  signal n2820_o : std_logic_vector (31 downto 0);
  signal n2821_o : std_logic_vector (31 downto 0);
  signal n2823_o : std_logic;
  signal n2824_o : std_logic_vector (31 downto 0);
  signal n2825_o : std_logic_vector (31 downto 0);
  signal n2826_o : std_logic;
  signal n2827_o : std_logic_vector (31 downto 0);
  signal n2828_o : std_logic_vector (31 downto 0);
  signal n2829_o : std_logic;
  signal n2830_o : std_logic_vector (31 downto 0);
  signal n2831_o : std_logic_vector (31 downto 0);
  signal n2832_o : std_logic;
  signal n2833_o : std_logic_vector (31 downto 0);
  signal n2834_o : std_logic_vector (31 downto 0);
  signal n2835_o : std_logic;
  signal n2836_o : std_logic_vector (31 downto 0);
  signal n2837_o : std_logic_vector (31 downto 0);
  signal n2838_o : std_logic_vector (31 downto 0);
  signal n2840_o : std_logic;
  signal n2841_o : std_logic_vector (31 downto 0);
  signal n2842_o : std_logic_vector (31 downto 0);
  signal n2843_o : std_logic;
  signal n2844_o : std_logic_vector (31 downto 0);
  signal n2845_o : std_logic_vector (31 downto 0);
  signal n2846_o : std_logic;
  signal n2847_o : std_logic_vector (31 downto 0);
  signal n2848_o : std_logic_vector (31 downto 0);
  signal n2849_o : std_logic;
  signal n2850_o : std_logic_vector (31 downto 0);
  signal n2851_o : std_logic_vector (31 downto 0);
  signal n2852_o : std_logic;
  signal n2853_o : std_logic_vector (31 downto 0);
  signal n2854_o : std_logic_vector (31 downto 0);
  signal n2855_o : std_logic_vector (31 downto 0);
  signal n2856_o : std_logic_vector (31 downto 0);
  signal n2857_o : std_logic;
  signal n2858_o : std_logic_vector (31 downto 0);
  signal n2859_o : std_logic_vector (31 downto 0);
  signal n2860_o : std_logic;
  signal n2861_o : std_logic_vector (31 downto 0);
  signal n2862_o : std_logic_vector (31 downto 0);
  signal n2863_o : std_logic;
  signal n2864_o : std_logic_vector (31 downto 0);
  signal n2865_o : std_logic_vector (31 downto 0);
  signal n2866_o : std_logic;
  signal n2867_o : std_logic_vector (31 downto 0);
  signal n2868_o : std_logic_vector (31 downto 0);
  signal n2869_o : std_logic;
  signal n2870_o : std_logic_vector (31 downto 0);
  signal n2871_o : std_logic_vector (31 downto 0);
  signal n2872_o : std_logic;
  signal n2873_o : std_logic_vector (31 downto 0);
  signal n2874_o : std_logic_vector (31 downto 0);
  signal n2875_o : std_logic;
  signal n2876_o : std_logic_vector (31 downto 0);
  signal n2877_o : std_logic_vector (31 downto 0);
  signal n2878_o : std_logic;
  signal n2879_o : std_logic_vector (31 downto 0);
  signal n2880_o : std_logic_vector (31 downto 0);
  signal n2881_o : std_logic;
  signal n2882_o : std_logic_vector (31 downto 0);
  signal n2883_o : std_logic_vector (31 downto 0);
  signal n2884_o : std_logic_vector (159 downto 0);
begin
  outputs <= n2884_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2800_o <= grants (20);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2801_o <= heads (159 downto 128);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2803_o <= "00000000000000000000000000000000" when n2800_o = '0' else n2801_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2806_o <= grants (21);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2807_o <= heads (127 downto 96);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2808_o <= n2803_o when n2806_o = '0' else n2807_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2809_o <= grants (22);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2810_o <= heads (95 downto 64);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2811_o <= n2808_o when n2809_o = '0' else n2810_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2812_o <= grants (23);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2813_o <= heads (63 downto 32);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2814_o <= n2811_o when n2812_o = '0' else n2813_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2815_o <= grants (24);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2816_o <= heads (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2817_o <= n2814_o when n2815_o = '0' else n2816_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2818_o <= grants (15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2819_o <= heads (159 downto 128);
  n2820_o <= n2804_o (127 downto 96);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2821_o <= n2820_o when n2818_o = '0' else n2819_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2823_o <= grants (16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2824_o <= heads (127 downto 96);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2825_o <= n2821_o when n2823_o = '0' else n2824_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2826_o <= grants (17);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2827_o <= heads (95 downto 64);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2828_o <= n2825_o when n2826_o = '0' else n2827_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2829_o <= grants (18);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2830_o <= heads (63 downto 32);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2831_o <= n2828_o when n2829_o = '0' else n2830_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2832_o <= grants (19);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2833_o <= heads (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2834_o <= n2831_o when n2832_o = '0' else n2833_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2835_o <= grants (10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2836_o <= heads (159 downto 128);
  n2837_o <= n2804_o (95 downto 64);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2838_o <= n2837_o when n2835_o = '0' else n2836_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2840_o <= grants (11);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2841_o <= heads (127 downto 96);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2842_o <= n2838_o when n2840_o = '0' else n2841_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2843_o <= grants (12);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2844_o <= heads (95 downto 64);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2845_o <= n2842_o when n2843_o = '0' else n2844_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2846_o <= grants (13);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2847_o <= heads (63 downto 32);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2848_o <= n2845_o when n2846_o = '0' else n2847_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2849_o <= grants (14);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2850_o <= heads (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2851_o <= n2848_o when n2849_o = '0' else n2850_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2852_o <= grants (5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2853_o <= heads (159 downto 128);
  n2854_o <= n2804_o (63 downto 32);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2855_o <= n2854_o when n2852_o = '0' else n2853_o;
  n2856_o <= n2804_o (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2857_o <= grants (6);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2858_o <= heads (127 downto 96);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2859_o <= n2855_o when n2857_o = '0' else n2858_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2860_o <= grants (7);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2861_o <= heads (95 downto 64);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2862_o <= n2859_o when n2860_o = '0' else n2861_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2863_o <= grants (8);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2864_o <= heads (63 downto 32);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2865_o <= n2862_o when n2863_o = '0' else n2864_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2866_o <= grants (9);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2867_o <= heads (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2868_o <= n2865_o when n2866_o = '0' else n2867_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2869_o <= grants (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2870_o <= heads (159 downto 128);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2871_o <= n2856_o when n2869_o = '0' else n2870_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2872_o <= grants (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2873_o <= heads (127 downto 96);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2874_o <= n2871_o when n2872_o = '0' else n2873_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2875_o <= grants (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2876_o <= heads (95 downto 64);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2877_o <= n2874_o when n2875_o = '0' else n2876_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2878_o <= grants (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2879_o <= heads (63 downto 32);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2880_o <= n2877_o when n2878_o = '0' else n2879_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:40
  n2881_o <= grants (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:67
  n2882_o <= heads (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/crossbar_5x5.vhd:15:28
  n2883_o <= n2880_o when n2881_o = '0' else n2882_o;
  n2884_o <= n2817_o & n2834_o & n2851_o & n2868_o & n2883_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rr_arbiter is
  port (
    clk : in std_logic;
    rst : in std_logic;
    req : in std_logic_vector (4 downto 0);
    accept : in std_logic;
    grant : out std_logic_vector (4 downto 0);
    pointer : out std_logic_vector (2 downto 0));
end entity rr_arbiter;

architecture rtl of rr_arbiter is
  signal held : std_logic_vector (4 downto 0);
  signal start : std_logic_vector (2 downto 0);
  signal n2489_o : std_logic;
  signal n2490_o : std_logic;
  signal n2492_o : std_logic_vector (2 downto 0);
  signal n2493_o : std_logic;
  signal n2495_o : std_logic_vector (2 downto 0);
  signal n2496_o : std_logic;
  signal n2498_o : std_logic_vector (2 downto 0);
  signal n2499_o : std_logic;
  signal n2501_o : std_logic_vector (2 downto 0);
  signal n2502_o : std_logic;
  signal n2504_o : std_logic_vector (2 downto 0);
  signal n2506_o : std_logic_vector (4 downto 0);
  signal n2507_o : std_logic_vector (2 downto 0);
  signal n2508_o : std_logic_vector (31 downto 0);
  signal n2510_o : std_logic_vector (31 downto 0);
  signal n2512_o : std_logic_vector (31 downto 0);
  signal n2513_o : std_logic_vector (30 downto 0);
  signal n2514_o : std_logic_vector (2 downto 0);
  signal n2518_o : std_logic;
  signal n2519_o : std_logic_vector (2 downto 0);
  constant n2521_o : std_logic_vector (4 downto 0) := "00000";
  signal n2525_o : std_logic_vector (4 downto 0);
  signal n2529_o : std_logic;
  signal n2531_o : std_logic_vector (31 downto 0);
  signal n2533_o : std_logic_vector (31 downto 0);
  signal n2535_o : std_logic_vector (31 downto 0);
  signal n2536_o : std_logic_vector (30 downto 0);
  signal n2537_o : std_logic_vector (2 downto 0);
  signal n2540_o : std_logic;
  signal n2541_o : std_logic;
  signal n2542_o : std_logic_vector (2 downto 0);
  signal n2546_o : std_logic_vector (4 downto 0);
  signal n2548_o : std_logic;
  signal n2549_o : std_logic_vector (31 downto 0);
  signal n2551_o : std_logic_vector (31 downto 0);
  signal n2553_o : std_logic_vector (31 downto 0);
  signal n2554_o : std_logic_vector (30 downto 0);
  signal n2555_o : std_logic_vector (2 downto 0);
  signal n2558_o : std_logic;
  signal n2559_o : std_logic;
  signal n2560_o : std_logic_vector (2 downto 0);
  signal n2564_o : std_logic_vector (4 downto 0);
  signal n2566_o : std_logic;
  signal n2567_o : std_logic_vector (31 downto 0);
  signal n2569_o : std_logic_vector (31 downto 0);
  signal n2571_o : std_logic_vector (31 downto 0);
  signal n2572_o : std_logic_vector (30 downto 0);
  signal n2573_o : std_logic_vector (2 downto 0);
  signal n2576_o : std_logic;
  signal n2577_o : std_logic;
  signal n2578_o : std_logic_vector (2 downto 0);
  signal n2582_o : std_logic_vector (4 downto 0);
  signal n2584_o : std_logic;
  signal n2585_o : std_logic_vector (31 downto 0);
  signal n2587_o : std_logic_vector (31 downto 0);
  signal n2589_o : std_logic_vector (31 downto 0);
  signal n2590_o : std_logic_vector (30 downto 0);
  signal n2591_o : std_logic_vector (2 downto 0);
  signal n2594_o : std_logic;
  signal n2595_o : std_logic;
  signal n2596_o : std_logic_vector (2 downto 0);
  signal n2600_o : std_logic_vector (4 downto 0);
  signal n2603_o : std_logic_vector (4 downto 0);
  signal n2604_o : std_logic;
  signal n2609_o : std_logic_vector (4 downto 0);
  signal n2611_o : std_logic_vector (2 downto 0);
  signal n2624_q : std_logic_vector (4 downto 0) := "00000";
  signal n2625_q : std_logic_vector (2 downto 0) := "000";
  signal n2626_o : std_logic;
  signal n2627_o : std_logic;
  signal n2628_o : std_logic;
  signal n2629_o : std_logic;
  signal n2630_o : std_logic;
  signal n2631_o : std_logic_vector (1 downto 0);
  signal n2632_o : std_logic;
  signal n2633_o : std_logic;
  signal n2634_o : std_logic;
  signal n2635_o : std_logic;
  signal n2636_o : std_logic;
  signal n2637_o : std_logic;
  signal n2638_o : std_logic;
  signal n2639_o : std_logic;
  signal n2640_o : std_logic;
  signal n2641_o : std_logic;
  signal n2642_o : std_logic;
  signal n2643_o : std_logic;
  signal n2644_o : std_logic;
  signal n2645_o : std_logic;
  signal n2646_o : std_logic;
  signal n2647_o : std_logic;
  signal n2648_o : std_logic;
  signal n2649_o : std_logic;
  signal n2650_o : std_logic;
  signal n2651_o : std_logic;
  signal n2652_o : std_logic;
  signal n2653_o : std_logic;
  signal n2654_o : std_logic;
  signal n2655_o : std_logic;
  signal n2656_o : std_logic;
  signal n2657_o : std_logic;
  signal n2658_o : std_logic;
  signal n2659_o : std_logic_vector (4 downto 0);
  signal n2660_o : std_logic;
  signal n2661_o : std_logic;
  signal n2662_o : std_logic;
  signal n2663_o : std_logic;
  signal n2664_o : std_logic;
  signal n2665_o : std_logic_vector (1 downto 0);
  signal n2666_o : std_logic;
  signal n2667_o : std_logic;
  signal n2668_o : std_logic;
  signal n2669_o : std_logic;
  signal n2670_o : std_logic;
  signal n2671_o : std_logic;
  signal n2672_o : std_logic;
  signal n2673_o : std_logic;
  signal n2674_o : std_logic;
  signal n2675_o : std_logic;
  signal n2676_o : std_logic;
  signal n2677_o : std_logic;
  signal n2678_o : std_logic;
  signal n2679_o : std_logic;
  signal n2680_o : std_logic;
  signal n2681_o : std_logic;
  signal n2682_o : std_logic;
  signal n2683_o : std_logic;
  signal n2684_o : std_logic;
  signal n2685_o : std_logic;
  signal n2686_o : std_logic;
  signal n2687_o : std_logic;
  signal n2688_o : std_logic;
  signal n2689_o : std_logic;
  signal n2690_o : std_logic;
  signal n2691_o : std_logic;
  signal n2692_o : std_logic;
  signal n2693_o : std_logic_vector (4 downto 0);
  signal n2694_o : std_logic;
  signal n2695_o : std_logic;
  signal n2696_o : std_logic;
  signal n2697_o : std_logic;
  signal n2698_o : std_logic;
  signal n2699_o : std_logic_vector (1 downto 0);
  signal n2700_o : std_logic;
  signal n2701_o : std_logic;
  signal n2702_o : std_logic;
  signal n2703_o : std_logic;
  signal n2704_o : std_logic;
  signal n2705_o : std_logic;
  signal n2706_o : std_logic;
  signal n2707_o : std_logic;
  signal n2708_o : std_logic;
  signal n2709_o : std_logic;
  signal n2710_o : std_logic;
  signal n2711_o : std_logic;
  signal n2712_o : std_logic;
  signal n2713_o : std_logic;
  signal n2714_o : std_logic;
  signal n2715_o : std_logic;
  signal n2716_o : std_logic;
  signal n2717_o : std_logic;
  signal n2718_o : std_logic;
  signal n2719_o : std_logic;
  signal n2720_o : std_logic;
  signal n2721_o : std_logic;
  signal n2722_o : std_logic;
  signal n2723_o : std_logic;
  signal n2724_o : std_logic;
  signal n2725_o : std_logic;
  signal n2726_o : std_logic;
  signal n2727_o : std_logic_vector (4 downto 0);
  signal n2728_o : std_logic;
  signal n2729_o : std_logic;
  signal n2730_o : std_logic;
  signal n2731_o : std_logic;
  signal n2732_o : std_logic;
  signal n2733_o : std_logic_vector (1 downto 0);
  signal n2734_o : std_logic;
  signal n2735_o : std_logic;
  signal n2736_o : std_logic;
  signal n2737_o : std_logic;
  signal n2738_o : std_logic;
  signal n2739_o : std_logic;
  signal n2740_o : std_logic;
  signal n2741_o : std_logic;
  signal n2742_o : std_logic;
  signal n2743_o : std_logic;
  signal n2744_o : std_logic;
  signal n2745_o : std_logic;
  signal n2746_o : std_logic;
  signal n2747_o : std_logic;
  signal n2748_o : std_logic;
  signal n2749_o : std_logic;
  signal n2750_o : std_logic;
  signal n2751_o : std_logic;
  signal n2752_o : std_logic;
  signal n2753_o : std_logic;
  signal n2754_o : std_logic;
  signal n2755_o : std_logic;
  signal n2756_o : std_logic;
  signal n2757_o : std_logic;
  signal n2758_o : std_logic;
  signal n2759_o : std_logic;
  signal n2760_o : std_logic;
  signal n2761_o : std_logic_vector (4 downto 0);
  signal n2762_o : std_logic;
  signal n2763_o : std_logic;
  signal n2764_o : std_logic;
  signal n2765_o : std_logic;
  signal n2766_o : std_logic;
  signal n2767_o : std_logic_vector (1 downto 0);
  signal n2768_o : std_logic;
  signal n2769_o : std_logic;
  signal n2770_o : std_logic;
  signal n2771_o : std_logic;
  signal n2772_o : std_logic;
  signal n2773_o : std_logic;
  signal n2774_o : std_logic;
  signal n2775_o : std_logic;
  signal n2776_o : std_logic;
  signal n2777_o : std_logic;
  signal n2778_o : std_logic;
  signal n2779_o : std_logic;
  signal n2780_o : std_logic;
  signal n2781_o : std_logic;
  signal n2782_o : std_logic;
  signal n2783_o : std_logic;
  signal n2784_o : std_logic;
  signal n2785_o : std_logic;
  signal n2786_o : std_logic;
  signal n2787_o : std_logic;
  signal n2788_o : std_logic;
  signal n2789_o : std_logic;
  signal n2790_o : std_logic;
  signal n2791_o : std_logic;
  signal n2792_o : std_logic;
  signal n2793_o : std_logic;
  signal n2794_o : std_logic;
  signal n2795_o : std_logic_vector (4 downto 0);
begin
  grant <= held;
  pointer <= start;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:9:10
  held <= n2624_q; -- (isignal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:10:10
  start <= n2625_q; -- (isignal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:20:17
  n2489_o <= '1' when held /= "00000" else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:22:39
  n2490_o <= held (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:22:32
  n2492_o <= start when n2490_o = '0' else "001";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:22:39
  n2493_o <= held (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:22:32
  n2495_o <= n2492_o when n2493_o = '0' else "010";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:22:39
  n2496_o <= held (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:22:32
  n2498_o <= n2495_o when n2496_o = '0' else "011";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:22:39
  n2499_o <= held (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:22:32
  n2501_o <= n2498_o when n2499_o = '0' else "100";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:22:39
  n2502_o <= held (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:22:32
  n2504_o <= n2501_o when n2502_o = '0' else "000";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:21:9
  n2506_o <= held when accept = '0' else "00000";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:20:7
  n2507_o <= start when n2604_o = '0' else n2504_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:24
  n2508_o <= "00000000000000000000000000000" & start;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:24
  n2510_o <= std_logic_vector (unsigned (n2508_o) + unsigned'("00000000000000000000000000000000"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:33
  n2512_o <= std_logic_vector (signed (n2510_o) mod signed'("00000000000000000000000000000101"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:11
  n2513_o <= n2512_o (30 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:18
  n2514_o <= n2513_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:29
  n2518_o <= '1' and n2634_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:59
  n2519_o <= n2513_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:11
  n2525_o <= "00000" when n2518_o = '0' else n2659_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:11
  n2529_o <= '0' when n2518_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:24
  n2531_o <= "00000000000000000000000000000" & start;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:24
  n2533_o <= std_logic_vector (unsigned (n2531_o) + unsigned'("00000000000000000000000000000001"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:33
  n2535_o <= std_logic_vector (signed (n2533_o) mod signed'("00000000000000000000000000000101"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:11
  n2536_o <= n2535_o (30 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:18
  n2537_o <= n2536_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:33
  n2540_o <= not n2529_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:29
  n2541_o <= n2540_o and n2668_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:59
  n2542_o <= n2536_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:11
  n2546_o <= n2525_o when n2541_o = '0' else n2693_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:11
  n2548_o <= n2529_o when n2541_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:24
  n2549_o <= "00000000000000000000000000000" & start;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:24
  n2551_o <= std_logic_vector (unsigned (n2549_o) + unsigned'("00000000000000000000000000000010"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:33
  n2553_o <= std_logic_vector (signed (n2551_o) mod signed'("00000000000000000000000000000101"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:11
  n2554_o <= n2553_o (30 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:18
  n2555_o <= n2554_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:33
  n2558_o <= not n2548_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:29
  n2559_o <= n2558_o and n2702_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:59
  n2560_o <= n2554_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:11
  n2564_o <= n2546_o when n2559_o = '0' else n2727_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:11
  n2566_o <= n2548_o when n2559_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:24
  n2567_o <= "00000000000000000000000000000" & start;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:24
  n2569_o <= std_logic_vector (unsigned (n2567_o) + unsigned'("00000000000000000000000000000011"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:33
  n2571_o <= std_logic_vector (signed (n2569_o) mod signed'("00000000000000000000000000000101"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:11
  n2572_o <= n2571_o (30 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:18
  n2573_o <= n2572_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:33
  n2576_o <= not n2566_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:29
  n2577_o <= n2576_o and n2736_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:59
  n2578_o <= n2572_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:11
  n2582_o <= n2564_o when n2577_o = '0' else n2761_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:11
  n2584_o <= n2566_o when n2577_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:24
  n2585_o <= "00000000000000000000000000000" & start;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:24
  n2587_o <= std_logic_vector (unsigned (n2585_o) + unsigned'("00000000000000000000000000000100"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:33
  n2589_o <= std_logic_vector (signed (n2587_o) mod signed'("00000000000000000000000000000101"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:28:11
  n2590_o <= n2589_o (30 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:18
  n2591_o <= n2590_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:33
  n2594_o <= not n2584_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:29
  n2595_o <= n2594_o and n2770_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:59
  n2596_o <= n2590_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:11
  n2600_o <= n2582_o when n2595_o = '0' else n2795_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:20:7
  n2603_o <= n2600_o when n2489_o = '0' else n2506_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:20:7
  n2604_o <= accept and n2489_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:19:7
  n2609_o <= n2603_o when rst = '0' else "00000";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:19:7
  n2611_o <= n2507_o when rst = '0' else "000";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:18:5
  process (clk)
  begin
    if rising_edge (clk) then
      n2624_q <= n2609_o;
    end if;
  end process;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:18:5
  process (clk)
  begin
    if rising_edge (clk) then
      n2625_q <= n2611_o;
    end if;
  end process;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:6:26
  n2626_o <= req (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:6:5
  n2627_o <= req (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:18:5
  n2628_o <= req (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:18:5
  n2629_o <= req (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:18:5
  n2630_o <= req (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  n2631_o <= n2514_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  with n2631_o select n2632_o <=
    n2626_o when "00",
    n2627_o when "01",
    n2628_o when "10",
    n2629_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  n2633_o <= n2514_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  n2634_o <= n2632_o when n2633_o = '0' else n2630_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2635_o <= n2519_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2636_o <= not n2635_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2637_o <= n2519_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2638_o <= not n2637_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2639_o <= n2636_o and n2638_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2640_o <= n2636_o and n2637_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2641_o <= n2635_o and n2638_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2642_o <= n2519_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2643_o <= not n2642_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2644_o <= n2639_o and n2643_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2645_o <= n2639_o and n2642_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2646_o <= n2640_o and n2643_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2647_o <= n2640_o and n2642_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2648_o <= n2641_o and n2643_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:14:14
  n2649_o <= n2521_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2650_o <= n2649_o when n2644_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:18:5
  n2651_o <= n2521_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2652_o <= n2651_o when n2645_o = '0' else '1';
  n2653_o <= n2521_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2654_o <= n2653_o when n2646_o = '0' else '1';
  n2655_o <= n2521_o (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2656_o <= n2655_o when n2647_o = '0' else '1';
  n2657_o <= n2521_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2658_o <= n2657_o when n2648_o = '0' else '1';
  n2659_o <= n2658_o & n2656_o & n2654_o & n2652_o & n2650_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:59
  n2660_o <= req (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2661_o <= req (1);
  n2662_o <= req (2);
  n2663_o <= req (3);
  n2664_o <= req (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  n2665_o <= n2537_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  with n2665_o select n2666_o <=
    n2660_o when "00",
    n2661_o when "01",
    n2662_o when "10",
    n2663_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  n2667_o <= n2537_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  n2668_o <= n2666_o when n2667_o = '0' else n2664_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2669_o <= n2542_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2670_o <= not n2669_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2671_o <= n2542_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2672_o <= not n2671_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2673_o <= n2670_o and n2672_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2674_o <= n2670_o and n2671_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2675_o <= n2669_o and n2672_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2676_o <= n2542_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2677_o <= not n2676_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2678_o <= n2673_o and n2677_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2679_o <= n2673_o and n2676_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2680_o <= n2674_o and n2677_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2681_o <= n2674_o and n2676_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2682_o <= n2675_o and n2677_o;
  n2683_o <= n2525_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2684_o <= n2683_o when n2678_o = '0' else '1';
  n2685_o <= n2525_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2686_o <= n2685_o when n2679_o = '0' else '1';
  n2687_o <= n2525_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2688_o <= n2687_o when n2680_o = '0' else '1';
  n2689_o <= n2525_o (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2690_o <= n2689_o when n2681_o = '0' else '1';
  n2691_o <= n2525_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2692_o <= n2691_o when n2682_o = '0' else '1';
  n2693_o <= n2692_o & n2690_o & n2688_o & n2686_o & n2684_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:59
  n2694_o <= req (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2695_o <= req (1);
  n2696_o <= req (2);
  n2697_o <= req (3);
  n2698_o <= req (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  n2699_o <= n2555_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  with n2699_o select n2700_o <=
    n2694_o when "00",
    n2695_o when "01",
    n2696_o when "10",
    n2697_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  n2701_o <= n2555_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  n2702_o <= n2700_o when n2701_o = '0' else n2698_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2703_o <= n2560_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2704_o <= not n2703_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2705_o <= n2560_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2706_o <= not n2705_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2707_o <= n2704_o and n2706_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2708_o <= n2704_o and n2705_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2709_o <= n2703_o and n2706_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2710_o <= n2560_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2711_o <= not n2710_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2712_o <= n2707_o and n2711_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2713_o <= n2707_o and n2710_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2714_o <= n2708_o and n2711_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2715_o <= n2708_o and n2710_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2716_o <= n2709_o and n2711_o;
  n2717_o <= n2546_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2718_o <= n2717_o when n2712_o = '0' else '1';
  n2719_o <= n2546_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2720_o <= n2719_o when n2713_o = '0' else '1';
  n2721_o <= n2546_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2722_o <= n2721_o when n2714_o = '0' else '1';
  n2723_o <= n2546_o (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2724_o <= n2723_o when n2715_o = '0' else '1';
  n2725_o <= n2546_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2726_o <= n2725_o when n2716_o = '0' else '1';
  n2727_o <= n2726_o & n2724_o & n2722_o & n2720_o & n2718_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:59
  n2728_o <= req (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2729_o <= req (1);
  n2730_o <= req (2);
  n2731_o <= req (3);
  n2732_o <= req (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  n2733_o <= n2573_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  with n2733_o select n2734_o <=
    n2728_o when "00",
    n2729_o when "01",
    n2730_o when "10",
    n2731_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  n2735_o <= n2573_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  n2736_o <= n2734_o when n2735_o = '0' else n2732_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2737_o <= n2578_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2738_o <= not n2737_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2739_o <= n2578_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2740_o <= not n2739_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2741_o <= n2738_o and n2740_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2742_o <= n2738_o and n2739_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2743_o <= n2737_o and n2740_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2744_o <= n2578_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2745_o <= not n2744_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2746_o <= n2741_o and n2745_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2747_o <= n2741_o and n2744_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2748_o <= n2742_o and n2745_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2749_o <= n2742_o and n2744_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2750_o <= n2743_o and n2745_o;
  n2751_o <= n2564_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2752_o <= n2751_o when n2746_o = '0' else '1';
  n2753_o <= n2564_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2754_o <= n2753_o when n2747_o = '0' else '1';
  n2755_o <= n2564_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2756_o <= n2755_o when n2748_o = '0' else '1';
  n2757_o <= n2564_o (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2758_o <= n2757_o when n2749_o = '0' else '1';
  n2759_o <= n2564_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2760_o <= n2759_o when n2750_o = '0' else '1';
  n2761_o <= n2760_o & n2758_o & n2756_o & n2754_o & n2752_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:59
  n2762_o <= req (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2763_o <= req (1);
  n2764_o <= req (2);
  n2765_o <= req (3);
  n2766_o <= req (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  n2767_o <= n2591_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  with n2767_o select n2768_o <=
    n2762_o when "00",
    n2763_o when "01",
    n2764_o when "10",
    n2765_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  n2769_o <= n2591_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:17
  n2770_o <= n2768_o when n2769_o = '0' else n2766_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2771_o <= n2596_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2772_o <= not n2771_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2773_o <= n2596_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2774_o <= not n2773_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2775_o <= n2772_o and n2774_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2776_o <= n2772_o and n2773_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2777_o <= n2771_o and n2774_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2778_o <= n2596_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2779_o <= not n2778_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2780_o <= n2775_o and n2779_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2781_o <= n2775_o and n2778_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2782_o <= n2776_o and n2779_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2783_o <= n2776_o and n2778_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2784_o <= n2777_o and n2779_o;
  n2785_o <= n2582_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2786_o <= n2785_o when n2780_o = '0' else '1';
  n2787_o <= n2582_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2788_o <= n2787_o when n2781_o = '0' else '1';
  n2789_o <= n2582_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2790_o <= n2789_o when n2782_o = '0' else '1';
  n2791_o <= n2582_o (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2792_o <= n2791_o when n2783_o = '0' else '1';
  n2793_o <= n2582_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/rr_arbiter.vhd:29:48
  n2794_o <= n2793_o when n2784_o = '0' else '1';
  n2795_o <= n2794_o & n2792_o & n2790_o & n2788_o & n2786_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity xy_route_unit_0 is
  port (
    packet : in std_logic_vector (31 downto 0);
    requested_port : out std_logic_vector (30 downto 0));
end entity xy_route_unit_0;

architecture rtl of xy_route_unit_0 is
  signal n2432_o : std_logic;
  signal n2433_o : std_logic_vector (30 downto 0);
  signal n2434_o : std_logic_vector (31 downto 0);
  signal n2435_o : std_logic;
  signal n2436_o : std_logic_vector (30 downto 0);
  signal n2437_o : std_logic_vector (31 downto 0);
  signal n2439_o : std_logic_vector (31 downto 0);
  signal n2440_o : std_logic_vector (31 downto 0);
  signal n2441_o : std_logic_vector (1 downto 0);
  signal n2446_o : std_logic_vector (31 downto 0);
  signal n2447_o : std_logic;
  signal n2448_o : std_logic_vector (31 downto 0);
  signal n2450_o : std_logic;
  signal n2452_o : std_logic_vector (31 downto 0);
  signal n2453_o : std_logic;
  signal n2454_o : std_logic_vector (31 downto 0);
  signal n2456_o : std_logic;
  signal n2458_o : std_logic_vector (31 downto 0);
  signal n2460_o : std_logic_vector (31 downto 0);
  signal n2462_o : std_logic;
  signal n2464_o : std_logic_vector (31 downto 0);
  signal n2466_o : std_logic_vector (31 downto 0);
  signal n2468_o : std_logic;
  signal n2471_o : std_logic_vector (30 downto 0);
  signal n2472_o : std_logic_vector (30 downto 0);
  signal n2473_o : std_logic_vector (30 downto 0);
  signal n2474_o : std_logic_vector (30 downto 0);
  signal n2476_o : std_logic_vector (30 downto 0);
begin
  requested_port <= n2476_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:37
  n2432_o <= packet (26);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:16
  n2433_o <= "000000000000000000000000000000" & n2432_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:53
  n2434_o <= "0" & n2433_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:77
  n2435_o <= packet (25);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:56
  n2436_o <= "000000000000000000000000000000" & n2435_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:55
  n2437_o <= "0" & n2436_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:55
  n2439_o <= std_logic_vector (resize (signed'("00000000000000000000000000000010") * signed (n2437_o), 32));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:53
  n2440_o <= std_logic_vector (unsigned (n2434_o) + unsigned (n2439_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:45:9
  n2441_o <= n2440_o (1 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:54:13
  n2446_o <= "000000000000000000000000000000" & n2441_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:16:12
  n2447_o <= n2446_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:54:13
  n2448_o <= "0000000000000000000000000000000" & n2447_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:54:19
  n2450_o <= '1' when signed (n2448_o) > signed'("00000000000000000000000000000000") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:55:16
  n2452_o <= "000000000000000000000000000000" & n2441_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:26:14
  n2453_o <= n2452_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:55:16
  n2454_o <= "0000000000000000000000000000000" & n2453_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:55:22
  n2456_o <= '1' when signed (n2454_o) < signed'("00000000000000000000000000000000") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:56:15
  n2458_o <= "000000000000000000000000000000" & n2441_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:56:15
  n2460_o <= std_logic_vector (signed (n2458_o) / signed'("00000000000000000000000000000010"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:56:18
  n2462_o <= '1' when signed (n2460_o) > signed'("00000000000000000000000000000000") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:57:15
  n2464_o <= "000000000000000000000000000000" & n2441_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:57:15
  n2466_o <= std_logic_vector (signed (n2464_o) / signed'("00000000000000000000000000000010"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:57:18
  n2468_o <= '1' when signed (n2466_o) < signed'("00000000000000000000000000000000") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:57:5
  n2471_o <= "0000000000000000000000000000100" when n2468_o = '0' else "0000000000000000000000000000000";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:56:5
  n2472_o <= n2471_o when n2462_o = '0' else "0000000000000000000000000000001";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:55:5
  n2473_o <= n2472_o when n2456_o = '0' else "0000000000000000000000000000011";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_pkg.vhd:54:5
  n2474_o <= n2473_o when n2450_o = '0' else "0000000000000000000000000000010";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/xy_route_unit.vhd:11:60
  n2476_o <= "0000000000000000000000000000100" when std_logic'('1') = '0' else n2474_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fifo_buffer_4 is
  port (
    clk : in std_logic;
    rst : in std_logic;
    in_data : in std_logic_vector (31 downto 0);
    in_valid : in std_logic;
    out_ready : in std_logic;
    in_ready : out std_logic;
    out_data : out std_logic_vector (31 downto 0);
    out_valid : out std_logic;
    count : out std_logic_vector (30 downto 0));
end entity fifo_buffer_4;

architecture rtl of fifo_buffer_4 is
  signal rd : std_logic_vector (1 downto 0);
  signal wr : std_logic_vector (1 downto 0);
  signal used : std_logic_vector (2 downto 0);
  signal n2311_o : std_logic_vector (31 downto 0);
  signal n2313_o : std_logic;
  signal n2314_o : std_logic;
  signal n2317_o : std_logic_vector (31 downto 0);
  signal n2319_o : std_logic;
  signal n2320_o : std_logic;
  signal n2326_o : std_logic_vector (31 downto 0);
  signal n2328_o : std_logic;
  signal n2329_o : std_logic_vector (31 downto 0);
  signal n2331_o : std_logic_vector (30 downto 0);
  signal n2337_o : std_logic_vector (31 downto 0);
  signal n2339_o : std_logic;
  signal n2340_o : std_logic;
  signal n2341_o : std_logic_vector (31 downto 0);
  signal n2343_o : std_logic;
  signal n2344_o : std_logic;
  signal n2350_o : std_logic_vector (30 downto 0);
  signal n2355_o : std_logic_vector (31 downto 0);
  signal n2357_o : std_logic;
  signal n2359_o : std_logic_vector (31 downto 0);
  signal n2361_o : std_logic_vector (31 downto 0);
  signal n2362_o : std_logic_vector (30 downto 0);
  signal n2363_o : std_logic_vector (30 downto 0);
  signal n2364_o : std_logic_vector (1 downto 0);
  signal n2366_o : std_logic_vector (1 downto 0);
  signal n2368_o : std_logic_vector (30 downto 0);
  signal n2373_o : std_logic_vector (31 downto 0);
  signal n2375_o : std_logic;
  signal n2377_o : std_logic_vector (31 downto 0);
  signal n2379_o : std_logic_vector (31 downto 0);
  signal n2380_o : std_logic_vector (30 downto 0);
  signal n2381_o : std_logic_vector (30 downto 0);
  signal n2382_o : std_logic_vector (1 downto 0);
  signal n2383_o : std_logic_vector (1 downto 0);
  signal n2384_o : std_logic;
  signal n2385_o : std_logic;
  signal n2386_o : std_logic_vector (31 downto 0);
  signal n2388_o : std_logic_vector (31 downto 0);
  signal n2389_o : std_logic_vector (2 downto 0);
  signal n2390_o : std_logic;
  signal n2391_o : std_logic;
  signal n2392_o : std_logic_vector (31 downto 0);
  signal n2394_o : std_logic_vector (31 downto 0);
  signal n2395_o : std_logic_vector (2 downto 0);
  signal n2396_o : std_logic_vector (2 downto 0);
  signal n2397_o : std_logic_vector (2 downto 0);
  signal n2400_o : std_logic_vector (1 downto 0);
  signal n2402_o : std_logic_vector (1 downto 0);
  signal n2404_o : std_logic_vector (2 downto 0);
  signal n2416_o : std_logic;
  signal n2417_o : std_logic;
  signal n2420_q : std_logic_vector (1 downto 0) := "00";
  signal n2421_q : std_logic_vector (1 downto 0) := "00";
  signal n2422_q : std_logic_vector (2 downto 0) := "000";
  signal n2423_data : std_logic_vector (31 downto 0);
begin
  in_ready <= n2314_o;
  out_data <= n2329_o;
  out_valid <= n2320_o;
  count <= n2331_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:14:10
  rd <= n2420_q; -- (isignal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:14:13
  wr <= n2421_q; -- (isignal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:15:10
  used <= n2422_q; -- (isignal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:21:28
  n2311_o <= "00000000000000000000000000000" & used;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:21:28
  n2313_o <= '1' when signed (n2311_o) < signed'("00000000000000000000000000000100") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:21:19
  n2314_o <= '0' when n2313_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:22:29
  n2317_o <= "00000000000000000000000000000" & used;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:22:29
  n2319_o <= '1' when signed (n2317_o) > signed'("00000000000000000000000000000000") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:22:20
  n2320_o <= '0' when n2319_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:23:32
  n2326_o <= "00000000000000000000000000000" & used;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:23:32
  n2328_o <= '1' when signed (n2326_o) > signed'("00000000000000000000000000000000") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:23:23
  n2329_o <= "00000000000000000000000000000000" when n2328_o = '0' else n2423_data;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:24:12
  n2331_o <= "0000000000000000000000000000" & used;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:31:36
  n2337_o <= "00000000000000000000000000000" & used;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:31:36
  n2339_o <= '1' when signed (n2337_o) < signed'("00000000000000000000000000000100") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:31:28
  n2340_o <= n2339_o and in_valid;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:32:36
  n2341_o <= "00000000000000000000000000000" & used;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:32:36
  n2343_o <= '1' when signed (n2341_o) > signed'("00000000000000000000000000000000") else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:32:28
  n2344_o <= n2343_o and out_ready;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:33:51
  n2350_o <= "00000000000000000000000000000" & wr;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:17:13
  n2355_o <= "0" & n2350_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:17:13
  n2357_o <= '1' when n2355_o = "00000000000000000000000000000011" else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:17:50
  n2359_o <= "0" & n2350_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:17:50
  n2361_o <= std_logic_vector (unsigned (n2359_o) + unsigned'("00000000000000000000000000000001"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:17:42
  n2362_o <= n2361_o (30 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:17:9
  n2363_o <= n2362_o when n2357_o = '0' else "0000000000000000000000000000000";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:33:43
  n2364_o <= n2363_o (1 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:33:9
  n2366_o <= wr when n2340_o = '0' else n2364_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:34:33
  n2368_o <= "00000000000000000000000000000" & rd;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:17:13
  n2373_o <= "0" & n2368_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:17:13
  n2375_o <= '1' when n2373_o = "00000000000000000000000000000011" else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:17:50
  n2377_o <= "0" & n2368_o;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:17:50
  n2379_o <= std_logic_vector (unsigned (n2377_o) + unsigned'("00000000000000000000000000000001"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:17:42
  n2380_o <= n2379_o (30 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:17:9
  n2381_o <= n2380_o when n2375_o = '0' else "0000000000000000000000000000000";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:34:25
  n2382_o <= n2381_o (1 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:34:9
  n2383_o <= rd when n2344_o = '0' else n2382_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:35:21
  n2384_o <= not n2344_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:35:17
  n2385_o <= n2384_o and n2340_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:35:44
  n2386_o <= "00000000000000000000000000000" & used;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:35:44
  n2388_o <= std_logic_vector (unsigned (n2386_o) + unsigned'("00000000000000000000000000000001"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:35:40
  n2389_o <= n2388_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:36:23
  n2390_o <= not n2340_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:36:19
  n2391_o <= n2390_o and n2344_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:36:47
  n2392_o <= "00000000000000000000000000000" & used;  --  uext
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:36:47
  n2394_o <= std_logic_vector (unsigned (n2392_o) - unsigned'("00000000000000000000000000000001"));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:36:43
  n2395_o <= n2394_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:36:9
  n2396_o <= used when n2391_o = '0' else n2395_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:35:9
  n2397_o <= n2396_o when n2385_o = '0' else n2389_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:29:7
  n2400_o <= n2383_o when rst = '0' else "00";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:29:7
  n2402_o <= n2366_o when rst = '0' else "00";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:29:7
  n2404_o <= n2397_o when rst = '0' else "000";
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:29:7
  n2416_o <= not rst;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:29:7
  n2417_o <= n2416_o and n2340_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:28:5
  process (clk)
  begin
    if rising_edge (clk) then
      n2420_q <= n2400_o;
    end if;
  end process;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:28:5
  process (clk)
  begin
    if rising_edge (clk) then
      n2421_q <= n2402_o;
    end if;
  end process;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:28:5
  process (clk)
  begin
    if rising_edge (clk) then
      n2422_q <= n2404_o;
    end if;
  end process;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:23:19
  process (rd, clk) is
    type mem_type is array (0 to 3)
      of std_logic_vector (31 downto 0);
    variable mem : mem_type;
  begin
    n2423_data <= mem(to_integer (unsigned (rd)));
    if rising_edge (clk) and (n2417_o = '1') then
      mem (to_integer (unsigned (wr))) := in_data;
    end if;
  end process;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:23:19
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/fifo_buffer.vhd:33:26
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity router_3_4 is
  port (
    clk : in std_logic;
    rst : in std_logic;
    in_data : in std_logic_vector (159 downto 0);
    in_valid : in std_logic_vector (4 downto 0);
    out_ready : in std_logic_vector (4 downto 0);
    in_ready : out std_logic_vector (4 downto 0);
    out_data : out std_logic_vector (159 downto 0);
    out_valid : out std_logic_vector (4 downto 0);
    dbg_count : out std_logic_vector (154 downto 0);
    dbg_req : out std_logic_vector (24 downto 0);
    dbg_grant : out std_logic_vector (24 downto 0));
end entity router_3_4;

architecture rtl of router_3_4 is
  signal heads : std_logic_vector (159 downto 0);
  signal available : std_logic_vector (4 downto 0);
  signal pop : std_logic_vector (4 downto 0);
  signal accepted : std_logic_vector (4 downto 0);
  signal requests : std_logic_vector (24 downto 0);
  signal grants : std_logic_vector (24 downto 0);
  signal routes : std_logic_vector (154 downto 0);
  signal inputs_n1_live_fifo_c_in_ready : std_logic;
  signal inputs_n1_live_fifo_c_out_data : std_logic_vector (31 downto 0);
  signal inputs_n1_live_fifo_c_out_valid : std_logic;
  signal inputs_n1_live_fifo_c_count : std_logic_vector (30 downto 0);
  signal n1797_o : std_logic_vector (31 downto 0);
  signal n1798_o : std_logic;
  signal n1802_o : std_logic;
  signal inputs_n1_live_route_c_requested_port : std_logic_vector (30 downto 0);
  signal n1804_o : std_logic_vector (31 downto 0);
  signal inputs_n4_live_fifo_c_in_ready : std_logic;
  signal inputs_n4_live_fifo_c_out_data : std_logic_vector (31 downto 0);
  signal inputs_n4_live_fifo_c_out_valid : std_logic;
  signal inputs_n4_live_fifo_c_count : std_logic_vector (30 downto 0);
  signal n1816_o : std_logic_vector (31 downto 0);
  signal n1817_o : std_logic;
  signal n1821_o : std_logic;
  signal inputs_n4_live_route_c_requested_port : std_logic_vector (30 downto 0);
  signal n1823_o : std_logic_vector (31 downto 0);
  signal inputs_n5_live_fifo_c_in_ready : std_logic;
  signal inputs_n5_live_fifo_c_out_data : std_logic_vector (31 downto 0);
  signal inputs_n5_live_fifo_c_out_valid : std_logic;
  signal inputs_n5_live_fifo_c_count : std_logic_vector (30 downto 0);
  signal n1825_o : std_logic_vector (31 downto 0);
  signal n1826_o : std_logic;
  signal n1830_o : std_logic;
  signal inputs_n5_live_route_c_requested_port : std_logic_vector (30 downto 0);
  signal n1832_o : std_logic_vector (31 downto 0);
  signal n1838_o : std_logic;
  signal n1839_o : std_logic_vector (30 downto 0);
  signal n1840_o : std_logic_vector (2 downto 0);
  constant n1842_o : std_logic_vector (4 downto 0) := "11001";
  signal n1844_o : std_logic;
  signal n1845_o : std_logic_vector (30 downto 0);
  signal n1846_o : std_logic_vector (2 downto 0);
  signal n1848_o : std_logic_vector (2 downto 0);
  constant n1850_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n1854_o : std_logic_vector (24 downto 0);
  signal n1856_o : std_logic;
  signal n1857_o : std_logic;
  signal n1858_o : std_logic;
  signal n1861_o : std_logic;
  constant n1862_o : std_logic_vector (4 downto 0) := "00000";
  signal n1864_o : std_logic;
  signal n1865_o : std_logic;
  signal n1866_o : std_logic;
  signal n1868_o : std_logic;
  signal n1869_o : std_logic;
  signal n1870_o : std_logic;
  signal n1871_o : std_logic;
  signal n1873_o : std_logic;
  signal n1874_o : std_logic;
  signal n1875_o : std_logic;
  signal n1876_o : std_logic;
  signal n1878_o : std_logic;
  signal n1879_o : std_logic;
  signal n1880_o : std_logic;
  signal n1881_o : std_logic;
  signal n1883_o : std_logic;
  signal n1884_o : std_logic;
  signal n1885_o : std_logic_vector (30 downto 0);
  signal n1886_o : std_logic_vector (2 downto 0);
  constant n1888_o : std_logic_vector (4 downto 0) := "11001";
  signal n1890_o : std_logic;
  signal n1891_o : std_logic_vector (30 downto 0);
  signal n1892_o : std_logic_vector (2 downto 0);
  signal n1894_o : std_logic_vector (2 downto 0);
  signal n1898_o : std_logic_vector (24 downto 0);
  signal n1899_o : std_logic;
  signal n1900_o : std_logic;
  signal n1901_o : std_logic;
  signal n1903_o : std_logic;
  signal n1904_o : std_logic;
  signal n1906_o : std_logic;
  signal n1907_o : std_logic;
  signal n1908_o : std_logic;
  signal n1910_o : std_logic;
  signal n1911_o : std_logic;
  signal n1912_o : std_logic;
  signal n1913_o : std_logic;
  signal n1915_o : std_logic;
  signal n1916_o : std_logic;
  signal n1917_o : std_logic;
  signal n1918_o : std_logic;
  signal n1920_o : std_logic;
  signal n1921_o : std_logic;
  signal n1922_o : std_logic;
  signal n1923_o : std_logic;
  signal n1925_o : std_logic;
  signal n1926_o : std_logic;
  signal n1927_o : std_logic_vector (30 downto 0);
  signal n1928_o : std_logic_vector (2 downto 0);
  constant n1930_o : std_logic_vector (4 downto 0) := "11001";
  signal n1932_o : std_logic;
  signal n1933_o : std_logic_vector (30 downto 0);
  signal n1934_o : std_logic_vector (2 downto 0);
  signal n1936_o : std_logic_vector (2 downto 0);
  signal n1940_o : std_logic_vector (24 downto 0);
  signal n1941_o : std_logic;
  signal n1942_o : std_logic;
  signal n1943_o : std_logic;
  signal n1945_o : std_logic;
  signal n1946_o : std_logic;
  signal n1948_o : std_logic;
  signal n1949_o : std_logic;
  signal n1950_o : std_logic;
  signal n1952_o : std_logic;
  signal n1953_o : std_logic;
  signal n1954_o : std_logic;
  signal n1955_o : std_logic;
  signal n1957_o : std_logic;
  signal n1958_o : std_logic;
  signal n1959_o : std_logic;
  signal n1960_o : std_logic;
  signal n1962_o : std_logic;
  signal n1963_o : std_logic;
  signal n1964_o : std_logic;
  signal n1965_o : std_logic;
  signal n1967_o : std_logic;
  signal n1968_o : std_logic;
  signal n1969_o : std_logic_vector (30 downto 0);
  signal n1970_o : std_logic_vector (2 downto 0);
  constant n1972_o : std_logic_vector (4 downto 0) := "11001";
  signal n1974_o : std_logic;
  signal n1975_o : std_logic_vector (30 downto 0);
  signal n1976_o : std_logic_vector (2 downto 0);
  signal n1978_o : std_logic_vector (2 downto 0);
  signal n1982_o : std_logic_vector (24 downto 0);
  signal n1983_o : std_logic;
  signal n1984_o : std_logic;
  signal n1985_o : std_logic;
  signal n1987_o : std_logic;
  signal n1988_o : std_logic;
  signal n1989_o : std_logic;
  signal n1990_o : std_logic;
  signal n1991_o : std_logic;
  signal n1992_o : std_logic;
  signal n1994_o : std_logic;
  signal n1995_o : std_logic;
  signal n1996_o : std_logic;
  signal n1997_o : std_logic;
  signal n1999_o : std_logic;
  signal n2000_o : std_logic;
  signal n2001_o : std_logic;
  signal n2002_o : std_logic;
  signal n2004_o : std_logic;
  signal n2005_o : std_logic;
  signal n2006_o : std_logic;
  signal n2007_o : std_logic;
  signal n2009_o : std_logic;
  signal n2010_o : std_logic;
  signal n2011_o : std_logic_vector (30 downto 0);
  signal n2012_o : std_logic_vector (2 downto 0);
  constant n2014_o : std_logic_vector (4 downto 0) := "11001";
  signal n2016_o : std_logic;
  signal n2017_o : std_logic_vector (30 downto 0);
  signal n2018_o : std_logic_vector (2 downto 0);
  signal n2020_o : std_logic_vector (2 downto 0);
  signal n2024_o : std_logic_vector (24 downto 0);
  signal n2025_o : std_logic;
  signal n2026_o : std_logic;
  signal n2027_o : std_logic;
  signal n2029_o : std_logic;
  signal n2030_o : std_logic;
  signal n2031_o : std_logic;
  signal n2032_o : std_logic;
  signal n2034_o : std_logic;
  signal n2035_o : std_logic;
  signal n2036_o : std_logic;
  signal n2037_o : std_logic;
  signal n2039_o : std_logic;
  signal n2040_o : std_logic;
  signal n2041_o : std_logic;
  signal n2042_o : std_logic;
  signal n2044_o : std_logic;
  signal n2045_o : std_logic;
  signal n2046_o : std_logic;
  signal n2047_o : std_logic;
  signal n2049_o : std_logic;
  signal n2050_o : std_logic_vector (4 downto 0);
  signal outputs_n1_live_arb_c_grant : std_logic_vector (4 downto 0);
  signal outputs_n1_live_arb_c_pointer : std_logic_vector (2 downto 0);
  signal n2054_o : std_logic_vector (4 downto 0);
  signal n2055_o : std_logic;
  signal n2058_o : std_logic_vector (4 downto 0);
  signal n2060_o : std_logic;
  signal n2061_o : std_logic;
  signal n2063_o : std_logic;
  signal n2064_o : std_logic;
  signal n2065_o : std_logic;
  signal outputs_n4_live_arb_c_grant : std_logic_vector (4 downto 0);
  signal outputs_n4_live_arb_c_pointer : std_logic_vector (2 downto 0);
  signal n2072_o : std_logic_vector (4 downto 0);
  signal n2073_o : std_logic;
  signal n2076_o : std_logic_vector (4 downto 0);
  signal n2078_o : std_logic;
  signal n2079_o : std_logic;
  signal n2081_o : std_logic;
  signal n2082_o : std_logic;
  signal n2083_o : std_logic;
  signal outputs_n5_live_arb_c_grant : std_logic_vector (4 downto 0);
  signal outputs_n5_live_arb_c_pointer : std_logic_vector (2 downto 0);
  signal n2084_o : std_logic_vector (4 downto 0);
  signal n2085_o : std_logic;
  signal n2088_o : std_logic_vector (4 downto 0);
  signal n2090_o : std_logic;
  signal n2091_o : std_logic;
  signal n2093_o : std_logic;
  signal n2094_o : std_logic;
  signal n2095_o : std_logic;
  signal crossbar_c_outputs : std_logic_vector (159 downto 0);
  signal n2097_o : std_logic_vector (159 downto 0);
  signal n2098_o : std_logic_vector (4 downto 0);
  signal n2099_o : std_logic_vector (4 downto 0);
  signal n2100_o : std_logic_vector (24 downto 0);
  signal n2101_o : std_logic_vector (154 downto 0);
  signal n2102_o : std_logic_vector (4 downto 0);
  signal n2103_o : std_logic_vector (4 downto 0);
  signal n2104_o : std_logic_vector (154 downto 0);
  signal n2105_o : std_logic;
  signal n2106_o : std_logic;
  signal n2107_o : std_logic;
  signal n2108_o : std_logic;
  signal n2109_o : std_logic;
  signal n2110_o : std_logic_vector (1 downto 0);
  signal n2111_o : std_logic;
  signal n2112_o : std_logic;
  signal n2113_o : std_logic;
  signal n2114_o : std_logic;
  signal n2115_o : std_logic;
  signal n2116_o : std_logic;
  signal n2117_o : std_logic;
  signal n2118_o : std_logic;
  signal n2119_o : std_logic;
  signal n2120_o : std_logic;
  signal n2121_o : std_logic;
  signal n2122_o : std_logic;
  signal n2123_o : std_logic;
  signal n2124_o : std_logic;
  signal n2125_o : std_logic;
  signal n2126_o : std_logic;
  signal n2127_o : std_logic;
  signal n2128_o : std_logic;
  signal n2129_o : std_logic;
  signal n2130_o : std_logic_vector (3 downto 0);
  signal n2131_o : std_logic;
  signal n2132_o : std_logic;
  signal n2133_o : std_logic_vector (3 downto 0);
  signal n2134_o : std_logic;
  signal n2135_o : std_logic;
  signal n2136_o : std_logic_vector (3 downto 0);
  signal n2137_o : std_logic;
  signal n2138_o : std_logic;
  signal n2139_o : std_logic_vector (3 downto 0);
  signal n2140_o : std_logic;
  signal n2141_o : std_logic;
  signal n2142_o : std_logic_vector (3 downto 0);
  signal n2143_o : std_logic_vector (24 downto 0);
  signal n2144_o : std_logic;
  signal n2145_o : std_logic;
  signal n2146_o : std_logic;
  signal n2147_o : std_logic;
  signal n2148_o : std_logic;
  signal n2149_o : std_logic_vector (1 downto 0);
  signal n2150_o : std_logic;
  signal n2151_o : std_logic;
  signal n2152_o : std_logic;
  signal n2153_o : std_logic;
  signal n2154_o : std_logic;
  signal n2155_o : std_logic;
  signal n2156_o : std_logic;
  signal n2157_o : std_logic;
  signal n2158_o : std_logic;
  signal n2159_o : std_logic;
  signal n2160_o : std_logic;
  signal n2161_o : std_logic;
  signal n2162_o : std_logic;
  signal n2163_o : std_logic;
  signal n2164_o : std_logic;
  signal n2165_o : std_logic;
  signal n2166_o : std_logic;
  signal n2167_o : std_logic;
  signal n2168_o : std_logic;
  signal n2169_o : std_logic;
  signal n2170_o : std_logic_vector (3 downto 0);
  signal n2171_o : std_logic;
  signal n2172_o : std_logic;
  signal n2173_o : std_logic_vector (3 downto 0);
  signal n2174_o : std_logic;
  signal n2175_o : std_logic;
  signal n2176_o : std_logic_vector (3 downto 0);
  signal n2177_o : std_logic;
  signal n2178_o : std_logic;
  signal n2179_o : std_logic_vector (3 downto 0);
  signal n2180_o : std_logic;
  signal n2181_o : std_logic;
  signal n2182_o : std_logic_vector (2 downto 0);
  signal n2183_o : std_logic_vector (24 downto 0);
  signal n2184_o : std_logic;
  signal n2185_o : std_logic;
  signal n2186_o : std_logic;
  signal n2187_o : std_logic;
  signal n2188_o : std_logic;
  signal n2189_o : std_logic_vector (1 downto 0);
  signal n2190_o : std_logic;
  signal n2191_o : std_logic;
  signal n2192_o : std_logic;
  signal n2193_o : std_logic;
  signal n2194_o : std_logic;
  signal n2195_o : std_logic;
  signal n2196_o : std_logic;
  signal n2197_o : std_logic;
  signal n2198_o : std_logic;
  signal n2199_o : std_logic;
  signal n2200_o : std_logic;
  signal n2201_o : std_logic;
  signal n2202_o : std_logic;
  signal n2203_o : std_logic;
  signal n2204_o : std_logic;
  signal n2205_o : std_logic;
  signal n2206_o : std_logic;
  signal n2207_o : std_logic_vector (1 downto 0);
  signal n2208_o : std_logic;
  signal n2209_o : std_logic;
  signal n2210_o : std_logic_vector (3 downto 0);
  signal n2211_o : std_logic;
  signal n2212_o : std_logic;
  signal n2213_o : std_logic_vector (3 downto 0);
  signal n2214_o : std_logic;
  signal n2215_o : std_logic;
  signal n2216_o : std_logic_vector (3 downto 0);
  signal n2217_o : std_logic;
  signal n2218_o : std_logic;
  signal n2219_o : std_logic_vector (3 downto 0);
  signal n2220_o : std_logic;
  signal n2221_o : std_logic;
  signal n2222_o : std_logic_vector (1 downto 0);
  signal n2223_o : std_logic_vector (24 downto 0);
  signal n2224_o : std_logic;
  signal n2225_o : std_logic;
  signal n2226_o : std_logic;
  signal n2227_o : std_logic;
  signal n2228_o : std_logic;
  signal n2229_o : std_logic_vector (1 downto 0);
  signal n2230_o : std_logic;
  signal n2231_o : std_logic;
  signal n2232_o : std_logic;
  signal n2233_o : std_logic;
  signal n2234_o : std_logic;
  signal n2235_o : std_logic;
  signal n2236_o : std_logic;
  signal n2237_o : std_logic;
  signal n2238_o : std_logic;
  signal n2239_o : std_logic;
  signal n2240_o : std_logic;
  signal n2241_o : std_logic;
  signal n2242_o : std_logic;
  signal n2243_o : std_logic;
  signal n2244_o : std_logic;
  signal n2245_o : std_logic;
  signal n2246_o : std_logic;
  signal n2247_o : std_logic_vector (2 downto 0);
  signal n2248_o : std_logic;
  signal n2249_o : std_logic;
  signal n2250_o : std_logic_vector (3 downto 0);
  signal n2251_o : std_logic;
  signal n2252_o : std_logic;
  signal n2253_o : std_logic_vector (3 downto 0);
  signal n2254_o : std_logic;
  signal n2255_o : std_logic;
  signal n2256_o : std_logic_vector (3 downto 0);
  signal n2257_o : std_logic;
  signal n2258_o : std_logic;
  signal n2259_o : std_logic_vector (3 downto 0);
  signal n2260_o : std_logic;
  signal n2261_o : std_logic;
  signal n2262_o : std_logic;
  signal n2263_o : std_logic_vector (24 downto 0);
  signal n2264_o : std_logic;
  signal n2265_o : std_logic;
  signal n2266_o : std_logic;
  signal n2267_o : std_logic;
  signal n2268_o : std_logic;
  signal n2269_o : std_logic_vector (1 downto 0);
  signal n2270_o : std_logic;
  signal n2271_o : std_logic;
  signal n2272_o : std_logic;
  signal n2273_o : std_logic;
  signal n2274_o : std_logic;
  signal n2275_o : std_logic;
  signal n2276_o : std_logic;
  signal n2277_o : std_logic;
  signal n2278_o : std_logic;
  signal n2279_o : std_logic;
  signal n2280_o : std_logic;
  signal n2281_o : std_logic;
  signal n2282_o : std_logic;
  signal n2283_o : std_logic;
  signal n2284_o : std_logic;
  signal n2285_o : std_logic;
  signal n2286_o : std_logic;
  signal n2287_o : std_logic_vector (3 downto 0);
  signal n2288_o : std_logic;
  signal n2289_o : std_logic;
  signal n2290_o : std_logic_vector (3 downto 0);
  signal n2291_o : std_logic;
  signal n2292_o : std_logic;
  signal n2293_o : std_logic_vector (3 downto 0);
  signal n2294_o : std_logic;
  signal n2295_o : std_logic;
  signal n2296_o : std_logic_vector (3 downto 0);
  signal n2297_o : std_logic;
  signal n2298_o : std_logic;
  signal n2299_o : std_logic_vector (3 downto 0);
  signal n2300_o : std_logic;
  signal n2301_o : std_logic;
  signal n2302_o : std_logic_vector (24 downto 0);
begin
  in_ready <= n2102_o;
  out_data <= crossbar_c_outputs;
  out_valid <= n2103_o;
  dbg_count <= n2104_o;
  dbg_req <= requests;
  dbg_grant <= grants;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:13:10
  heads <= n2097_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:14:10
  available <= n2098_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:14:20
  pop <= n2050_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:14:24
  accepted <= n2099_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:15:10
  requests <= n2024_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:15:19
  grants <= n2100_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:16:10
  routes <= n2101_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:20:7
  inputs_n1_live_fifo : entity work.fifo_buffer_4 port map (
    clk => clk,
    rst => rst,
    in_data => n1797_o,
    in_valid => n1798_o,
    out_ready => n1802_o,
    in_ready => inputs_n1_live_fifo_c_in_ready,
    out_data => inputs_n1_live_fifo_c_out_data,
    out_valid => inputs_n1_live_fifo_c_out_valid,
    count => inputs_n1_live_fifo_c_count);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:33
  n1797_o <= in_data (159 downto 128);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:45
  n1798_o <= in_valid (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:86
  n1802_o <= pop (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:22:7
  inputs_n1_live_route : entity work.xy_route_unit_3 port map (
    packet => n1804_o,
    requested_port => inputs_n1_live_route_c_requested_port);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:23:23
  n1804_o <= heads (159 downto 128);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:20:7
  inputs_n4_live_fifo : entity work.fifo_buffer_4 port map (
    clk => clk,
    rst => rst,
    in_data => n1816_o,
    in_valid => n1817_o,
    out_ready => n1821_o,
    in_ready => inputs_n4_live_fifo_c_in_ready,
    out_data => inputs_n4_live_fifo_c_out_data,
    out_valid => inputs_n4_live_fifo_c_out_valid,
    count => inputs_n4_live_fifo_c_count);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:33
  n1816_o <= in_data (63 downto 32);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:45
  n1817_o <= in_valid (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:86
  n1821_o <= pop (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:22:7
  inputs_n4_live_route : entity work.xy_route_unit_3 port map (
    packet => n1823_o,
    requested_port => inputs_n4_live_route_c_requested_port);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:23:23
  n1823_o <= heads (63 downto 32);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:20:7
  inputs_n5_live_fifo : entity work.fifo_buffer_4 port map (
    clk => clk,
    rst => rst,
    in_data => n1825_o,
    in_valid => n1826_o,
    out_ready => n1830_o,
    in_ready => inputs_n5_live_fifo_c_in_ready,
    out_data => inputs_n5_live_fifo_c_out_data,
    out_valid => inputs_n5_live_fifo_c_out_valid,
    count => inputs_n5_live_fifo_c_count);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:33
  n1825_o <= in_data (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:45
  n1826_o <= in_valid (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:86
  n1830_o <= pop (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:22:7
  inputs_n5_live_route : entity work.xy_route_unit_3 port map (
    packet => n1832_o,
    requested_port => inputs_n5_live_route_c_requested_port);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:23:23
  n1832_o <= heads (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n1838_o <= available (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1839_o <= routes (154 downto 124);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1840_o <= n1839_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n1844_o <= n2113_o and n1838_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1845_o <= routes (154 downto 124);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1846_o <= n1845_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1848_o <= std_logic_vector (unsigned'("100") - unsigned (n1846_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n1854_o <= "0000000000000000000000000" when n1844_o = '0' else n2143_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1856_o <= grants (20);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1857_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1858_o <= n1857_o and n1856_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1861_o <= '0' when n1858_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1864_o <= grants (15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1865_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1866_o <= n1865_o and n1864_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1868_o <= n1861_o when n1866_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1869_o <= grants (10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1870_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1871_o <= n1870_o and n1869_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1873_o <= n1868_o when n1871_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1874_o <= grants (5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1875_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1876_o <= n1875_o and n1874_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1878_o <= n1873_o when n1876_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1879_o <= grants (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1880_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1881_o <= n1880_o and n1879_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1883_o <= n1878_o when n1881_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n1884_o <= available (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1885_o <= routes (123 downto 93);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1886_o <= n1885_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n1890_o <= n2152_o and n1884_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1891_o <= routes (123 downto 93);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1892_o <= n1891_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1894_o <= std_logic_vector (unsigned'("100") - unsigned (n1892_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n1898_o <= n1854_o when n1890_o = '0' else n2183_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1899_o <= grants (21);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1900_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1901_o <= n1900_o and n1899_o;
  n1903_o <= n1862_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1904_o <= n1903_o when n1901_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1906_o <= grants (16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1907_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1908_o <= n1907_o and n1906_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1910_o <= n1904_o when n1908_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1911_o <= grants (11);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1912_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1913_o <= n1912_o and n1911_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1915_o <= n1910_o when n1913_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1916_o <= grants (6);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1917_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1918_o <= n1917_o and n1916_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1920_o <= n1915_o when n1918_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1921_o <= grants (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1922_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1923_o <= n1922_o and n1921_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1925_o <= n1920_o when n1923_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n1926_o <= available (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1927_o <= routes (92 downto 62);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1928_o <= n1927_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n1932_o <= n2192_o and n1926_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1933_o <= routes (92 downto 62);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1934_o <= n1933_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1936_o <= std_logic_vector (unsigned'("100") - unsigned (n1934_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n1940_o <= n1898_o when n1932_o = '0' else n2223_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1941_o <= grants (22);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1942_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1943_o <= n1942_o and n1941_o;
  n1945_o <= n1862_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1946_o <= n1945_o when n1943_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1948_o <= grants (17);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1949_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1950_o <= n1949_o and n1948_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1952_o <= n1946_o when n1950_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1953_o <= grants (12);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1954_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1955_o <= n1954_o and n1953_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1957_o <= n1952_o when n1955_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1958_o <= grants (7);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1959_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1960_o <= n1959_o and n1958_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1962_o <= n1957_o when n1960_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1963_o <= grants (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1964_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1965_o <= n1964_o and n1963_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1967_o <= n1962_o when n1965_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n1968_o <= available (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1969_o <= routes (61 downto 31);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1970_o <= n1969_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n1974_o <= n2232_o and n1968_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1975_o <= routes (61 downto 31);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1976_o <= n1975_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1978_o <= std_logic_vector (unsigned'("100") - unsigned (n1976_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n1982_o <= n1940_o when n1974_o = '0' else n2263_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1983_o <= grants (23);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1984_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1985_o <= n1984_o and n1983_o;
  n1987_o <= n1862_o (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1988_o <= n1987_o when n1985_o = '0' else '1';
  n1989_o <= n1862_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1990_o <= grants (18);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1991_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1992_o <= n1991_o and n1990_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1994_o <= n1988_o when n1992_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1995_o <= grants (13);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1996_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1997_o <= n1996_o and n1995_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1999_o <= n1994_o when n1997_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n2000_o <= grants (8);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n2001_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n2002_o <= n2001_o and n2000_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n2004_o <= n1999_o when n2002_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n2005_o <= grants (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n2006_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n2007_o <= n2006_o and n2005_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n2009_o <= n2004_o when n2007_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n2010_o <= available (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n2011_o <= routes (30 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n2012_o <= n2011_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n2016_o <= n2272_o and n2010_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n2017_o <= routes (30 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n2018_o <= n2017_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n2020_o <= std_logic_vector (unsigned'("100") - unsigned (n2018_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n2024_o <= n1982_o when n2016_o = '0' else n2302_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n2025_o <= grants (24);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n2026_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n2027_o <= n2026_o and n2025_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n2029_o <= n1989_o when n2027_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n2030_o <= grants (19);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n2031_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n2032_o <= n2031_o and n2030_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n2034_o <= n2029_o when n2032_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n2035_o <= grants (14);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n2036_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n2037_o <= n2036_o and n2035_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n2039_o <= n2034_o when n2037_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n2040_o <= grants (9);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n2041_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n2042_o <= n2041_o and n2040_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n2044_o <= n2039_o when n2042_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n2045_o <= grants (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n2046_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n2047_o <= n2046_o and n2045_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n2049_o <= n2044_o when n2047_o = '0' else '1';
  n2050_o <= n2049_o & n2009_o & n1967_o & n1925_o & n1883_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:7
  outputs_n1_live_arb : entity work.rr_arbiter port map (
    clk => clk,
    rst => rst,
    req => n2054_o,
    accept => n2055_o,
    grant => outputs_n1_live_arb_c_grant,
    pointer => open);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:61
  n2054_o <= requests (24 downto 20);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:73
  n2055_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:36
  n2058_o <= grants (24 downto 20);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:39
  n2060_o <= '1' when n2058_o /= "00000" else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:25
  n2061_o <= '0' when n2060_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:29
  n2063_o <= n2103_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:46
  n2064_o <= out_ready (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:33
  n2065_o <= n2063_o and n2064_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:7
  outputs_n4_live_arb : entity work.rr_arbiter port map (
    clk => clk,
    rst => rst,
    req => n2072_o,
    accept => n2073_o,
    grant => outputs_n4_live_arb_c_grant,
    pointer => open);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:61
  n2072_o <= requests (9 downto 5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:73
  n2073_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:36
  n2076_o <= grants (9 downto 5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:39
  n2078_o <= '1' when n2076_o /= "00000" else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:25
  n2079_o <= '0' when n2078_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:29
  n2081_o <= n2103_o (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:46
  n2082_o <= out_ready (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:33
  n2083_o <= n2081_o and n2082_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:7
  outputs_n5_live_arb : entity work.rr_arbiter port map (
    clk => clk,
    rst => rst,
    req => n2084_o,
    accept => n2085_o,
    grant => outputs_n5_live_arb_c_grant,
    pointer => open);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:61
  n2084_o <= requests (4 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:73
  n2085_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:36
  n2088_o <= grants (4 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:39
  n2090_o <= '1' when n2088_o /= "00000" else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:25
  n2091_o <= '0' when n2090_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:29
  n2093_o <= n2103_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:46
  n2094_o <= out_ready (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:33
  n2095_o <= n2093_o and n2094_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:52:3
  crossbar : entity work.crossbar_5x5 port map (
    heads => heads,
    grants => grants,
    outputs => crossbar_c_outputs);
  n2097_o <= inputs_n1_live_fifo_c_out_data & "00000000000000000000000000000000" & "00000000000000000000000000000000" & inputs_n4_live_fifo_c_out_data & inputs_n5_live_fifo_c_out_data;
  n2098_o <= inputs_n5_live_fifo_c_out_valid & inputs_n4_live_fifo_c_out_valid & '0' & '0' & inputs_n1_live_fifo_c_out_valid;
  n2099_o <= n2095_o & n2083_o & '0' & '0' & n2065_o;
  n2100_o <= outputs_n1_live_arb_c_grant & "00000" & "00000" & outputs_n4_live_arb_c_grant & outputs_n5_live_arb_c_grant;
  n2101_o <= inputs_n1_live_route_c_requested_port & "0000000000000000000000000000100" & "0000000000000000000000000000100" & inputs_n4_live_route_c_requested_port & inputs_n5_live_route_c_requested_port;
  n2102_o <= inputs_n5_live_fifo_c_in_ready & inputs_n4_live_fifo_c_in_ready & '0' & '0' & inputs_n1_live_fifo_c_in_ready;
  n2103_o <= n2091_o & n2079_o & '0' & '0' & n2061_o;
  n2104_o <= inputs_n1_live_fifo_c_count & "0000000000000000000000000000000" & "0000000000000000000000000000000" & inputs_n4_live_fifo_c_count & inputs_n5_live_fifo_c_count;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:52:61
  n2105_o <= n1842_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:77
  n2106_o <= n1842_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:77
  n2107_o <= n1842_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:77
  n2108_o <= n1842_o (3);
  n2109_o <= n1842_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n2110_o <= n1840_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n2110_o select n2111_o <=
    n2105_o when "00",
    n2106_o when "01",
    n2107_o when "10",
    n2108_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n2112_o <= n1840_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n2113_o <= n2111_o when n2112_o = '0' else n2109_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2114_o <= n1848_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2115_o <= not n2114_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2116_o <= n1848_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2117_o <= not n2116_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2118_o <= n2115_o and n2117_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2119_o <= n2115_o and n2116_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2120_o <= n2114_o and n2117_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2121_o <= n1848_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2122_o <= not n2121_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2123_o <= n2118_o and n2122_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2124_o <= n2118_o and n2121_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2125_o <= n2119_o and n2122_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2126_o <= n2119_o and n2121_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2127_o <= n2120_o and n2122_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:9:39
  n2128_o <= n1850_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2129_o <= n2128_o when n2123_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:8:39
  n2130_o <= n1850_o (4 downto 1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:8:5
  n2131_o <= n1850_o (5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2132_o <= n2131_o when n2124_o = '0' else '1';
  n2133_o <= n1850_o (9 downto 6);
  n2134_o <= n1850_o (10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2135_o <= n2134_o when n2125_o = '0' else '1';
  n2136_o <= n1850_o (14 downto 11);
  n2137_o <= n1850_o (15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2138_o <= n2137_o when n2126_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:29:3
  n2139_o <= n1850_o (19 downto 16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:31:14
  n2140_o <= n1850_o (20);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2141_o <= n2140_o when n2127_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:30:14
  n2142_o <= n1850_o (24 downto 21);
  n2143_o <= n2142_o & n2141_o & n2139_o & n2138_o & n2136_o & n2135_o & n2133_o & n2132_o & n2130_o & n2129_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n2144_o <= n1888_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2145_o <= n1888_o (1);
  n2146_o <= n1888_o (2);
  n2147_o <= n1888_o (3);
  n2148_o <= n1888_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n2149_o <= n1886_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n2149_o select n2150_o <=
    n2144_o when "00",
    n2145_o when "01",
    n2146_o when "10",
    n2147_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n2151_o <= n1886_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n2152_o <= n2150_o when n2151_o = '0' else n2148_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2153_o <= n1894_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2154_o <= not n2153_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2155_o <= n1894_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2156_o <= not n2155_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2157_o <= n2154_o and n2156_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2158_o <= n2154_o and n2155_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2159_o <= n2153_o and n2156_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2160_o <= n1894_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2161_o <= not n2160_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2162_o <= n2157_o and n2161_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2163_o <= n2157_o and n2160_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2164_o <= n2158_o and n2161_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2165_o <= n2158_o and n2160_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2166_o <= n2159_o and n2161_o;
  n2167_o <= n1854_o (0);
  n2168_o <= n1854_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2169_o <= n2168_o when n2162_o = '0' else '1';
  n2170_o <= n1854_o (5 downto 2);
  n2171_o <= n1854_o (6);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2172_o <= n2171_o when n2163_o = '0' else '1';
  n2173_o <= n1854_o (10 downto 7);
  n2174_o <= n1854_o (11);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2175_o <= n2174_o when n2164_o = '0' else '1';
  n2176_o <= n1854_o (15 downto 12);
  n2177_o <= n1854_o (16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2178_o <= n2177_o when n2165_o = '0' else '1';
  n2179_o <= n1854_o (20 downto 17);
  n2180_o <= n1854_o (21);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2181_o <= n2180_o when n2166_o = '0' else '1';
  n2182_o <= n1854_o (24 downto 22);
  n2183_o <= n2182_o & n2181_o & n2179_o & n2178_o & n2176_o & n2175_o & n2173_o & n2172_o & n2170_o & n2169_o & n2167_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n2184_o <= n1930_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2185_o <= n1930_o (1);
  n2186_o <= n1930_o (2);
  n2187_o <= n1930_o (3);
  n2188_o <= n1930_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n2189_o <= n1928_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n2189_o select n2190_o <=
    n2184_o when "00",
    n2185_o when "01",
    n2186_o when "10",
    n2187_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n2191_o <= n1928_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n2192_o <= n2190_o when n2191_o = '0' else n2188_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2193_o <= n1936_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2194_o <= not n2193_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2195_o <= n1936_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2196_o <= not n2195_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2197_o <= n2194_o and n2196_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2198_o <= n2194_o and n2195_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2199_o <= n2193_o and n2196_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2200_o <= n1936_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2201_o <= not n2200_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2202_o <= n2197_o and n2201_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2203_o <= n2197_o and n2200_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2204_o <= n2198_o and n2201_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2205_o <= n2198_o and n2200_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2206_o <= n2199_o and n2201_o;
  n2207_o <= n1898_o (1 downto 0);
  n2208_o <= n1898_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2209_o <= n2208_o when n2202_o = '0' else '1';
  n2210_o <= n1898_o (6 downto 3);
  n2211_o <= n1898_o (7);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2212_o <= n2211_o when n2203_o = '0' else '1';
  n2213_o <= n1898_o (11 downto 8);
  n2214_o <= n1898_o (12);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2215_o <= n2214_o when n2204_o = '0' else '1';
  n2216_o <= n1898_o (16 downto 13);
  n2217_o <= n1898_o (17);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2218_o <= n2217_o when n2205_o = '0' else '1';
  n2219_o <= n1898_o (21 downto 18);
  n2220_o <= n1898_o (22);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2221_o <= n2220_o when n2206_o = '0' else '1';
  n2222_o <= n1898_o (24 downto 23);
  n2223_o <= n2222_o & n2221_o & n2219_o & n2218_o & n2216_o & n2215_o & n2213_o & n2212_o & n2210_o & n2209_o & n2207_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n2224_o <= n1972_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2225_o <= n1972_o (1);
  n2226_o <= n1972_o (2);
  n2227_o <= n1972_o (3);
  n2228_o <= n1972_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n2229_o <= n1970_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n2229_o select n2230_o <=
    n2224_o when "00",
    n2225_o when "01",
    n2226_o when "10",
    n2227_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n2231_o <= n1970_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n2232_o <= n2230_o when n2231_o = '0' else n2228_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2233_o <= n1978_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2234_o <= not n2233_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2235_o <= n1978_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2236_o <= not n2235_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2237_o <= n2234_o and n2236_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2238_o <= n2234_o and n2235_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2239_o <= n2233_o and n2236_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2240_o <= n1978_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2241_o <= not n2240_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2242_o <= n2237_o and n2241_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2243_o <= n2237_o and n2240_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2244_o <= n2238_o and n2241_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2245_o <= n2238_o and n2240_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2246_o <= n2239_o and n2241_o;
  n2247_o <= n1940_o (2 downto 0);
  n2248_o <= n1940_o (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2249_o <= n2248_o when n2242_o = '0' else '1';
  n2250_o <= n1940_o (7 downto 4);
  n2251_o <= n1940_o (8);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2252_o <= n2251_o when n2243_o = '0' else '1';
  n2253_o <= n1940_o (12 downto 9);
  n2254_o <= n1940_o (13);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2255_o <= n2254_o when n2244_o = '0' else '1';
  n2256_o <= n1940_o (17 downto 14);
  n2257_o <= n1940_o (18);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2258_o <= n2257_o when n2245_o = '0' else '1';
  n2259_o <= n1940_o (22 downto 19);
  n2260_o <= n1940_o (23);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2261_o <= n2260_o when n2246_o = '0' else '1';
  n2262_o <= n1940_o (24);
  n2263_o <= n2262_o & n2261_o & n2259_o & n2258_o & n2256_o & n2255_o & n2253_o & n2252_o & n2250_o & n2249_o & n2247_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n2264_o <= n2014_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2265_o <= n2014_o (1);
  n2266_o <= n2014_o (2);
  n2267_o <= n2014_o (3);
  n2268_o <= n2014_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n2269_o <= n2012_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n2269_o select n2270_o <=
    n2264_o when "00",
    n2265_o when "01",
    n2266_o when "10",
    n2267_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n2271_o <= n2012_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n2272_o <= n2270_o when n2271_o = '0' else n2268_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2273_o <= n2020_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2274_o <= not n2273_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2275_o <= n2020_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2276_o <= not n2275_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2277_o <= n2274_o and n2276_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2278_o <= n2274_o and n2275_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2279_o <= n2273_o and n2276_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2280_o <= n2020_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2281_o <= not n2280_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2282_o <= n2277_o and n2281_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2283_o <= n2277_o and n2280_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2284_o <= n2278_o and n2281_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2285_o <= n2278_o and n2280_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2286_o <= n2279_o and n2281_o;
  n2287_o <= n1982_o (3 downto 0);
  n2288_o <= n1982_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2289_o <= n2288_o when n2282_o = '0' else '1';
  n2290_o <= n1982_o (8 downto 5);
  n2291_o <= n1982_o (9);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2292_o <= n2291_o when n2283_o = '0' else '1';
  n2293_o <= n1982_o (13 downto 10);
  n2294_o <= n1982_o (14);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2295_o <= n2294_o when n2284_o = '0' else '1';
  n2296_o <= n1982_o (18 downto 15);
  n2297_o <= n1982_o (19);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2298_o <= n2297_o when n2285_o = '0' else '1';
  n2299_o <= n1982_o (23 downto 20);
  n2300_o <= n1982_o (24);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n2301_o <= n2300_o when n2286_o = '0' else '1';
  n2302_o <= n2301_o & n2299_o & n2298_o & n2296_o & n2295_o & n2293_o & n2292_o & n2290_o & n2289_o & n2287_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity router_2_4 is
  port (
    clk : in std_logic;
    rst : in std_logic;
    in_data : in std_logic_vector (159 downto 0);
    in_valid : in std_logic_vector (4 downto 0);
    out_ready : in std_logic_vector (4 downto 0);
    in_ready : out std_logic_vector (4 downto 0);
    out_data : out std_logic_vector (159 downto 0);
    out_valid : out std_logic_vector (4 downto 0);
    dbg_count : out std_logic_vector (154 downto 0);
    dbg_req : out std_logic_vector (24 downto 0);
    dbg_grant : out std_logic_vector (24 downto 0));
end entity router_2_4;

architecture rtl of router_2_4 is
  signal heads : std_logic_vector (159 downto 0);
  signal available : std_logic_vector (4 downto 0);
  signal pop : std_logic_vector (4 downto 0);
  signal accepted : std_logic_vector (4 downto 0);
  signal requests : std_logic_vector (24 downto 0);
  signal grants : std_logic_vector (24 downto 0);
  signal routes : std_logic_vector (154 downto 0);
  signal inputs_n1_live_fifo_c_in_ready : std_logic;
  signal inputs_n1_live_fifo_c_out_data : std_logic_vector (31 downto 0);
  signal inputs_n1_live_fifo_c_out_valid : std_logic;
  signal inputs_n1_live_fifo_c_count : std_logic_vector (30 downto 0);
  signal n1285_o : std_logic_vector (31 downto 0);
  signal n1286_o : std_logic;
  signal n1290_o : std_logic;
  signal inputs_n1_live_route_c_requested_port : std_logic_vector (30 downto 0);
  signal n1292_o : std_logic_vector (31 downto 0);
  signal inputs_n3_live_fifo_c_in_ready : std_logic;
  signal inputs_n3_live_fifo_c_out_data : std_logic_vector (31 downto 0);
  signal inputs_n3_live_fifo_c_out_valid : std_logic;
  signal inputs_n3_live_fifo_c_count : std_logic_vector (30 downto 0);
  signal n1299_o : std_logic_vector (31 downto 0);
  signal n1300_o : std_logic;
  signal n1304_o : std_logic;
  signal inputs_n3_live_route_c_requested_port : std_logic_vector (30 downto 0);
  signal n1306_o : std_logic_vector (31 downto 0);
  signal inputs_n5_live_fifo_c_in_ready : std_logic;
  signal inputs_n5_live_fifo_c_out_data : std_logic_vector (31 downto 0);
  signal inputs_n5_live_fifo_c_out_valid : std_logic;
  signal inputs_n5_live_fifo_c_count : std_logic_vector (30 downto 0);
  signal n1313_o : std_logic_vector (31 downto 0);
  signal n1314_o : std_logic;
  signal n1318_o : std_logic;
  signal inputs_n5_live_route_c_requested_port : std_logic_vector (30 downto 0);
  signal n1320_o : std_logic_vector (31 downto 0);
  signal n1326_o : std_logic;
  signal n1327_o : std_logic_vector (30 downto 0);
  signal n1328_o : std_logic_vector (2 downto 0);
  constant n1330_o : std_logic_vector (4 downto 0) := "10101";
  signal n1332_o : std_logic;
  signal n1333_o : std_logic_vector (30 downto 0);
  signal n1334_o : std_logic_vector (2 downto 0);
  signal n1336_o : std_logic_vector (2 downto 0);
  constant n1338_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n1342_o : std_logic_vector (24 downto 0);
  signal n1344_o : std_logic;
  signal n1345_o : std_logic;
  signal n1346_o : std_logic;
  signal n1349_o : std_logic;
  constant n1350_o : std_logic_vector (4 downto 0) := "00000";
  signal n1352_o : std_logic;
  signal n1353_o : std_logic;
  signal n1354_o : std_logic;
  signal n1356_o : std_logic;
  signal n1357_o : std_logic;
  signal n1358_o : std_logic;
  signal n1359_o : std_logic;
  signal n1361_o : std_logic;
  signal n1362_o : std_logic;
  signal n1363_o : std_logic;
  signal n1364_o : std_logic;
  signal n1366_o : std_logic;
  signal n1367_o : std_logic;
  signal n1368_o : std_logic;
  signal n1369_o : std_logic;
  signal n1371_o : std_logic;
  signal n1372_o : std_logic;
  signal n1373_o : std_logic_vector (30 downto 0);
  signal n1374_o : std_logic_vector (2 downto 0);
  constant n1376_o : std_logic_vector (4 downto 0) := "10101";
  signal n1378_o : std_logic;
  signal n1379_o : std_logic_vector (30 downto 0);
  signal n1380_o : std_logic_vector (2 downto 0);
  signal n1382_o : std_logic_vector (2 downto 0);
  signal n1386_o : std_logic_vector (24 downto 0);
  signal n1387_o : std_logic;
  signal n1388_o : std_logic;
  signal n1389_o : std_logic;
  signal n1391_o : std_logic;
  signal n1392_o : std_logic;
  signal n1394_o : std_logic;
  signal n1395_o : std_logic;
  signal n1396_o : std_logic;
  signal n1398_o : std_logic;
  signal n1399_o : std_logic;
  signal n1400_o : std_logic;
  signal n1401_o : std_logic;
  signal n1403_o : std_logic;
  signal n1404_o : std_logic;
  signal n1405_o : std_logic;
  signal n1406_o : std_logic;
  signal n1408_o : std_logic;
  signal n1409_o : std_logic;
  signal n1410_o : std_logic;
  signal n1411_o : std_logic;
  signal n1413_o : std_logic;
  signal n1414_o : std_logic;
  signal n1415_o : std_logic_vector (30 downto 0);
  signal n1416_o : std_logic_vector (2 downto 0);
  constant n1418_o : std_logic_vector (4 downto 0) := "10101";
  signal n1420_o : std_logic;
  signal n1421_o : std_logic_vector (30 downto 0);
  signal n1422_o : std_logic_vector (2 downto 0);
  signal n1424_o : std_logic_vector (2 downto 0);
  signal n1428_o : std_logic_vector (24 downto 0);
  signal n1429_o : std_logic;
  signal n1430_o : std_logic;
  signal n1431_o : std_logic;
  signal n1433_o : std_logic;
  signal n1434_o : std_logic;
  signal n1436_o : std_logic;
  signal n1437_o : std_logic;
  signal n1438_o : std_logic;
  signal n1440_o : std_logic;
  signal n1441_o : std_logic;
  signal n1442_o : std_logic;
  signal n1443_o : std_logic;
  signal n1445_o : std_logic;
  signal n1446_o : std_logic;
  signal n1447_o : std_logic;
  signal n1448_o : std_logic;
  signal n1450_o : std_logic;
  signal n1451_o : std_logic;
  signal n1452_o : std_logic;
  signal n1453_o : std_logic;
  signal n1455_o : std_logic;
  signal n1456_o : std_logic;
  signal n1457_o : std_logic_vector (30 downto 0);
  signal n1458_o : std_logic_vector (2 downto 0);
  constant n1460_o : std_logic_vector (4 downto 0) := "10101";
  signal n1462_o : std_logic;
  signal n1463_o : std_logic_vector (30 downto 0);
  signal n1464_o : std_logic_vector (2 downto 0);
  signal n1466_o : std_logic_vector (2 downto 0);
  signal n1470_o : std_logic_vector (24 downto 0);
  signal n1471_o : std_logic;
  signal n1472_o : std_logic;
  signal n1473_o : std_logic;
  signal n1475_o : std_logic;
  signal n1476_o : std_logic;
  signal n1477_o : std_logic;
  signal n1478_o : std_logic;
  signal n1479_o : std_logic;
  signal n1480_o : std_logic;
  signal n1482_o : std_logic;
  signal n1483_o : std_logic;
  signal n1484_o : std_logic;
  signal n1485_o : std_logic;
  signal n1487_o : std_logic;
  signal n1488_o : std_logic;
  signal n1489_o : std_logic;
  signal n1490_o : std_logic;
  signal n1492_o : std_logic;
  signal n1493_o : std_logic;
  signal n1494_o : std_logic;
  signal n1495_o : std_logic;
  signal n1497_o : std_logic;
  signal n1498_o : std_logic;
  signal n1499_o : std_logic_vector (30 downto 0);
  signal n1500_o : std_logic_vector (2 downto 0);
  constant n1502_o : std_logic_vector (4 downto 0) := "10101";
  signal n1504_o : std_logic;
  signal n1505_o : std_logic_vector (30 downto 0);
  signal n1506_o : std_logic_vector (2 downto 0);
  signal n1508_o : std_logic_vector (2 downto 0);
  signal n1512_o : std_logic_vector (24 downto 0);
  signal n1513_o : std_logic;
  signal n1514_o : std_logic;
  signal n1515_o : std_logic;
  signal n1517_o : std_logic;
  signal n1518_o : std_logic;
  signal n1519_o : std_logic;
  signal n1520_o : std_logic;
  signal n1522_o : std_logic;
  signal n1523_o : std_logic;
  signal n1524_o : std_logic;
  signal n1525_o : std_logic;
  signal n1527_o : std_logic;
  signal n1528_o : std_logic;
  signal n1529_o : std_logic;
  signal n1530_o : std_logic;
  signal n1532_o : std_logic;
  signal n1533_o : std_logic;
  signal n1534_o : std_logic;
  signal n1535_o : std_logic;
  signal n1537_o : std_logic;
  signal n1538_o : std_logic_vector (4 downto 0);
  signal outputs_n1_live_arb_c_grant : std_logic_vector (4 downto 0);
  signal outputs_n1_live_arb_c_pointer : std_logic_vector (2 downto 0);
  signal n1542_o : std_logic_vector (4 downto 0);
  signal n1543_o : std_logic;
  signal n1546_o : std_logic_vector (4 downto 0);
  signal n1548_o : std_logic;
  signal n1549_o : std_logic;
  signal n1551_o : std_logic;
  signal n1552_o : std_logic;
  signal n1553_o : std_logic;
  signal outputs_n3_live_arb_c_grant : std_logic_vector (4 downto 0);
  signal outputs_n3_live_arb_c_pointer : std_logic_vector (2 downto 0);
  signal n1557_o : std_logic_vector (4 downto 0);
  signal n1558_o : std_logic;
  signal n1561_o : std_logic_vector (4 downto 0);
  signal n1563_o : std_logic;
  signal n1564_o : std_logic;
  signal n1566_o : std_logic;
  signal n1567_o : std_logic;
  signal n1568_o : std_logic;
  signal outputs_n5_live_arb_c_grant : std_logic_vector (4 downto 0);
  signal outputs_n5_live_arb_c_pointer : std_logic_vector (2 downto 0);
  signal n1572_o : std_logic_vector (4 downto 0);
  signal n1573_o : std_logic;
  signal n1576_o : std_logic_vector (4 downto 0);
  signal n1578_o : std_logic;
  signal n1579_o : std_logic;
  signal n1581_o : std_logic;
  signal n1582_o : std_logic;
  signal n1583_o : std_logic;
  signal crossbar_c_outputs : std_logic_vector (159 downto 0);
  signal n1585_o : std_logic_vector (159 downto 0);
  signal n1586_o : std_logic_vector (4 downto 0);
  signal n1587_o : std_logic_vector (4 downto 0);
  signal n1588_o : std_logic_vector (24 downto 0);
  signal n1589_o : std_logic_vector (154 downto 0);
  signal n1590_o : std_logic_vector (4 downto 0);
  signal n1591_o : std_logic_vector (4 downto 0);
  signal n1592_o : std_logic_vector (154 downto 0);
  signal n1593_o : std_logic;
  signal n1594_o : std_logic;
  signal n1595_o : std_logic;
  signal n1596_o : std_logic;
  signal n1597_o : std_logic;
  signal n1598_o : std_logic_vector (1 downto 0);
  signal n1599_o : std_logic;
  signal n1600_o : std_logic;
  signal n1601_o : std_logic;
  signal n1602_o : std_logic;
  signal n1603_o : std_logic;
  signal n1604_o : std_logic;
  signal n1605_o : std_logic;
  signal n1606_o : std_logic;
  signal n1607_o : std_logic;
  signal n1608_o : std_logic;
  signal n1609_o : std_logic;
  signal n1610_o : std_logic;
  signal n1611_o : std_logic;
  signal n1612_o : std_logic;
  signal n1613_o : std_logic;
  signal n1614_o : std_logic;
  signal n1615_o : std_logic;
  signal n1616_o : std_logic;
  signal n1617_o : std_logic;
  signal n1618_o : std_logic_vector (3 downto 0);
  signal n1619_o : std_logic;
  signal n1620_o : std_logic;
  signal n1621_o : std_logic_vector (3 downto 0);
  signal n1622_o : std_logic;
  signal n1623_o : std_logic;
  signal n1624_o : std_logic_vector (3 downto 0);
  signal n1625_o : std_logic;
  signal n1626_o : std_logic;
  signal n1627_o : std_logic_vector (3 downto 0);
  signal n1628_o : std_logic;
  signal n1629_o : std_logic;
  signal n1630_o : std_logic_vector (3 downto 0);
  signal n1631_o : std_logic_vector (24 downto 0);
  signal n1632_o : std_logic;
  signal n1633_o : std_logic;
  signal n1634_o : std_logic;
  signal n1635_o : std_logic;
  signal n1636_o : std_logic;
  signal n1637_o : std_logic_vector (1 downto 0);
  signal n1638_o : std_logic;
  signal n1639_o : std_logic;
  signal n1640_o : std_logic;
  signal n1641_o : std_logic;
  signal n1642_o : std_logic;
  signal n1643_o : std_logic;
  signal n1644_o : std_logic;
  signal n1645_o : std_logic;
  signal n1646_o : std_logic;
  signal n1647_o : std_logic;
  signal n1648_o : std_logic;
  signal n1649_o : std_logic;
  signal n1650_o : std_logic;
  signal n1651_o : std_logic;
  signal n1652_o : std_logic;
  signal n1653_o : std_logic;
  signal n1654_o : std_logic;
  signal n1655_o : std_logic;
  signal n1656_o : std_logic;
  signal n1657_o : std_logic;
  signal n1658_o : std_logic_vector (3 downto 0);
  signal n1659_o : std_logic;
  signal n1660_o : std_logic;
  signal n1661_o : std_logic_vector (3 downto 0);
  signal n1662_o : std_logic;
  signal n1663_o : std_logic;
  signal n1664_o : std_logic_vector (3 downto 0);
  signal n1665_o : std_logic;
  signal n1666_o : std_logic;
  signal n1667_o : std_logic_vector (3 downto 0);
  signal n1668_o : std_logic;
  signal n1669_o : std_logic;
  signal n1670_o : std_logic_vector (2 downto 0);
  signal n1671_o : std_logic_vector (24 downto 0);
  signal n1672_o : std_logic;
  signal n1673_o : std_logic;
  signal n1674_o : std_logic;
  signal n1675_o : std_logic;
  signal n1676_o : std_logic;
  signal n1677_o : std_logic_vector (1 downto 0);
  signal n1678_o : std_logic;
  signal n1679_o : std_logic;
  signal n1680_o : std_logic;
  signal n1681_o : std_logic;
  signal n1682_o : std_logic;
  signal n1683_o : std_logic;
  signal n1684_o : std_logic;
  signal n1685_o : std_logic;
  signal n1686_o : std_logic;
  signal n1687_o : std_logic;
  signal n1688_o : std_logic;
  signal n1689_o : std_logic;
  signal n1690_o : std_logic;
  signal n1691_o : std_logic;
  signal n1692_o : std_logic;
  signal n1693_o : std_logic;
  signal n1694_o : std_logic;
  signal n1695_o : std_logic_vector (1 downto 0);
  signal n1696_o : std_logic;
  signal n1697_o : std_logic;
  signal n1698_o : std_logic_vector (3 downto 0);
  signal n1699_o : std_logic;
  signal n1700_o : std_logic;
  signal n1701_o : std_logic_vector (3 downto 0);
  signal n1702_o : std_logic;
  signal n1703_o : std_logic;
  signal n1704_o : std_logic_vector (3 downto 0);
  signal n1705_o : std_logic;
  signal n1706_o : std_logic;
  signal n1707_o : std_logic_vector (3 downto 0);
  signal n1708_o : std_logic;
  signal n1709_o : std_logic;
  signal n1710_o : std_logic_vector (1 downto 0);
  signal n1711_o : std_logic_vector (24 downto 0);
  signal n1712_o : std_logic;
  signal n1713_o : std_logic;
  signal n1714_o : std_logic;
  signal n1715_o : std_logic;
  signal n1716_o : std_logic;
  signal n1717_o : std_logic_vector (1 downto 0);
  signal n1718_o : std_logic;
  signal n1719_o : std_logic;
  signal n1720_o : std_logic;
  signal n1721_o : std_logic;
  signal n1722_o : std_logic;
  signal n1723_o : std_logic;
  signal n1724_o : std_logic;
  signal n1725_o : std_logic;
  signal n1726_o : std_logic;
  signal n1727_o : std_logic;
  signal n1728_o : std_logic;
  signal n1729_o : std_logic;
  signal n1730_o : std_logic;
  signal n1731_o : std_logic;
  signal n1732_o : std_logic;
  signal n1733_o : std_logic;
  signal n1734_o : std_logic;
  signal n1735_o : std_logic_vector (2 downto 0);
  signal n1736_o : std_logic;
  signal n1737_o : std_logic;
  signal n1738_o : std_logic_vector (3 downto 0);
  signal n1739_o : std_logic;
  signal n1740_o : std_logic;
  signal n1741_o : std_logic_vector (3 downto 0);
  signal n1742_o : std_logic;
  signal n1743_o : std_logic;
  signal n1744_o : std_logic_vector (3 downto 0);
  signal n1745_o : std_logic;
  signal n1746_o : std_logic;
  signal n1747_o : std_logic_vector (3 downto 0);
  signal n1748_o : std_logic;
  signal n1749_o : std_logic;
  signal n1750_o : std_logic;
  signal n1751_o : std_logic_vector (24 downto 0);
  signal n1752_o : std_logic;
  signal n1753_o : std_logic;
  signal n1754_o : std_logic;
  signal n1755_o : std_logic;
  signal n1756_o : std_logic;
  signal n1757_o : std_logic_vector (1 downto 0);
  signal n1758_o : std_logic;
  signal n1759_o : std_logic;
  signal n1760_o : std_logic;
  signal n1761_o : std_logic;
  signal n1762_o : std_logic;
  signal n1763_o : std_logic;
  signal n1764_o : std_logic;
  signal n1765_o : std_logic;
  signal n1766_o : std_logic;
  signal n1767_o : std_logic;
  signal n1768_o : std_logic;
  signal n1769_o : std_logic;
  signal n1770_o : std_logic;
  signal n1771_o : std_logic;
  signal n1772_o : std_logic;
  signal n1773_o : std_logic;
  signal n1774_o : std_logic;
  signal n1775_o : std_logic_vector (3 downto 0);
  signal n1776_o : std_logic;
  signal n1777_o : std_logic;
  signal n1778_o : std_logic_vector (3 downto 0);
  signal n1779_o : std_logic;
  signal n1780_o : std_logic;
  signal n1781_o : std_logic_vector (3 downto 0);
  signal n1782_o : std_logic;
  signal n1783_o : std_logic;
  signal n1784_o : std_logic_vector (3 downto 0);
  signal n1785_o : std_logic;
  signal n1786_o : std_logic;
  signal n1787_o : std_logic_vector (3 downto 0);
  signal n1788_o : std_logic;
  signal n1789_o : std_logic;
  signal n1790_o : std_logic_vector (24 downto 0);
begin
  in_ready <= n1590_o;
  out_data <= crossbar_c_outputs;
  out_valid <= n1591_o;
  dbg_count <= n1592_o;
  dbg_req <= requests;
  dbg_grant <= grants;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:13:10
  heads <= n1585_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:14:10
  available <= n1586_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:14:20
  pop <= n1538_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:14:24
  accepted <= n1587_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:15:10
  requests <= n1512_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:15:19
  grants <= n1588_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:16:10
  routes <= n1589_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:20:7
  inputs_n1_live_fifo : entity work.fifo_buffer_4 port map (
    clk => clk,
    rst => rst,
    in_data => n1285_o,
    in_valid => n1286_o,
    out_ready => n1290_o,
    in_ready => inputs_n1_live_fifo_c_in_ready,
    out_data => inputs_n1_live_fifo_c_out_data,
    out_valid => inputs_n1_live_fifo_c_out_valid,
    count => inputs_n1_live_fifo_c_count);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:33
  n1285_o <= in_data (159 downto 128);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:45
  n1286_o <= in_valid (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:86
  n1290_o <= pop (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:22:7
  inputs_n1_live_route : entity work.xy_route_unit_2 port map (
    packet => n1292_o,
    requested_port => inputs_n1_live_route_c_requested_port);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:23:23
  n1292_o <= heads (159 downto 128);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:20:7
  inputs_n3_live_fifo : entity work.fifo_buffer_4 port map (
    clk => clk,
    rst => rst,
    in_data => n1299_o,
    in_valid => n1300_o,
    out_ready => n1304_o,
    in_ready => inputs_n3_live_fifo_c_in_ready,
    out_data => inputs_n3_live_fifo_c_out_data,
    out_valid => inputs_n3_live_fifo_c_out_valid,
    count => inputs_n3_live_fifo_c_count);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:33
  n1299_o <= in_data (95 downto 64);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:45
  n1300_o <= in_valid (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:86
  n1304_o <= pop (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:22:7
  inputs_n3_live_route : entity work.xy_route_unit_2 port map (
    packet => n1306_o,
    requested_port => inputs_n3_live_route_c_requested_port);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:23:23
  n1306_o <= heads (95 downto 64);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:20:7
  inputs_n5_live_fifo : entity work.fifo_buffer_4 port map (
    clk => clk,
    rst => rst,
    in_data => n1313_o,
    in_valid => n1314_o,
    out_ready => n1318_o,
    in_ready => inputs_n5_live_fifo_c_in_ready,
    out_data => inputs_n5_live_fifo_c_out_data,
    out_valid => inputs_n5_live_fifo_c_out_valid,
    count => inputs_n5_live_fifo_c_count);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:33
  n1313_o <= in_data (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:45
  n1314_o <= in_valid (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:86
  n1318_o <= pop (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:22:7
  inputs_n5_live_route : entity work.xy_route_unit_2 port map (
    packet => n1320_o,
    requested_port => inputs_n5_live_route_c_requested_port);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:23:23
  n1320_o <= heads (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n1326_o <= available (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1327_o <= routes (154 downto 124);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1328_o <= n1327_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n1332_o <= n1601_o and n1326_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1333_o <= routes (154 downto 124);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1334_o <= n1333_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1336_o <= std_logic_vector (unsigned'("100") - unsigned (n1334_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n1342_o <= "0000000000000000000000000" when n1332_o = '0' else n1631_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1344_o <= grants (20);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1345_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1346_o <= n1345_o and n1344_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1349_o <= '0' when n1346_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1352_o <= grants (15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1353_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1354_o <= n1353_o and n1352_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1356_o <= n1349_o when n1354_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1357_o <= grants (10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1358_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1359_o <= n1358_o and n1357_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1361_o <= n1356_o when n1359_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1362_o <= grants (5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1363_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1364_o <= n1363_o and n1362_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1366_o <= n1361_o when n1364_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1367_o <= grants (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1368_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1369_o <= n1368_o and n1367_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1371_o <= n1366_o when n1369_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n1372_o <= available (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1373_o <= routes (123 downto 93);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1374_o <= n1373_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n1378_o <= n1640_o and n1372_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1379_o <= routes (123 downto 93);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1380_o <= n1379_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1382_o <= std_logic_vector (unsigned'("100") - unsigned (n1380_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n1386_o <= n1342_o when n1378_o = '0' else n1671_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1387_o <= grants (21);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1388_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1389_o <= n1388_o and n1387_o;
  n1391_o <= n1350_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1392_o <= n1391_o when n1389_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1394_o <= grants (16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1395_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1396_o <= n1395_o and n1394_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1398_o <= n1392_o when n1396_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1399_o <= grants (11);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1400_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1401_o <= n1400_o and n1399_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1403_o <= n1398_o when n1401_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1404_o <= grants (6);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1405_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1406_o <= n1405_o and n1404_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1408_o <= n1403_o when n1406_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1409_o <= grants (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1410_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1411_o <= n1410_o and n1409_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1413_o <= n1408_o when n1411_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n1414_o <= available (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1415_o <= routes (92 downto 62);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1416_o <= n1415_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n1420_o <= n1680_o and n1414_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1421_o <= routes (92 downto 62);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1422_o <= n1421_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1424_o <= std_logic_vector (unsigned'("100") - unsigned (n1422_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n1428_o <= n1386_o when n1420_o = '0' else n1711_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1429_o <= grants (22);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1430_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1431_o <= n1430_o and n1429_o;
  n1433_o <= n1350_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1434_o <= n1433_o when n1431_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1436_o <= grants (17);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1437_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1438_o <= n1437_o and n1436_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1440_o <= n1434_o when n1438_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1441_o <= grants (12);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1442_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1443_o <= n1442_o and n1441_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1445_o <= n1440_o when n1443_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1446_o <= grants (7);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1447_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1448_o <= n1447_o and n1446_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1450_o <= n1445_o when n1448_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1451_o <= grants (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1452_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1453_o <= n1452_o and n1451_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1455_o <= n1450_o when n1453_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n1456_o <= available (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1457_o <= routes (61 downto 31);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1458_o <= n1457_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n1462_o <= n1720_o and n1456_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1463_o <= routes (61 downto 31);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1464_o <= n1463_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1466_o <= std_logic_vector (unsigned'("100") - unsigned (n1464_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n1470_o <= n1428_o when n1462_o = '0' else n1751_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1471_o <= grants (23);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1472_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1473_o <= n1472_o and n1471_o;
  n1475_o <= n1350_o (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1476_o <= n1475_o when n1473_o = '0' else '1';
  n1477_o <= n1350_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1478_o <= grants (18);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1479_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1480_o <= n1479_o and n1478_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1482_o <= n1476_o when n1480_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1483_o <= grants (13);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1484_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1485_o <= n1484_o and n1483_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1487_o <= n1482_o when n1485_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1488_o <= grants (8);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1489_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1490_o <= n1489_o and n1488_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1492_o <= n1487_o when n1490_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1493_o <= grants (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1494_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1495_o <= n1494_o and n1493_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1497_o <= n1492_o when n1495_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n1498_o <= available (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1499_o <= routes (30 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n1500_o <= n1499_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n1504_o <= n1760_o and n1498_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1505_o <= routes (30 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1506_o <= n1505_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1508_o <= std_logic_vector (unsigned'("100") - unsigned (n1506_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n1512_o <= n1470_o when n1504_o = '0' else n1790_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1513_o <= grants (24);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1514_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1515_o <= n1514_o and n1513_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1517_o <= n1477_o when n1515_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1518_o <= grants (19);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1519_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1520_o <= n1519_o and n1518_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1522_o <= n1517_o when n1520_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1523_o <= grants (14);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1524_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1525_o <= n1524_o and n1523_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1527_o <= n1522_o when n1525_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1528_o <= grants (9);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1529_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1530_o <= n1529_o and n1528_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1532_o <= n1527_o when n1530_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1533_o <= grants (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1534_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1535_o <= n1534_o and n1533_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1537_o <= n1532_o when n1535_o = '0' else '1';
  n1538_o <= n1537_o & n1497_o & n1455_o & n1413_o & n1371_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:7
  outputs_n1_live_arb : entity work.rr_arbiter port map (
    clk => clk,
    rst => rst,
    req => n1542_o,
    accept => n1543_o,
    grant => outputs_n1_live_arb_c_grant,
    pointer => open);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:61
  n1542_o <= requests (24 downto 20);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:73
  n1543_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:36
  n1546_o <= grants (24 downto 20);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:39
  n1548_o <= '1' when n1546_o /= "00000" else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:25
  n1549_o <= '0' when n1548_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:29
  n1551_o <= n1591_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:46
  n1552_o <= out_ready (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:33
  n1553_o <= n1551_o and n1552_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:7
  outputs_n3_live_arb : entity work.rr_arbiter port map (
    clk => clk,
    rst => rst,
    req => n1557_o,
    accept => n1558_o,
    grant => outputs_n3_live_arb_c_grant,
    pointer => open);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:61
  n1557_o <= requests (14 downto 10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:73
  n1558_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:36
  n1561_o <= grants (14 downto 10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:39
  n1563_o <= '1' when n1561_o /= "00000" else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:25
  n1564_o <= '0' when n1563_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:29
  n1566_o <= n1591_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:46
  n1567_o <= out_ready (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:33
  n1568_o <= n1566_o and n1567_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:7
  outputs_n5_live_arb : entity work.rr_arbiter port map (
    clk => clk,
    rst => rst,
    req => n1572_o,
    accept => n1573_o,
    grant => outputs_n5_live_arb_c_grant,
    pointer => open);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:61
  n1572_o <= requests (4 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:73
  n1573_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:36
  n1576_o <= grants (4 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:39
  n1578_o <= '1' when n1576_o /= "00000" else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:25
  n1579_o <= '0' when n1578_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:29
  n1581_o <= n1591_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:46
  n1582_o <= out_ready (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:33
  n1583_o <= n1581_o and n1582_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:52:3
  crossbar : entity work.crossbar_5x5 port map (
    heads => heads,
    grants => grants,
    outputs => crossbar_c_outputs);
  n1585_o <= inputs_n1_live_fifo_c_out_data & "00000000000000000000000000000000" & inputs_n3_live_fifo_c_out_data & "00000000000000000000000000000000" & inputs_n5_live_fifo_c_out_data;
  n1586_o <= inputs_n5_live_fifo_c_out_valid & '0' & inputs_n3_live_fifo_c_out_valid & '0' & inputs_n1_live_fifo_c_out_valid;
  n1587_o <= n1583_o & '0' & n1568_o & '0' & n1553_o;
  n1588_o <= outputs_n1_live_arb_c_grant & "00000" & outputs_n3_live_arb_c_grant & "00000" & outputs_n5_live_arb_c_grant;
  n1589_o <= inputs_n1_live_route_c_requested_port & "0000000000000000000000000000100" & inputs_n3_live_route_c_requested_port & "0000000000000000000000000000100" & inputs_n5_live_route_c_requested_port;
  n1590_o <= inputs_n5_live_fifo_c_in_ready & '0' & inputs_n3_live_fifo_c_in_ready & '0' & inputs_n1_live_fifo_c_in_ready;
  n1591_o <= n1579_o & '0' & n1564_o & '0' & n1549_o;
  n1592_o <= inputs_n1_live_fifo_c_count & "0000000000000000000000000000000" & inputs_n3_live_fifo_c_count & "0000000000000000000000000000000" & inputs_n5_live_fifo_c_count;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:52:61
  n1593_o <= n1330_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:77
  n1594_o <= n1330_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:77
  n1595_o <= n1330_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:77
  n1596_o <= n1330_o (3);
  n1597_o <= n1330_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1598_o <= n1328_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n1598_o select n1599_o <=
    n1593_o when "00",
    n1594_o when "01",
    n1595_o when "10",
    n1596_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1600_o <= n1328_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1601_o <= n1599_o when n1600_o = '0' else n1597_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1602_o <= n1336_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1603_o <= not n1602_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1604_o <= n1336_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1605_o <= not n1604_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1606_o <= n1603_o and n1605_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1607_o <= n1603_o and n1604_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1608_o <= n1602_o and n1605_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1609_o <= n1336_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1610_o <= not n1609_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1611_o <= n1606_o and n1610_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1612_o <= n1606_o and n1609_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1613_o <= n1607_o and n1610_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1614_o <= n1607_o and n1609_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1615_o <= n1608_o and n1610_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:9:39
  n1616_o <= n1338_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1617_o <= n1616_o when n1611_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:8:39
  n1618_o <= n1338_o (4 downto 1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:8:5
  n1619_o <= n1338_o (5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1620_o <= n1619_o when n1612_o = '0' else '1';
  n1621_o <= n1338_o (9 downto 6);
  n1622_o <= n1338_o (10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1623_o <= n1622_o when n1613_o = '0' else '1';
  n1624_o <= n1338_o (14 downto 11);
  n1625_o <= n1338_o (15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1626_o <= n1625_o when n1614_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:29:3
  n1627_o <= n1338_o (19 downto 16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:31:14
  n1628_o <= n1338_o (20);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1629_o <= n1628_o when n1615_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:30:14
  n1630_o <= n1338_o (24 downto 21);
  n1631_o <= n1630_o & n1629_o & n1627_o & n1626_o & n1624_o & n1623_o & n1621_o & n1620_o & n1618_o & n1617_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1632_o <= n1376_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1633_o <= n1376_o (1);
  n1634_o <= n1376_o (2);
  n1635_o <= n1376_o (3);
  n1636_o <= n1376_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1637_o <= n1374_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n1637_o select n1638_o <=
    n1632_o when "00",
    n1633_o when "01",
    n1634_o when "10",
    n1635_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1639_o <= n1374_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1640_o <= n1638_o when n1639_o = '0' else n1636_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1641_o <= n1382_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1642_o <= not n1641_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1643_o <= n1382_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1644_o <= not n1643_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1645_o <= n1642_o and n1644_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1646_o <= n1642_o and n1643_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1647_o <= n1641_o and n1644_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1648_o <= n1382_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1649_o <= not n1648_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1650_o <= n1645_o and n1649_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1651_o <= n1645_o and n1648_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1652_o <= n1646_o and n1649_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1653_o <= n1646_o and n1648_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1654_o <= n1647_o and n1649_o;
  n1655_o <= n1342_o (0);
  n1656_o <= n1342_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1657_o <= n1656_o when n1650_o = '0' else '1';
  n1658_o <= n1342_o (5 downto 2);
  n1659_o <= n1342_o (6);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1660_o <= n1659_o when n1651_o = '0' else '1';
  n1661_o <= n1342_o (10 downto 7);
  n1662_o <= n1342_o (11);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1663_o <= n1662_o when n1652_o = '0' else '1';
  n1664_o <= n1342_o (15 downto 12);
  n1665_o <= n1342_o (16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1666_o <= n1665_o when n1653_o = '0' else '1';
  n1667_o <= n1342_o (20 downto 17);
  n1668_o <= n1342_o (21);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1669_o <= n1668_o when n1654_o = '0' else '1';
  n1670_o <= n1342_o (24 downto 22);
  n1671_o <= n1670_o & n1669_o & n1667_o & n1666_o & n1664_o & n1663_o & n1661_o & n1660_o & n1658_o & n1657_o & n1655_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1672_o <= n1418_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1673_o <= n1418_o (1);
  n1674_o <= n1418_o (2);
  n1675_o <= n1418_o (3);
  n1676_o <= n1418_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1677_o <= n1416_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n1677_o select n1678_o <=
    n1672_o when "00",
    n1673_o when "01",
    n1674_o when "10",
    n1675_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1679_o <= n1416_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1680_o <= n1678_o when n1679_o = '0' else n1676_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1681_o <= n1424_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1682_o <= not n1681_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1683_o <= n1424_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1684_o <= not n1683_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1685_o <= n1682_o and n1684_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1686_o <= n1682_o and n1683_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1687_o <= n1681_o and n1684_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1688_o <= n1424_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1689_o <= not n1688_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1690_o <= n1685_o and n1689_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1691_o <= n1685_o and n1688_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1692_o <= n1686_o and n1689_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1693_o <= n1686_o and n1688_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1694_o <= n1687_o and n1689_o;
  n1695_o <= n1386_o (1 downto 0);
  n1696_o <= n1386_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1697_o <= n1696_o when n1690_o = '0' else '1';
  n1698_o <= n1386_o (6 downto 3);
  n1699_o <= n1386_o (7);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1700_o <= n1699_o when n1691_o = '0' else '1';
  n1701_o <= n1386_o (11 downto 8);
  n1702_o <= n1386_o (12);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1703_o <= n1702_o when n1692_o = '0' else '1';
  n1704_o <= n1386_o (16 downto 13);
  n1705_o <= n1386_o (17);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1706_o <= n1705_o when n1693_o = '0' else '1';
  n1707_o <= n1386_o (21 downto 18);
  n1708_o <= n1386_o (22);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1709_o <= n1708_o when n1694_o = '0' else '1';
  n1710_o <= n1386_o (24 downto 23);
  n1711_o <= n1710_o & n1709_o & n1707_o & n1706_o & n1704_o & n1703_o & n1701_o & n1700_o & n1698_o & n1697_o & n1695_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1712_o <= n1460_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1713_o <= n1460_o (1);
  n1714_o <= n1460_o (2);
  n1715_o <= n1460_o (3);
  n1716_o <= n1460_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1717_o <= n1458_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n1717_o select n1718_o <=
    n1712_o when "00",
    n1713_o when "01",
    n1714_o when "10",
    n1715_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1719_o <= n1458_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1720_o <= n1718_o when n1719_o = '0' else n1716_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1721_o <= n1466_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1722_o <= not n1721_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1723_o <= n1466_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1724_o <= not n1723_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1725_o <= n1722_o and n1724_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1726_o <= n1722_o and n1723_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1727_o <= n1721_o and n1724_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1728_o <= n1466_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1729_o <= not n1728_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1730_o <= n1725_o and n1729_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1731_o <= n1725_o and n1728_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1732_o <= n1726_o and n1729_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1733_o <= n1726_o and n1728_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1734_o <= n1727_o and n1729_o;
  n1735_o <= n1428_o (2 downto 0);
  n1736_o <= n1428_o (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1737_o <= n1736_o when n1730_o = '0' else '1';
  n1738_o <= n1428_o (7 downto 4);
  n1739_o <= n1428_o (8);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1740_o <= n1739_o when n1731_o = '0' else '1';
  n1741_o <= n1428_o (12 downto 9);
  n1742_o <= n1428_o (13);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1743_o <= n1742_o when n1732_o = '0' else '1';
  n1744_o <= n1428_o (17 downto 14);
  n1745_o <= n1428_o (18);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1746_o <= n1745_o when n1733_o = '0' else '1';
  n1747_o <= n1428_o (22 downto 19);
  n1748_o <= n1428_o (23);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1749_o <= n1748_o when n1734_o = '0' else '1';
  n1750_o <= n1428_o (24);
  n1751_o <= n1750_o & n1749_o & n1747_o & n1746_o & n1744_o & n1743_o & n1741_o & n1740_o & n1738_o & n1737_o & n1735_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1752_o <= n1502_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1753_o <= n1502_o (1);
  n1754_o <= n1502_o (2);
  n1755_o <= n1502_o (3);
  n1756_o <= n1502_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1757_o <= n1500_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n1757_o select n1758_o <=
    n1752_o when "00",
    n1753_o when "01",
    n1754_o when "10",
    n1755_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1759_o <= n1500_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1760_o <= n1758_o when n1759_o = '0' else n1756_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1761_o <= n1508_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1762_o <= not n1761_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1763_o <= n1508_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1764_o <= not n1763_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1765_o <= n1762_o and n1764_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1766_o <= n1762_o and n1763_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1767_o <= n1761_o and n1764_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1768_o <= n1508_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1769_o <= not n1768_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1770_o <= n1765_o and n1769_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1771_o <= n1765_o and n1768_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1772_o <= n1766_o and n1769_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1773_o <= n1766_o and n1768_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1774_o <= n1767_o and n1769_o;
  n1775_o <= n1470_o (3 downto 0);
  n1776_o <= n1470_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1777_o <= n1776_o when n1770_o = '0' else '1';
  n1778_o <= n1470_o (8 downto 5);
  n1779_o <= n1470_o (9);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1780_o <= n1779_o when n1771_o = '0' else '1';
  n1781_o <= n1470_o (13 downto 10);
  n1782_o <= n1470_o (14);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1783_o <= n1782_o when n1772_o = '0' else '1';
  n1784_o <= n1470_o (18 downto 15);
  n1785_o <= n1470_o (19);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1786_o <= n1785_o when n1773_o = '0' else '1';
  n1787_o <= n1470_o (23 downto 20);
  n1788_o <= n1470_o (24);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1789_o <= n1788_o when n1774_o = '0' else '1';
  n1790_o <= n1789_o & n1787_o & n1786_o & n1784_o & n1783_o & n1781_o & n1780_o & n1778_o & n1777_o & n1775_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity router_1_4 is
  port (
    clk : in std_logic;
    rst : in std_logic;
    in_data : in std_logic_vector (159 downto 0);
    in_valid : in std_logic_vector (4 downto 0);
    out_ready : in std_logic_vector (4 downto 0);
    in_ready : out std_logic_vector (4 downto 0);
    out_data : out std_logic_vector (159 downto 0);
    out_valid : out std_logic_vector (4 downto 0);
    dbg_count : out std_logic_vector (154 downto 0);
    dbg_req : out std_logic_vector (24 downto 0);
    dbg_grant : out std_logic_vector (24 downto 0));
end entity router_1_4;

architecture rtl of router_1_4 is
  signal heads : std_logic_vector (159 downto 0);
  signal available : std_logic_vector (4 downto 0);
  signal pop : std_logic_vector (4 downto 0);
  signal accepted : std_logic_vector (4 downto 0);
  signal requests : std_logic_vector (24 downto 0);
  signal grants : std_logic_vector (24 downto 0);
  signal routes : std_logic_vector (154 downto 0);
  signal inputs_n2_live_fifo_c_in_ready : std_logic;
  signal inputs_n2_live_fifo_c_out_data : std_logic_vector (31 downto 0);
  signal inputs_n2_live_fifo_c_out_valid : std_logic;
  signal inputs_n2_live_fifo_c_count : std_logic_vector (30 downto 0);
  signal n778_o : std_logic_vector (31 downto 0);
  signal n779_o : std_logic;
  signal n783_o : std_logic;
  signal inputs_n2_live_route_c_requested_port : std_logic_vector (30 downto 0);
  signal n785_o : std_logic_vector (31 downto 0);
  signal inputs_n4_live_fifo_c_in_ready : std_logic;
  signal inputs_n4_live_fifo_c_out_data : std_logic_vector (31 downto 0);
  signal inputs_n4_live_fifo_c_out_valid : std_logic;
  signal inputs_n4_live_fifo_c_count : std_logic_vector (30 downto 0);
  signal n792_o : std_logic_vector (31 downto 0);
  signal n793_o : std_logic;
  signal n797_o : std_logic;
  signal inputs_n4_live_route_c_requested_port : std_logic_vector (30 downto 0);
  signal n799_o : std_logic_vector (31 downto 0);
  signal inputs_n5_live_fifo_c_in_ready : std_logic;
  signal inputs_n5_live_fifo_c_out_data : std_logic_vector (31 downto 0);
  signal inputs_n5_live_fifo_c_out_valid : std_logic;
  signal inputs_n5_live_fifo_c_count : std_logic_vector (30 downto 0);
  signal n801_o : std_logic_vector (31 downto 0);
  signal n802_o : std_logic;
  signal n806_o : std_logic;
  signal inputs_n5_live_route_c_requested_port : std_logic_vector (30 downto 0);
  signal n808_o : std_logic_vector (31 downto 0);
  signal n814_o : std_logic;
  signal n815_o : std_logic_vector (30 downto 0);
  signal n816_o : std_logic_vector (2 downto 0);
  constant n818_o : std_logic_vector (4 downto 0) := "11010";
  signal n820_o : std_logic;
  signal n821_o : std_logic_vector (30 downto 0);
  signal n822_o : std_logic_vector (2 downto 0);
  signal n824_o : std_logic_vector (2 downto 0);
  constant n826_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n830_o : std_logic_vector (24 downto 0);
  signal n832_o : std_logic;
  signal n833_o : std_logic;
  signal n834_o : std_logic;
  signal n837_o : std_logic;
  constant n838_o : std_logic_vector (4 downto 0) := "00000";
  signal n840_o : std_logic;
  signal n841_o : std_logic;
  signal n842_o : std_logic;
  signal n844_o : std_logic;
  signal n845_o : std_logic;
  signal n846_o : std_logic;
  signal n847_o : std_logic;
  signal n849_o : std_logic;
  signal n850_o : std_logic;
  signal n851_o : std_logic;
  signal n852_o : std_logic;
  signal n854_o : std_logic;
  signal n855_o : std_logic;
  signal n856_o : std_logic;
  signal n857_o : std_logic;
  signal n859_o : std_logic;
  signal n860_o : std_logic;
  signal n861_o : std_logic_vector (30 downto 0);
  signal n862_o : std_logic_vector (2 downto 0);
  constant n864_o : std_logic_vector (4 downto 0) := "11010";
  signal n866_o : std_logic;
  signal n867_o : std_logic_vector (30 downto 0);
  signal n868_o : std_logic_vector (2 downto 0);
  signal n870_o : std_logic_vector (2 downto 0);
  signal n874_o : std_logic_vector (24 downto 0);
  signal n875_o : std_logic;
  signal n876_o : std_logic;
  signal n877_o : std_logic;
  signal n879_o : std_logic;
  signal n880_o : std_logic;
  signal n882_o : std_logic;
  signal n883_o : std_logic;
  signal n884_o : std_logic;
  signal n886_o : std_logic;
  signal n887_o : std_logic;
  signal n888_o : std_logic;
  signal n889_o : std_logic;
  signal n891_o : std_logic;
  signal n892_o : std_logic;
  signal n893_o : std_logic;
  signal n894_o : std_logic;
  signal n896_o : std_logic;
  signal n897_o : std_logic;
  signal n898_o : std_logic;
  signal n899_o : std_logic;
  signal n901_o : std_logic;
  signal n902_o : std_logic;
  signal n903_o : std_logic_vector (30 downto 0);
  signal n904_o : std_logic_vector (2 downto 0);
  constant n906_o : std_logic_vector (4 downto 0) := "11010";
  signal n908_o : std_logic;
  signal n909_o : std_logic_vector (30 downto 0);
  signal n910_o : std_logic_vector (2 downto 0);
  signal n912_o : std_logic_vector (2 downto 0);
  signal n916_o : std_logic_vector (24 downto 0);
  signal n917_o : std_logic;
  signal n918_o : std_logic;
  signal n919_o : std_logic;
  signal n921_o : std_logic;
  signal n922_o : std_logic;
  signal n924_o : std_logic;
  signal n925_o : std_logic;
  signal n926_o : std_logic;
  signal n928_o : std_logic;
  signal n929_o : std_logic;
  signal n930_o : std_logic;
  signal n931_o : std_logic;
  signal n933_o : std_logic;
  signal n934_o : std_logic;
  signal n935_o : std_logic;
  signal n936_o : std_logic;
  signal n938_o : std_logic;
  signal n939_o : std_logic;
  signal n940_o : std_logic;
  signal n941_o : std_logic;
  signal n943_o : std_logic;
  signal n944_o : std_logic;
  signal n945_o : std_logic_vector (30 downto 0);
  signal n946_o : std_logic_vector (2 downto 0);
  constant n948_o : std_logic_vector (4 downto 0) := "11010";
  signal n950_o : std_logic;
  signal n951_o : std_logic_vector (30 downto 0);
  signal n952_o : std_logic_vector (2 downto 0);
  signal n954_o : std_logic_vector (2 downto 0);
  signal n958_o : std_logic_vector (24 downto 0);
  signal n959_o : std_logic;
  signal n960_o : std_logic;
  signal n961_o : std_logic;
  signal n963_o : std_logic;
  signal n964_o : std_logic;
  signal n965_o : std_logic;
  signal n966_o : std_logic;
  signal n967_o : std_logic;
  signal n968_o : std_logic;
  signal n970_o : std_logic;
  signal n971_o : std_logic;
  signal n972_o : std_logic;
  signal n973_o : std_logic;
  signal n975_o : std_logic;
  signal n976_o : std_logic;
  signal n977_o : std_logic;
  signal n978_o : std_logic;
  signal n980_o : std_logic;
  signal n981_o : std_logic;
  signal n982_o : std_logic;
  signal n983_o : std_logic;
  signal n985_o : std_logic;
  signal n986_o : std_logic;
  signal n987_o : std_logic_vector (30 downto 0);
  signal n988_o : std_logic_vector (2 downto 0);
  constant n990_o : std_logic_vector (4 downto 0) := "11010";
  signal n992_o : std_logic;
  signal n993_o : std_logic_vector (30 downto 0);
  signal n994_o : std_logic_vector (2 downto 0);
  signal n996_o : std_logic_vector (2 downto 0);
  signal n1000_o : std_logic_vector (24 downto 0);
  signal n1001_o : std_logic;
  signal n1002_o : std_logic;
  signal n1003_o : std_logic;
  signal n1005_o : std_logic;
  signal n1006_o : std_logic;
  signal n1007_o : std_logic;
  signal n1008_o : std_logic;
  signal n1010_o : std_logic;
  signal n1011_o : std_logic;
  signal n1012_o : std_logic;
  signal n1013_o : std_logic;
  signal n1015_o : std_logic;
  signal n1016_o : std_logic;
  signal n1017_o : std_logic;
  signal n1018_o : std_logic;
  signal n1020_o : std_logic;
  signal n1021_o : std_logic;
  signal n1022_o : std_logic;
  signal n1023_o : std_logic;
  signal n1025_o : std_logic;
  signal n1026_o : std_logic_vector (4 downto 0);
  signal outputs_n2_live_arb_c_grant : std_logic_vector (4 downto 0);
  signal outputs_n2_live_arb_c_pointer : std_logic_vector (2 downto 0);
  signal n1033_o : std_logic_vector (4 downto 0);
  signal n1034_o : std_logic;
  signal n1037_o : std_logic_vector (4 downto 0);
  signal n1039_o : std_logic;
  signal n1040_o : std_logic;
  signal n1042_o : std_logic;
  signal n1043_o : std_logic;
  signal n1044_o : std_logic;
  signal outputs_n4_live_arb_c_grant : std_logic_vector (4 downto 0);
  signal outputs_n4_live_arb_c_pointer : std_logic_vector (2 downto 0);
  signal n1048_o : std_logic_vector (4 downto 0);
  signal n1049_o : std_logic;
  signal n1052_o : std_logic_vector (4 downto 0);
  signal n1054_o : std_logic;
  signal n1055_o : std_logic;
  signal n1057_o : std_logic;
  signal n1058_o : std_logic;
  signal n1059_o : std_logic;
  signal outputs_n5_live_arb_c_grant : std_logic_vector (4 downto 0);
  signal outputs_n5_live_arb_c_pointer : std_logic_vector (2 downto 0);
  signal n1060_o : std_logic_vector (4 downto 0);
  signal n1061_o : std_logic;
  signal n1064_o : std_logic_vector (4 downto 0);
  signal n1066_o : std_logic;
  signal n1067_o : std_logic;
  signal n1069_o : std_logic;
  signal n1070_o : std_logic;
  signal n1071_o : std_logic;
  signal crossbar_c_outputs : std_logic_vector (159 downto 0);
  signal n1073_o : std_logic_vector (159 downto 0);
  signal n1074_o : std_logic_vector (4 downto 0);
  signal n1075_o : std_logic_vector (4 downto 0);
  signal n1076_o : std_logic_vector (24 downto 0);
  signal n1077_o : std_logic_vector (154 downto 0);
  signal n1078_o : std_logic_vector (4 downto 0);
  signal n1079_o : std_logic_vector (4 downto 0);
  signal n1080_o : std_logic_vector (154 downto 0);
  signal n1081_o : std_logic;
  signal n1082_o : std_logic;
  signal n1083_o : std_logic;
  signal n1084_o : std_logic;
  signal n1085_o : std_logic;
  signal n1086_o : std_logic_vector (1 downto 0);
  signal n1087_o : std_logic;
  signal n1088_o : std_logic;
  signal n1089_o : std_logic;
  signal n1090_o : std_logic;
  signal n1091_o : std_logic;
  signal n1092_o : std_logic;
  signal n1093_o : std_logic;
  signal n1094_o : std_logic;
  signal n1095_o : std_logic;
  signal n1096_o : std_logic;
  signal n1097_o : std_logic;
  signal n1098_o : std_logic;
  signal n1099_o : std_logic;
  signal n1100_o : std_logic;
  signal n1101_o : std_logic;
  signal n1102_o : std_logic;
  signal n1103_o : std_logic;
  signal n1104_o : std_logic;
  signal n1105_o : std_logic;
  signal n1106_o : std_logic_vector (3 downto 0);
  signal n1107_o : std_logic;
  signal n1108_o : std_logic;
  signal n1109_o : std_logic_vector (3 downto 0);
  signal n1110_o : std_logic;
  signal n1111_o : std_logic;
  signal n1112_o : std_logic_vector (3 downto 0);
  signal n1113_o : std_logic;
  signal n1114_o : std_logic;
  signal n1115_o : std_logic_vector (3 downto 0);
  signal n1116_o : std_logic;
  signal n1117_o : std_logic;
  signal n1118_o : std_logic_vector (3 downto 0);
  signal n1119_o : std_logic_vector (24 downto 0);
  signal n1120_o : std_logic;
  signal n1121_o : std_logic;
  signal n1122_o : std_logic;
  signal n1123_o : std_logic;
  signal n1124_o : std_logic;
  signal n1125_o : std_logic_vector (1 downto 0);
  signal n1126_o : std_logic;
  signal n1127_o : std_logic;
  signal n1128_o : std_logic;
  signal n1129_o : std_logic;
  signal n1130_o : std_logic;
  signal n1131_o : std_logic;
  signal n1132_o : std_logic;
  signal n1133_o : std_logic;
  signal n1134_o : std_logic;
  signal n1135_o : std_logic;
  signal n1136_o : std_logic;
  signal n1137_o : std_logic;
  signal n1138_o : std_logic;
  signal n1139_o : std_logic;
  signal n1140_o : std_logic;
  signal n1141_o : std_logic;
  signal n1142_o : std_logic;
  signal n1143_o : std_logic;
  signal n1144_o : std_logic;
  signal n1145_o : std_logic;
  signal n1146_o : std_logic_vector (3 downto 0);
  signal n1147_o : std_logic;
  signal n1148_o : std_logic;
  signal n1149_o : std_logic_vector (3 downto 0);
  signal n1150_o : std_logic;
  signal n1151_o : std_logic;
  signal n1152_o : std_logic_vector (3 downto 0);
  signal n1153_o : std_logic;
  signal n1154_o : std_logic;
  signal n1155_o : std_logic_vector (3 downto 0);
  signal n1156_o : std_logic;
  signal n1157_o : std_logic;
  signal n1158_o : std_logic_vector (2 downto 0);
  signal n1159_o : std_logic_vector (24 downto 0);
  signal n1160_o : std_logic;
  signal n1161_o : std_logic;
  signal n1162_o : std_logic;
  signal n1163_o : std_logic;
  signal n1164_o : std_logic;
  signal n1165_o : std_logic_vector (1 downto 0);
  signal n1166_o : std_logic;
  signal n1167_o : std_logic;
  signal n1168_o : std_logic;
  signal n1169_o : std_logic;
  signal n1170_o : std_logic;
  signal n1171_o : std_logic;
  signal n1172_o : std_logic;
  signal n1173_o : std_logic;
  signal n1174_o : std_logic;
  signal n1175_o : std_logic;
  signal n1176_o : std_logic;
  signal n1177_o : std_logic;
  signal n1178_o : std_logic;
  signal n1179_o : std_logic;
  signal n1180_o : std_logic;
  signal n1181_o : std_logic;
  signal n1182_o : std_logic;
  signal n1183_o : std_logic_vector (1 downto 0);
  signal n1184_o : std_logic;
  signal n1185_o : std_logic;
  signal n1186_o : std_logic_vector (3 downto 0);
  signal n1187_o : std_logic;
  signal n1188_o : std_logic;
  signal n1189_o : std_logic_vector (3 downto 0);
  signal n1190_o : std_logic;
  signal n1191_o : std_logic;
  signal n1192_o : std_logic_vector (3 downto 0);
  signal n1193_o : std_logic;
  signal n1194_o : std_logic;
  signal n1195_o : std_logic_vector (3 downto 0);
  signal n1196_o : std_logic;
  signal n1197_o : std_logic;
  signal n1198_o : std_logic_vector (1 downto 0);
  signal n1199_o : std_logic_vector (24 downto 0);
  signal n1200_o : std_logic;
  signal n1201_o : std_logic;
  signal n1202_o : std_logic;
  signal n1203_o : std_logic;
  signal n1204_o : std_logic;
  signal n1205_o : std_logic_vector (1 downto 0);
  signal n1206_o : std_logic;
  signal n1207_o : std_logic;
  signal n1208_o : std_logic;
  signal n1209_o : std_logic;
  signal n1210_o : std_logic;
  signal n1211_o : std_logic;
  signal n1212_o : std_logic;
  signal n1213_o : std_logic;
  signal n1214_o : std_logic;
  signal n1215_o : std_logic;
  signal n1216_o : std_logic;
  signal n1217_o : std_logic;
  signal n1218_o : std_logic;
  signal n1219_o : std_logic;
  signal n1220_o : std_logic;
  signal n1221_o : std_logic;
  signal n1222_o : std_logic;
  signal n1223_o : std_logic_vector (2 downto 0);
  signal n1224_o : std_logic;
  signal n1225_o : std_logic;
  signal n1226_o : std_logic_vector (3 downto 0);
  signal n1227_o : std_logic;
  signal n1228_o : std_logic;
  signal n1229_o : std_logic_vector (3 downto 0);
  signal n1230_o : std_logic;
  signal n1231_o : std_logic;
  signal n1232_o : std_logic_vector (3 downto 0);
  signal n1233_o : std_logic;
  signal n1234_o : std_logic;
  signal n1235_o : std_logic_vector (3 downto 0);
  signal n1236_o : std_logic;
  signal n1237_o : std_logic;
  signal n1238_o : std_logic;
  signal n1239_o : std_logic_vector (24 downto 0);
  signal n1240_o : std_logic;
  signal n1241_o : std_logic;
  signal n1242_o : std_logic;
  signal n1243_o : std_logic;
  signal n1244_o : std_logic;
  signal n1245_o : std_logic_vector (1 downto 0);
  signal n1246_o : std_logic;
  signal n1247_o : std_logic;
  signal n1248_o : std_logic;
  signal n1249_o : std_logic;
  signal n1250_o : std_logic;
  signal n1251_o : std_logic;
  signal n1252_o : std_logic;
  signal n1253_o : std_logic;
  signal n1254_o : std_logic;
  signal n1255_o : std_logic;
  signal n1256_o : std_logic;
  signal n1257_o : std_logic;
  signal n1258_o : std_logic;
  signal n1259_o : std_logic;
  signal n1260_o : std_logic;
  signal n1261_o : std_logic;
  signal n1262_o : std_logic;
  signal n1263_o : std_logic_vector (3 downto 0);
  signal n1264_o : std_logic;
  signal n1265_o : std_logic;
  signal n1266_o : std_logic_vector (3 downto 0);
  signal n1267_o : std_logic;
  signal n1268_o : std_logic;
  signal n1269_o : std_logic_vector (3 downto 0);
  signal n1270_o : std_logic;
  signal n1271_o : std_logic;
  signal n1272_o : std_logic_vector (3 downto 0);
  signal n1273_o : std_logic;
  signal n1274_o : std_logic;
  signal n1275_o : std_logic_vector (3 downto 0);
  signal n1276_o : std_logic;
  signal n1277_o : std_logic;
  signal n1278_o : std_logic_vector (24 downto 0);
begin
  in_ready <= n1078_o;
  out_data <= crossbar_c_outputs;
  out_valid <= n1079_o;
  dbg_count <= n1080_o;
  dbg_req <= requests;
  dbg_grant <= grants;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:13:10
  heads <= n1073_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:14:10
  available <= n1074_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:14:20
  pop <= n1026_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:14:24
  accepted <= n1075_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:15:10
  requests <= n1000_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:15:19
  grants <= n1076_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:16:10
  routes <= n1077_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:20:7
  inputs_n2_live_fifo : entity work.fifo_buffer_4 port map (
    clk => clk,
    rst => rst,
    in_data => n778_o,
    in_valid => n779_o,
    out_ready => n783_o,
    in_ready => inputs_n2_live_fifo_c_in_ready,
    out_data => inputs_n2_live_fifo_c_out_data,
    out_valid => inputs_n2_live_fifo_c_out_valid,
    count => inputs_n2_live_fifo_c_count);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:33
  n778_o <= in_data (127 downto 96);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:45
  n779_o <= in_valid (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:86
  n783_o <= pop (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:22:7
  inputs_n2_live_route : entity work.xy_route_unit_1 port map (
    packet => n785_o,
    requested_port => inputs_n2_live_route_c_requested_port);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:23:23
  n785_o <= heads (127 downto 96);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:20:7
  inputs_n4_live_fifo : entity work.fifo_buffer_4 port map (
    clk => clk,
    rst => rst,
    in_data => n792_o,
    in_valid => n793_o,
    out_ready => n797_o,
    in_ready => inputs_n4_live_fifo_c_in_ready,
    out_data => inputs_n4_live_fifo_c_out_data,
    out_valid => inputs_n4_live_fifo_c_out_valid,
    count => inputs_n4_live_fifo_c_count);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:33
  n792_o <= in_data (63 downto 32);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:45
  n793_o <= in_valid (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:86
  n797_o <= pop (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:22:7
  inputs_n4_live_route : entity work.xy_route_unit_1 port map (
    packet => n799_o,
    requested_port => inputs_n4_live_route_c_requested_port);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:23:23
  n799_o <= heads (63 downto 32);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:20:7
  inputs_n5_live_fifo : entity work.fifo_buffer_4 port map (
    clk => clk,
    rst => rst,
    in_data => n801_o,
    in_valid => n802_o,
    out_ready => n806_o,
    in_ready => inputs_n5_live_fifo_c_in_ready,
    out_data => inputs_n5_live_fifo_c_out_data,
    out_valid => inputs_n5_live_fifo_c_out_valid,
    count => inputs_n5_live_fifo_c_count);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:33
  n801_o <= in_data (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:45
  n802_o <= in_valid (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:86
  n806_o <= pop (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:22:7
  inputs_n5_live_route : entity work.xy_route_unit_1 port map (
    packet => n808_o,
    requested_port => inputs_n5_live_route_c_requested_port);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:23:23
  n808_o <= heads (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n814_o <= available (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n815_o <= routes (154 downto 124);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n816_o <= n815_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n820_o <= n1089_o and n814_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n821_o <= routes (154 downto 124);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n822_o <= n821_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n824_o <= std_logic_vector (unsigned'("100") - unsigned (n822_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n830_o <= "0000000000000000000000000" when n820_o = '0' else n1119_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n832_o <= grants (20);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n833_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n834_o <= n833_o and n832_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n837_o <= '0' when n834_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n840_o <= grants (15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n841_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n842_o <= n841_o and n840_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n844_o <= n837_o when n842_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n845_o <= grants (10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n846_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n847_o <= n846_o and n845_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n849_o <= n844_o when n847_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n850_o <= grants (5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n851_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n852_o <= n851_o and n850_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n854_o <= n849_o when n852_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n855_o <= grants (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n856_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n857_o <= n856_o and n855_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n859_o <= n854_o when n857_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n860_o <= available (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n861_o <= routes (123 downto 93);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n862_o <= n861_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n866_o <= n1128_o and n860_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n867_o <= routes (123 downto 93);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n868_o <= n867_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n870_o <= std_logic_vector (unsigned'("100") - unsigned (n868_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n874_o <= n830_o when n866_o = '0' else n1159_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n875_o <= grants (21);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n876_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n877_o <= n876_o and n875_o;
  n879_o <= n838_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n880_o <= n879_o when n877_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n882_o <= grants (16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n883_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n884_o <= n883_o and n882_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n886_o <= n880_o when n884_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n887_o <= grants (11);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n888_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n889_o <= n888_o and n887_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n891_o <= n886_o when n889_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n892_o <= grants (6);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n893_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n894_o <= n893_o and n892_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n896_o <= n891_o when n894_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n897_o <= grants (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n898_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n899_o <= n898_o and n897_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n901_o <= n896_o when n899_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n902_o <= available (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n903_o <= routes (92 downto 62);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n904_o <= n903_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n908_o <= n1168_o and n902_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n909_o <= routes (92 downto 62);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n910_o <= n909_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n912_o <= std_logic_vector (unsigned'("100") - unsigned (n910_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n916_o <= n874_o when n908_o = '0' else n1199_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n917_o <= grants (22);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n918_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n919_o <= n918_o and n917_o;
  n921_o <= n838_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n922_o <= n921_o when n919_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n924_o <= grants (17);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n925_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n926_o <= n925_o and n924_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n928_o <= n922_o when n926_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n929_o <= grants (12);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n930_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n931_o <= n930_o and n929_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n933_o <= n928_o when n931_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n934_o <= grants (7);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n935_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n936_o <= n935_o and n934_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n938_o <= n933_o when n936_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n939_o <= grants (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n940_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n941_o <= n940_o and n939_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n943_o <= n938_o when n941_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n944_o <= available (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n945_o <= routes (61 downto 31);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n946_o <= n945_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n950_o <= n1208_o and n944_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n951_o <= routes (61 downto 31);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n952_o <= n951_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n954_o <= std_logic_vector (unsigned'("100") - unsigned (n952_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n958_o <= n916_o when n950_o = '0' else n1239_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n959_o <= grants (23);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n960_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n961_o <= n960_o and n959_o;
  n963_o <= n838_o (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n964_o <= n963_o when n961_o = '0' else '1';
  n965_o <= n838_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n966_o <= grants (18);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n967_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n968_o <= n967_o and n966_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n970_o <= n964_o when n968_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n971_o <= grants (13);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n972_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n973_o <= n972_o and n971_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n975_o <= n970_o when n973_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n976_o <= grants (8);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n977_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n978_o <= n977_o and n976_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n980_o <= n975_o when n978_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n981_o <= grants (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n982_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n983_o <= n982_o and n981_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n985_o <= n980_o when n983_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n986_o <= available (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n987_o <= routes (30 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n988_o <= n987_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n992_o <= n1248_o and n986_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n993_o <= routes (30 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n994_o <= n993_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n996_o <= std_logic_vector (unsigned'("100") - unsigned (n994_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n1000_o <= n958_o when n992_o = '0' else n1278_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1001_o <= grants (24);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1002_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1003_o <= n1002_o and n1001_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1005_o <= n965_o when n1003_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1006_o <= grants (19);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1007_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1008_o <= n1007_o and n1006_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1010_o <= n1005_o when n1008_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1011_o <= grants (14);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1012_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1013_o <= n1012_o and n1011_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1015_o <= n1010_o when n1013_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1016_o <= grants (9);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1017_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1018_o <= n1017_o and n1016_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1020_o <= n1015_o when n1018_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n1021_o <= grants (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n1022_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n1023_o <= n1022_o and n1021_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n1025_o <= n1020_o when n1023_o = '0' else '1';
  n1026_o <= n1025_o & n985_o & n943_o & n901_o & n859_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:7
  outputs_n2_live_arb : entity work.rr_arbiter port map (
    clk => clk,
    rst => rst,
    req => n1033_o,
    accept => n1034_o,
    grant => outputs_n2_live_arb_c_grant,
    pointer => open);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:61
  n1033_o <= requests (19 downto 15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:73
  n1034_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:36
  n1037_o <= grants (19 downto 15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:39
  n1039_o <= '1' when n1037_o /= "00000" else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:25
  n1040_o <= '0' when n1039_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:29
  n1042_o <= n1079_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:46
  n1043_o <= out_ready (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:33
  n1044_o <= n1042_o and n1043_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:7
  outputs_n4_live_arb : entity work.rr_arbiter port map (
    clk => clk,
    rst => rst,
    req => n1048_o,
    accept => n1049_o,
    grant => outputs_n4_live_arb_c_grant,
    pointer => open);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:61
  n1048_o <= requests (9 downto 5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:73
  n1049_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:36
  n1052_o <= grants (9 downto 5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:39
  n1054_o <= '1' when n1052_o /= "00000" else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:25
  n1055_o <= '0' when n1054_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:29
  n1057_o <= n1079_o (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:46
  n1058_o <= out_ready (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:33
  n1059_o <= n1057_o and n1058_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:7
  outputs_n5_live_arb : entity work.rr_arbiter port map (
    clk => clk,
    rst => rst,
    req => n1060_o,
    accept => n1061_o,
    grant => outputs_n5_live_arb_c_grant,
    pointer => open);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:61
  n1060_o <= requests (4 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:73
  n1061_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:36
  n1064_o <= grants (4 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:39
  n1066_o <= '1' when n1064_o /= "00000" else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:25
  n1067_o <= '0' when n1066_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:29
  n1069_o <= n1079_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:46
  n1070_o <= out_ready (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:33
  n1071_o <= n1069_o and n1070_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:52:3
  crossbar : entity work.crossbar_5x5 port map (
    heads => heads,
    grants => grants,
    outputs => crossbar_c_outputs);
  n1073_o <= "00000000000000000000000000000000" & inputs_n2_live_fifo_c_out_data & "00000000000000000000000000000000" & inputs_n4_live_fifo_c_out_data & inputs_n5_live_fifo_c_out_data;
  n1074_o <= inputs_n5_live_fifo_c_out_valid & inputs_n4_live_fifo_c_out_valid & '0' & inputs_n2_live_fifo_c_out_valid & '0';
  n1075_o <= n1071_o & n1059_o & '0' & n1044_o & '0';
  n1076_o <= "00000" & outputs_n2_live_arb_c_grant & "00000" & outputs_n4_live_arb_c_grant & outputs_n5_live_arb_c_grant;
  n1077_o <= "0000000000000000000000000000100" & inputs_n2_live_route_c_requested_port & "0000000000000000000000000000100" & inputs_n4_live_route_c_requested_port & inputs_n5_live_route_c_requested_port;
  n1078_o <= inputs_n5_live_fifo_c_in_ready & inputs_n4_live_fifo_c_in_ready & '0' & inputs_n2_live_fifo_c_in_ready & '0';
  n1079_o <= n1067_o & n1055_o & '0' & n1040_o & '0';
  n1080_o <= "0000000000000000000000000000000" & inputs_n2_live_fifo_c_count & "0000000000000000000000000000000" & inputs_n4_live_fifo_c_count & inputs_n5_live_fifo_c_count;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:52:61
  n1081_o <= n818_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:77
  n1082_o <= n818_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:77
  n1083_o <= n818_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:77
  n1084_o <= n818_o (3);
  n1085_o <= n818_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1086_o <= n816_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n1086_o select n1087_o <=
    n1081_o when "00",
    n1082_o when "01",
    n1083_o when "10",
    n1084_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1088_o <= n816_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1089_o <= n1087_o when n1088_o = '0' else n1085_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1090_o <= n824_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1091_o <= not n1090_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1092_o <= n824_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1093_o <= not n1092_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1094_o <= n1091_o and n1093_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1095_o <= n1091_o and n1092_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1096_o <= n1090_o and n1093_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1097_o <= n824_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1098_o <= not n1097_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1099_o <= n1094_o and n1098_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1100_o <= n1094_o and n1097_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1101_o <= n1095_o and n1098_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1102_o <= n1095_o and n1097_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1103_o <= n1096_o and n1098_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:9:39
  n1104_o <= n826_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1105_o <= n1104_o when n1099_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:8:39
  n1106_o <= n826_o (4 downto 1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:8:5
  n1107_o <= n826_o (5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1108_o <= n1107_o when n1100_o = '0' else '1';
  n1109_o <= n826_o (9 downto 6);
  n1110_o <= n826_o (10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1111_o <= n1110_o when n1101_o = '0' else '1';
  n1112_o <= n826_o (14 downto 11);
  n1113_o <= n826_o (15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1114_o <= n1113_o when n1102_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:29:3
  n1115_o <= n826_o (19 downto 16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:31:14
  n1116_o <= n826_o (20);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1117_o <= n1116_o when n1103_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:30:14
  n1118_o <= n826_o (24 downto 21);
  n1119_o <= n1118_o & n1117_o & n1115_o & n1114_o & n1112_o & n1111_o & n1109_o & n1108_o & n1106_o & n1105_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1120_o <= n864_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1121_o <= n864_o (1);
  n1122_o <= n864_o (2);
  n1123_o <= n864_o (3);
  n1124_o <= n864_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1125_o <= n862_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n1125_o select n1126_o <=
    n1120_o when "00",
    n1121_o when "01",
    n1122_o when "10",
    n1123_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1127_o <= n862_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1128_o <= n1126_o when n1127_o = '0' else n1124_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1129_o <= n870_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1130_o <= not n1129_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1131_o <= n870_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1132_o <= not n1131_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1133_o <= n1130_o and n1132_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1134_o <= n1130_o and n1131_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1135_o <= n1129_o and n1132_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1136_o <= n870_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1137_o <= not n1136_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1138_o <= n1133_o and n1137_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1139_o <= n1133_o and n1136_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1140_o <= n1134_o and n1137_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1141_o <= n1134_o and n1136_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1142_o <= n1135_o and n1137_o;
  n1143_o <= n830_o (0);
  n1144_o <= n830_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1145_o <= n1144_o when n1138_o = '0' else '1';
  n1146_o <= n830_o (5 downto 2);
  n1147_o <= n830_o (6);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1148_o <= n1147_o when n1139_o = '0' else '1';
  n1149_o <= n830_o (10 downto 7);
  n1150_o <= n830_o (11);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1151_o <= n1150_o when n1140_o = '0' else '1';
  n1152_o <= n830_o (15 downto 12);
  n1153_o <= n830_o (16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1154_o <= n1153_o when n1141_o = '0' else '1';
  n1155_o <= n830_o (20 downto 17);
  n1156_o <= n830_o (21);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1157_o <= n1156_o when n1142_o = '0' else '1';
  n1158_o <= n830_o (24 downto 22);
  n1159_o <= n1158_o & n1157_o & n1155_o & n1154_o & n1152_o & n1151_o & n1149_o & n1148_o & n1146_o & n1145_o & n1143_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1160_o <= n906_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1161_o <= n906_o (1);
  n1162_o <= n906_o (2);
  n1163_o <= n906_o (3);
  n1164_o <= n906_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1165_o <= n904_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n1165_o select n1166_o <=
    n1160_o when "00",
    n1161_o when "01",
    n1162_o when "10",
    n1163_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1167_o <= n904_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1168_o <= n1166_o when n1167_o = '0' else n1164_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1169_o <= n912_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1170_o <= not n1169_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1171_o <= n912_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1172_o <= not n1171_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1173_o <= n1170_o and n1172_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1174_o <= n1170_o and n1171_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1175_o <= n1169_o and n1172_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1176_o <= n912_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1177_o <= not n1176_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1178_o <= n1173_o and n1177_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1179_o <= n1173_o and n1176_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1180_o <= n1174_o and n1177_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1181_o <= n1174_o and n1176_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1182_o <= n1175_o and n1177_o;
  n1183_o <= n874_o (1 downto 0);
  n1184_o <= n874_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1185_o <= n1184_o when n1178_o = '0' else '1';
  n1186_o <= n874_o (6 downto 3);
  n1187_o <= n874_o (7);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1188_o <= n1187_o when n1179_o = '0' else '1';
  n1189_o <= n874_o (11 downto 8);
  n1190_o <= n874_o (12);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1191_o <= n1190_o when n1180_o = '0' else '1';
  n1192_o <= n874_o (16 downto 13);
  n1193_o <= n874_o (17);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1194_o <= n1193_o when n1181_o = '0' else '1';
  n1195_o <= n874_o (21 downto 18);
  n1196_o <= n874_o (22);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1197_o <= n1196_o when n1182_o = '0' else '1';
  n1198_o <= n874_o (24 downto 23);
  n1199_o <= n1198_o & n1197_o & n1195_o & n1194_o & n1192_o & n1191_o & n1189_o & n1188_o & n1186_o & n1185_o & n1183_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1200_o <= n948_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1201_o <= n948_o (1);
  n1202_o <= n948_o (2);
  n1203_o <= n948_o (3);
  n1204_o <= n948_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1205_o <= n946_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n1205_o select n1206_o <=
    n1200_o when "00",
    n1201_o when "01",
    n1202_o when "10",
    n1203_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1207_o <= n946_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1208_o <= n1206_o when n1207_o = '0' else n1204_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1209_o <= n954_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1210_o <= not n1209_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1211_o <= n954_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1212_o <= not n1211_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1213_o <= n1210_o and n1212_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1214_o <= n1210_o and n1211_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1215_o <= n1209_o and n1212_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1216_o <= n954_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1217_o <= not n1216_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1218_o <= n1213_o and n1217_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1219_o <= n1213_o and n1216_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1220_o <= n1214_o and n1217_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1221_o <= n1214_o and n1216_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1222_o <= n1215_o and n1217_o;
  n1223_o <= n916_o (2 downto 0);
  n1224_o <= n916_o (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1225_o <= n1224_o when n1218_o = '0' else '1';
  n1226_o <= n916_o (7 downto 4);
  n1227_o <= n916_o (8);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1228_o <= n1227_o when n1219_o = '0' else '1';
  n1229_o <= n916_o (12 downto 9);
  n1230_o <= n916_o (13);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1231_o <= n1230_o when n1220_o = '0' else '1';
  n1232_o <= n916_o (17 downto 14);
  n1233_o <= n916_o (18);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1234_o <= n1233_o when n1221_o = '0' else '1';
  n1235_o <= n916_o (22 downto 19);
  n1236_o <= n916_o (23);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1237_o <= n1236_o when n1222_o = '0' else '1';
  n1238_o <= n916_o (24);
  n1239_o <= n1238_o & n1237_o & n1235_o & n1234_o & n1232_o & n1231_o & n1229_o & n1228_o & n1226_o & n1225_o & n1223_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n1240_o <= n990_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1241_o <= n990_o (1);
  n1242_o <= n990_o (2);
  n1243_o <= n990_o (3);
  n1244_o <= n990_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1245_o <= n988_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n1245_o select n1246_o <=
    n1240_o when "00",
    n1241_o when "01",
    n1242_o when "10",
    n1243_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1247_o <= n988_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n1248_o <= n1246_o when n1247_o = '0' else n1244_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1249_o <= n996_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1250_o <= not n1249_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1251_o <= n996_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1252_o <= not n1251_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1253_o <= n1250_o and n1252_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1254_o <= n1250_o and n1251_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1255_o <= n1249_o and n1252_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1256_o <= n996_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1257_o <= not n1256_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1258_o <= n1253_o and n1257_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1259_o <= n1253_o and n1256_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1260_o <= n1254_o and n1257_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1261_o <= n1254_o and n1256_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1262_o <= n1255_o and n1257_o;
  n1263_o <= n958_o (3 downto 0);
  n1264_o <= n958_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1265_o <= n1264_o when n1258_o = '0' else '1';
  n1266_o <= n958_o (8 downto 5);
  n1267_o <= n958_o (9);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1268_o <= n1267_o when n1259_o = '0' else '1';
  n1269_o <= n958_o (13 downto 10);
  n1270_o <= n958_o (14);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1271_o <= n1270_o when n1260_o = '0' else '1';
  n1272_o <= n958_o (18 downto 15);
  n1273_o <= n958_o (19);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1274_o <= n1273_o when n1261_o = '0' else '1';
  n1275_o <= n958_o (23 downto 20);
  n1276_o <= n958_o (24);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n1277_o <= n1276_o when n1262_o = '0' else '1';
  n1278_o <= n1277_o & n1275_o & n1274_o & n1272_o & n1271_o & n1269_o & n1268_o & n1266_o & n1265_o & n1263_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity router_0_4 is
  port (
    clk : in std_logic;
    rst : in std_logic;
    in_data : in std_logic_vector (159 downto 0);
    in_valid : in std_logic_vector (4 downto 0);
    out_ready : in std_logic_vector (4 downto 0);
    in_ready : out std_logic_vector (4 downto 0);
    out_data : out std_logic_vector (159 downto 0);
    out_valid : out std_logic_vector (4 downto 0);
    dbg_count : out std_logic_vector (154 downto 0);
    dbg_req : out std_logic_vector (24 downto 0);
    dbg_grant : out std_logic_vector (24 downto 0));
end entity router_0_4;

architecture rtl of router_0_4 is
  signal heads : std_logic_vector (159 downto 0);
  signal available : std_logic_vector (4 downto 0);
  signal pop : std_logic_vector (4 downto 0);
  signal accepted : std_logic_vector (4 downto 0);
  signal requests : std_logic_vector (24 downto 0);
  signal grants : std_logic_vector (24 downto 0);
  signal routes : std_logic_vector (154 downto 0);
  signal inputs_n2_live_fifo_c_in_ready : std_logic;
  signal inputs_n2_live_fifo_c_out_data : std_logic_vector (31 downto 0);
  signal inputs_n2_live_fifo_c_out_valid : std_logic;
  signal inputs_n2_live_fifo_c_count : std_logic_vector (30 downto 0);
  signal n266_o : std_logic_vector (31 downto 0);
  signal n267_o : std_logic;
  signal n271_o : std_logic;
  signal inputs_n2_live_route_c_requested_port : std_logic_vector (30 downto 0);
  signal n273_o : std_logic_vector (31 downto 0);
  signal inputs_n3_live_fifo_c_in_ready : std_logic;
  signal inputs_n3_live_fifo_c_out_data : std_logic_vector (31 downto 0);
  signal inputs_n3_live_fifo_c_out_valid : std_logic;
  signal inputs_n3_live_fifo_c_count : std_logic_vector (30 downto 0);
  signal n275_o : std_logic_vector (31 downto 0);
  signal n276_o : std_logic;
  signal n280_o : std_logic;
  signal inputs_n3_live_route_c_requested_port : std_logic_vector (30 downto 0);
  signal n282_o : std_logic_vector (31 downto 0);
  signal inputs_n5_live_fifo_c_in_ready : std_logic;
  signal inputs_n5_live_fifo_c_out_data : std_logic_vector (31 downto 0);
  signal inputs_n5_live_fifo_c_out_valid : std_logic;
  signal inputs_n5_live_fifo_c_count : std_logic_vector (30 downto 0);
  signal n289_o : std_logic_vector (31 downto 0);
  signal n290_o : std_logic;
  signal n294_o : std_logic;
  signal inputs_n5_live_route_c_requested_port : std_logic_vector (30 downto 0);
  signal n296_o : std_logic_vector (31 downto 0);
  signal n302_o : std_logic;
  signal n303_o : std_logic_vector (30 downto 0);
  signal n304_o : std_logic_vector (2 downto 0);
  constant n306_o : std_logic_vector (4 downto 0) := "10110";
  signal n308_o : std_logic;
  signal n309_o : std_logic_vector (30 downto 0);
  signal n310_o : std_logic_vector (2 downto 0);
  signal n312_o : std_logic_vector (2 downto 0);
  constant n314_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n318_o : std_logic_vector (24 downto 0);
  signal n320_o : std_logic;
  signal n321_o : std_logic;
  signal n322_o : std_logic;
  signal n325_o : std_logic;
  constant n326_o : std_logic_vector (4 downto 0) := "00000";
  signal n328_o : std_logic;
  signal n329_o : std_logic;
  signal n330_o : std_logic;
  signal n332_o : std_logic;
  signal n333_o : std_logic;
  signal n334_o : std_logic;
  signal n335_o : std_logic;
  signal n337_o : std_logic;
  signal n338_o : std_logic;
  signal n339_o : std_logic;
  signal n340_o : std_logic;
  signal n342_o : std_logic;
  signal n343_o : std_logic;
  signal n344_o : std_logic;
  signal n345_o : std_logic;
  signal n347_o : std_logic;
  signal n348_o : std_logic;
  signal n349_o : std_logic_vector (30 downto 0);
  signal n350_o : std_logic_vector (2 downto 0);
  constant n352_o : std_logic_vector (4 downto 0) := "10110";
  signal n354_o : std_logic;
  signal n355_o : std_logic_vector (30 downto 0);
  signal n356_o : std_logic_vector (2 downto 0);
  signal n358_o : std_logic_vector (2 downto 0);
  signal n362_o : std_logic_vector (24 downto 0);
  signal n363_o : std_logic;
  signal n364_o : std_logic;
  signal n365_o : std_logic;
  signal n367_o : std_logic;
  signal n368_o : std_logic;
  signal n370_o : std_logic;
  signal n371_o : std_logic;
  signal n372_o : std_logic;
  signal n374_o : std_logic;
  signal n375_o : std_logic;
  signal n376_o : std_logic;
  signal n377_o : std_logic;
  signal n379_o : std_logic;
  signal n380_o : std_logic;
  signal n381_o : std_logic;
  signal n382_o : std_logic;
  signal n384_o : std_logic;
  signal n385_o : std_logic;
  signal n386_o : std_logic;
  signal n387_o : std_logic;
  signal n389_o : std_logic;
  signal n390_o : std_logic;
  signal n391_o : std_logic_vector (30 downto 0);
  signal n392_o : std_logic_vector (2 downto 0);
  constant n394_o : std_logic_vector (4 downto 0) := "10110";
  signal n396_o : std_logic;
  signal n397_o : std_logic_vector (30 downto 0);
  signal n398_o : std_logic_vector (2 downto 0);
  signal n400_o : std_logic_vector (2 downto 0);
  signal n404_o : std_logic_vector (24 downto 0);
  signal n405_o : std_logic;
  signal n406_o : std_logic;
  signal n407_o : std_logic;
  signal n409_o : std_logic;
  signal n410_o : std_logic;
  signal n412_o : std_logic;
  signal n413_o : std_logic;
  signal n414_o : std_logic;
  signal n416_o : std_logic;
  signal n417_o : std_logic;
  signal n418_o : std_logic;
  signal n419_o : std_logic;
  signal n421_o : std_logic;
  signal n422_o : std_logic;
  signal n423_o : std_logic;
  signal n424_o : std_logic;
  signal n426_o : std_logic;
  signal n427_o : std_logic;
  signal n428_o : std_logic;
  signal n429_o : std_logic;
  signal n431_o : std_logic;
  signal n432_o : std_logic;
  signal n433_o : std_logic_vector (30 downto 0);
  signal n434_o : std_logic_vector (2 downto 0);
  constant n436_o : std_logic_vector (4 downto 0) := "10110";
  signal n438_o : std_logic;
  signal n439_o : std_logic_vector (30 downto 0);
  signal n440_o : std_logic_vector (2 downto 0);
  signal n442_o : std_logic_vector (2 downto 0);
  signal n446_o : std_logic_vector (24 downto 0);
  signal n447_o : std_logic;
  signal n448_o : std_logic;
  signal n449_o : std_logic;
  signal n451_o : std_logic;
  signal n452_o : std_logic;
  signal n453_o : std_logic;
  signal n454_o : std_logic;
  signal n455_o : std_logic;
  signal n456_o : std_logic;
  signal n458_o : std_logic;
  signal n459_o : std_logic;
  signal n460_o : std_logic;
  signal n461_o : std_logic;
  signal n463_o : std_logic;
  signal n464_o : std_logic;
  signal n465_o : std_logic;
  signal n466_o : std_logic;
  signal n468_o : std_logic;
  signal n469_o : std_logic;
  signal n470_o : std_logic;
  signal n471_o : std_logic;
  signal n473_o : std_logic;
  signal n474_o : std_logic;
  signal n475_o : std_logic_vector (30 downto 0);
  signal n476_o : std_logic_vector (2 downto 0);
  constant n478_o : std_logic_vector (4 downto 0) := "10110";
  signal n480_o : std_logic;
  signal n481_o : std_logic_vector (30 downto 0);
  signal n482_o : std_logic_vector (2 downto 0);
  signal n484_o : std_logic_vector (2 downto 0);
  signal n488_o : std_logic_vector (24 downto 0);
  signal n489_o : std_logic;
  signal n490_o : std_logic;
  signal n491_o : std_logic;
  signal n493_o : std_logic;
  signal n494_o : std_logic;
  signal n495_o : std_logic;
  signal n496_o : std_logic;
  signal n498_o : std_logic;
  signal n499_o : std_logic;
  signal n500_o : std_logic;
  signal n501_o : std_logic;
  signal n503_o : std_logic;
  signal n504_o : std_logic;
  signal n505_o : std_logic;
  signal n506_o : std_logic;
  signal n508_o : std_logic;
  signal n509_o : std_logic;
  signal n510_o : std_logic;
  signal n511_o : std_logic;
  signal n513_o : std_logic;
  signal n514_o : std_logic_vector (4 downto 0);
  signal outputs_n2_live_arb_c_grant : std_logic_vector (4 downto 0);
  signal outputs_n2_live_arb_c_pointer : std_logic_vector (2 downto 0);
  signal n521_o : std_logic_vector (4 downto 0);
  signal n522_o : std_logic;
  signal n525_o : std_logic_vector (4 downto 0);
  signal n527_o : std_logic;
  signal n528_o : std_logic;
  signal n530_o : std_logic;
  signal n531_o : std_logic;
  signal n532_o : std_logic;
  signal outputs_n3_live_arb_c_grant : std_logic_vector (4 downto 0);
  signal outputs_n3_live_arb_c_pointer : std_logic_vector (2 downto 0);
  signal n533_o : std_logic_vector (4 downto 0);
  signal n534_o : std_logic;
  signal n537_o : std_logic_vector (4 downto 0);
  signal n539_o : std_logic;
  signal n540_o : std_logic;
  signal n542_o : std_logic;
  signal n543_o : std_logic;
  signal n544_o : std_logic;
  signal outputs_n5_live_arb_c_grant : std_logic_vector (4 downto 0);
  signal outputs_n5_live_arb_c_pointer : std_logic_vector (2 downto 0);
  signal n548_o : std_logic_vector (4 downto 0);
  signal n549_o : std_logic;
  signal n552_o : std_logic_vector (4 downto 0);
  signal n554_o : std_logic;
  signal n555_o : std_logic;
  signal n557_o : std_logic;
  signal n558_o : std_logic;
  signal n559_o : std_logic;
  signal crossbar_c_outputs : std_logic_vector (159 downto 0);
  signal n561_o : std_logic_vector (159 downto 0);
  signal n562_o : std_logic_vector (4 downto 0);
  signal n563_o : std_logic_vector (4 downto 0);
  signal n564_o : std_logic_vector (24 downto 0);
  signal n565_o : std_logic_vector (154 downto 0);
  signal n566_o : std_logic_vector (4 downto 0);
  signal n567_o : std_logic_vector (4 downto 0);
  signal n568_o : std_logic_vector (154 downto 0);
  signal n569_o : std_logic;
  signal n570_o : std_logic;
  signal n571_o : std_logic;
  signal n572_o : std_logic;
  signal n573_o : std_logic;
  signal n574_o : std_logic_vector (1 downto 0);
  signal n575_o : std_logic;
  signal n576_o : std_logic;
  signal n577_o : std_logic;
  signal n578_o : std_logic;
  signal n579_o : std_logic;
  signal n580_o : std_logic;
  signal n581_o : std_logic;
  signal n582_o : std_logic;
  signal n583_o : std_logic;
  signal n584_o : std_logic;
  signal n585_o : std_logic;
  signal n586_o : std_logic;
  signal n587_o : std_logic;
  signal n588_o : std_logic;
  signal n589_o : std_logic;
  signal n590_o : std_logic;
  signal n591_o : std_logic;
  signal n592_o : std_logic;
  signal n593_o : std_logic;
  signal n594_o : std_logic_vector (3 downto 0);
  signal n595_o : std_logic;
  signal n596_o : std_logic;
  signal n597_o : std_logic_vector (3 downto 0);
  signal n598_o : std_logic;
  signal n599_o : std_logic;
  signal n600_o : std_logic_vector (3 downto 0);
  signal n601_o : std_logic;
  signal n602_o : std_logic;
  signal n603_o : std_logic_vector (3 downto 0);
  signal n604_o : std_logic;
  signal n605_o : std_logic;
  signal n606_o : std_logic_vector (3 downto 0);
  signal n607_o : std_logic_vector (24 downto 0);
  signal n608_o : std_logic;
  signal n609_o : std_logic;
  signal n610_o : std_logic;
  signal n611_o : std_logic;
  signal n612_o : std_logic;
  signal n613_o : std_logic_vector (1 downto 0);
  signal n614_o : std_logic;
  signal n615_o : std_logic;
  signal n616_o : std_logic;
  signal n617_o : std_logic;
  signal n618_o : std_logic;
  signal n619_o : std_logic;
  signal n620_o : std_logic;
  signal n621_o : std_logic;
  signal n622_o : std_logic;
  signal n623_o : std_logic;
  signal n624_o : std_logic;
  signal n625_o : std_logic;
  signal n626_o : std_logic;
  signal n627_o : std_logic;
  signal n628_o : std_logic;
  signal n629_o : std_logic;
  signal n630_o : std_logic;
  signal n631_o : std_logic;
  signal n632_o : std_logic;
  signal n633_o : std_logic;
  signal n634_o : std_logic_vector (3 downto 0);
  signal n635_o : std_logic;
  signal n636_o : std_logic;
  signal n637_o : std_logic_vector (3 downto 0);
  signal n638_o : std_logic;
  signal n639_o : std_logic;
  signal n640_o : std_logic_vector (3 downto 0);
  signal n641_o : std_logic;
  signal n642_o : std_logic;
  signal n643_o : std_logic_vector (3 downto 0);
  signal n644_o : std_logic;
  signal n645_o : std_logic;
  signal n646_o : std_logic_vector (2 downto 0);
  signal n647_o : std_logic_vector (24 downto 0);
  signal n648_o : std_logic;
  signal n649_o : std_logic;
  signal n650_o : std_logic;
  signal n651_o : std_logic;
  signal n652_o : std_logic;
  signal n653_o : std_logic_vector (1 downto 0);
  signal n654_o : std_logic;
  signal n655_o : std_logic;
  signal n656_o : std_logic;
  signal n657_o : std_logic;
  signal n658_o : std_logic;
  signal n659_o : std_logic;
  signal n660_o : std_logic;
  signal n661_o : std_logic;
  signal n662_o : std_logic;
  signal n663_o : std_logic;
  signal n664_o : std_logic;
  signal n665_o : std_logic;
  signal n666_o : std_logic;
  signal n667_o : std_logic;
  signal n668_o : std_logic;
  signal n669_o : std_logic;
  signal n670_o : std_logic;
  signal n671_o : std_logic_vector (1 downto 0);
  signal n672_o : std_logic;
  signal n673_o : std_logic;
  signal n674_o : std_logic_vector (3 downto 0);
  signal n675_o : std_logic;
  signal n676_o : std_logic;
  signal n677_o : std_logic_vector (3 downto 0);
  signal n678_o : std_logic;
  signal n679_o : std_logic;
  signal n680_o : std_logic_vector (3 downto 0);
  signal n681_o : std_logic;
  signal n682_o : std_logic;
  signal n683_o : std_logic_vector (3 downto 0);
  signal n684_o : std_logic;
  signal n685_o : std_logic;
  signal n686_o : std_logic_vector (1 downto 0);
  signal n687_o : std_logic_vector (24 downto 0);
  signal n688_o : std_logic;
  signal n689_o : std_logic;
  signal n690_o : std_logic;
  signal n691_o : std_logic;
  signal n692_o : std_logic;
  signal n693_o : std_logic_vector (1 downto 0);
  signal n694_o : std_logic;
  signal n695_o : std_logic;
  signal n696_o : std_logic;
  signal n697_o : std_logic;
  signal n698_o : std_logic;
  signal n699_o : std_logic;
  signal n700_o : std_logic;
  signal n701_o : std_logic;
  signal n702_o : std_logic;
  signal n703_o : std_logic;
  signal n704_o : std_logic;
  signal n705_o : std_logic;
  signal n706_o : std_logic;
  signal n707_o : std_logic;
  signal n708_o : std_logic;
  signal n709_o : std_logic;
  signal n710_o : std_logic;
  signal n711_o : std_logic_vector (2 downto 0);
  signal n712_o : std_logic;
  signal n713_o : std_logic;
  signal n714_o : std_logic_vector (3 downto 0);
  signal n715_o : std_logic;
  signal n716_o : std_logic;
  signal n717_o : std_logic_vector (3 downto 0);
  signal n718_o : std_logic;
  signal n719_o : std_logic;
  signal n720_o : std_logic_vector (3 downto 0);
  signal n721_o : std_logic;
  signal n722_o : std_logic;
  signal n723_o : std_logic_vector (3 downto 0);
  signal n724_o : std_logic;
  signal n725_o : std_logic;
  signal n726_o : std_logic;
  signal n727_o : std_logic_vector (24 downto 0);
  signal n728_o : std_logic;
  signal n729_o : std_logic;
  signal n730_o : std_logic;
  signal n731_o : std_logic;
  signal n732_o : std_logic;
  signal n733_o : std_logic_vector (1 downto 0);
  signal n734_o : std_logic;
  signal n735_o : std_logic;
  signal n736_o : std_logic;
  signal n737_o : std_logic;
  signal n738_o : std_logic;
  signal n739_o : std_logic;
  signal n740_o : std_logic;
  signal n741_o : std_logic;
  signal n742_o : std_logic;
  signal n743_o : std_logic;
  signal n744_o : std_logic;
  signal n745_o : std_logic;
  signal n746_o : std_logic;
  signal n747_o : std_logic;
  signal n748_o : std_logic;
  signal n749_o : std_logic;
  signal n750_o : std_logic;
  signal n751_o : std_logic_vector (3 downto 0);
  signal n752_o : std_logic;
  signal n753_o : std_logic;
  signal n754_o : std_logic_vector (3 downto 0);
  signal n755_o : std_logic;
  signal n756_o : std_logic;
  signal n757_o : std_logic_vector (3 downto 0);
  signal n758_o : std_logic;
  signal n759_o : std_logic;
  signal n760_o : std_logic_vector (3 downto 0);
  signal n761_o : std_logic;
  signal n762_o : std_logic;
  signal n763_o : std_logic_vector (3 downto 0);
  signal n764_o : std_logic;
  signal n765_o : std_logic;
  signal n766_o : std_logic_vector (24 downto 0);
begin
  in_ready <= n566_o;
  out_data <= crossbar_c_outputs;
  out_valid <= n567_o;
  dbg_count <= n568_o;
  dbg_req <= requests;
  dbg_grant <= grants;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:13:10
  heads <= n561_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:14:10
  available <= n562_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:14:20
  pop <= n514_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:14:24
  accepted <= n563_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:15:10
  requests <= n488_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:15:19
  grants <= n564_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:16:10
  routes <= n565_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:20:7
  inputs_n2_live_fifo : entity work.fifo_buffer_4 port map (
    clk => clk,
    rst => rst,
    in_data => n266_o,
    in_valid => n267_o,
    out_ready => n271_o,
    in_ready => inputs_n2_live_fifo_c_in_ready,
    out_data => inputs_n2_live_fifo_c_out_data,
    out_valid => inputs_n2_live_fifo_c_out_valid,
    count => inputs_n2_live_fifo_c_count);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:33
  n266_o <= in_data (127 downto 96);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:45
  n267_o <= in_valid (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:86
  n271_o <= pop (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:22:7
  inputs_n2_live_route : entity work.xy_route_unit_0 port map (
    packet => n273_o,
    requested_port => inputs_n2_live_route_c_requested_port);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:23:23
  n273_o <= heads (127 downto 96);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:20:7
  inputs_n3_live_fifo : entity work.fifo_buffer_4 port map (
    clk => clk,
    rst => rst,
    in_data => n275_o,
    in_valid => n276_o,
    out_ready => n280_o,
    in_ready => inputs_n3_live_fifo_c_in_ready,
    out_data => inputs_n3_live_fifo_c_out_data,
    out_valid => inputs_n3_live_fifo_c_out_valid,
    count => inputs_n3_live_fifo_c_count);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:33
  n275_o <= in_data (95 downto 64);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:45
  n276_o <= in_valid (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:86
  n280_o <= pop (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:22:7
  inputs_n3_live_route : entity work.xy_route_unit_0 port map (
    packet => n282_o,
    requested_port => inputs_n3_live_route_c_requested_port);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:23:23
  n282_o <= heads (95 downto 64);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:20:7
  inputs_n5_live_fifo : entity work.fifo_buffer_4 port map (
    clk => clk,
    rst => rst,
    in_data => n289_o,
    in_valid => n290_o,
    out_ready => n294_o,
    in_ready => inputs_n5_live_fifo_c_in_ready,
    out_data => inputs_n5_live_fifo_c_out_data,
    out_valid => inputs_n5_live_fifo_c_out_valid,
    count => inputs_n5_live_fifo_c_count);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:33
  n289_o <= in_data (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:45
  n290_o <= in_valid (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:21:86
  n294_o <= pop (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:22:7
  inputs_n5_live_route : entity work.xy_route_unit_0 port map (
    packet => n296_o,
    requested_port => inputs_n5_live_route_c_requested_port);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:23:23
  n296_o <= heads (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n302_o <= available (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n303_o <= routes (154 downto 124);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n304_o <= n303_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n308_o <= n577_o and n302_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n309_o <= routes (154 downto 124);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n310_o <= n309_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n312_o <= std_logic_vector (unsigned'("100") - unsigned (n310_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n318_o <= "0000000000000000000000000" when n308_o = '0' else n607_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n320_o <= grants (20);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n321_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n322_o <= n321_o and n320_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n325_o <= '0' when n322_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n328_o <= grants (15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n329_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n330_o <= n329_o and n328_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n332_o <= n325_o when n330_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n333_o <= grants (10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n334_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n335_o <= n334_o and n333_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n337_o <= n332_o when n335_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n338_o <= grants (5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n339_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n340_o <= n339_o and n338_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n342_o <= n337_o when n340_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n343_o <= grants (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n344_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n345_o <= n344_o and n343_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n347_o <= n342_o when n345_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n348_o <= available (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n349_o <= routes (123 downto 93);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n350_o <= n349_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n354_o <= n616_o and n348_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n355_o <= routes (123 downto 93);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n356_o <= n355_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n358_o <= std_logic_vector (unsigned'("100") - unsigned (n356_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n362_o <= n318_o when n354_o = '0' else n647_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n363_o <= grants (21);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n364_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n365_o <= n364_o and n363_o;
  n367_o <= n326_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n368_o <= n367_o when n365_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n370_o <= grants (16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n371_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n372_o <= n371_o and n370_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n374_o <= n368_o when n372_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n375_o <= grants (11);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n376_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n377_o <= n376_o and n375_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n379_o <= n374_o when n377_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n380_o <= grants (6);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n381_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n382_o <= n381_o and n380_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n384_o <= n379_o when n382_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n385_o <= grants (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n386_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n387_o <= n386_o and n385_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n389_o <= n384_o when n387_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n390_o <= available (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n391_o <= routes (92 downto 62);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n392_o <= n391_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n396_o <= n656_o and n390_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n397_o <= routes (92 downto 62);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n398_o <= n397_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n400_o <= std_logic_vector (unsigned'("100") - unsigned (n398_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n404_o <= n362_o when n396_o = '0' else n687_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n405_o <= grants (22);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n406_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n407_o <= n406_o and n405_o;
  n409_o <= n326_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n410_o <= n409_o when n407_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n412_o <= grants (17);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n413_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n414_o <= n413_o and n412_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n416_o <= n410_o when n414_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n417_o <= grants (12);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n418_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n419_o <= n418_o and n417_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n421_o <= n416_o when n419_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n422_o <= grants (7);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n423_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n424_o <= n423_o and n422_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n426_o <= n421_o when n424_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n427_o <= grants (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n428_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n429_o <= n428_o and n427_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n431_o <= n426_o when n429_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n432_o <= available (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n433_o <= routes (61 downto 31);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n434_o <= n433_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n438_o <= n696_o and n432_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n439_o <= routes (61 downto 31);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n440_o <= n439_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n442_o <= std_logic_vector (unsigned'("100") - unsigned (n440_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n446_o <= n404_o when n438_o = '0' else n727_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n447_o <= grants (23);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n448_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n449_o <= n448_o and n447_o;
  n451_o <= n326_o (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n452_o <= n451_o when n449_o = '0' else '1';
  n453_o <= n326_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n454_o <= grants (18);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n455_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n456_o <= n455_o and n454_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n458_o <= n452_o when n456_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n459_o <= grants (13);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n460_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n461_o <= n460_o and n459_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n463_o <= n458_o when n461_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n464_o <= grants (8);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n465_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n466_o <= n465_o and n464_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n468_o <= n463_o when n466_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n469_o <= grants (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n470_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n471_o <= n470_o and n469_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n473_o <= n468_o when n471_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:19
  n474_o <= available (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n475_o <= routes (30 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:44
  n476_o <= n475_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:27
  n480_o <= n736_o and n474_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n481_o <= routes (30 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n482_o <= n481_o (2 downto 0);  --  trunc
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n484_o <= std_logic_vector (unsigned'("100") - unsigned (n482_o));
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:7
  n488_o <= n446_o when n480_o = '0' else n766_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n489_o <= grants (24);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n490_o <= accepted (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n491_o <= n490_o and n489_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n493_o <= n453_o when n491_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n494_o <= grants (19);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n495_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n496_o <= n495_o and n494_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n498_o <= n493_o when n496_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n499_o <= grants (14);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n500_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n501_o <= n500_o and n499_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n503_o <= n498_o when n501_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n504_o <= grants (9);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n505_o <= accepted (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n506_o <= n505_o and n504_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n508_o <= n503_o when n506_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:21
  n509_o <= grants (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:41
  n510_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:29
  n511_o <= n510_o and n509_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:37:9
  n513_o <= n508_o when n511_o = '0' else '1';
  n514_o <= n513_o & n473_o & n431_o & n389_o & n347_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:7
  outputs_n2_live_arb : entity work.rr_arbiter port map (
    clk => clk,
    rst => rst,
    req => n521_o,
    accept => n522_o,
    grant => outputs_n2_live_arb_c_grant,
    pointer => open);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:61
  n521_o <= requests (19 downto 15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:73
  n522_o <= accepted (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:36
  n525_o <= grants (19 downto 15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:39
  n527_o <= '1' when n525_o /= "00000" else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:25
  n528_o <= '0' when n527_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:29
  n530_o <= n567_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:46
  n531_o <= out_ready (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:33
  n532_o <= n530_o and n531_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:7
  outputs_n3_live_arb : entity work.rr_arbiter port map (
    clk => clk,
    rst => rst,
    req => n533_o,
    accept => n534_o,
    grant => outputs_n3_live_arb_c_grant,
    pointer => open);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:61
  n533_o <= requests (14 downto 10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:73
  n534_o <= accepted (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:36
  n537_o <= grants (14 downto 10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:39
  n539_o <= '1' when n537_o /= "00000" else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:25
  n540_o <= '0' when n539_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:29
  n542_o <= n567_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:46
  n543_o <= out_ready (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:33
  n544_o <= n542_o and n543_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:7
  outputs_n5_live_arb : entity work.rr_arbiter port map (
    clk => clk,
    rst => rst,
    req => n548_o,
    accept => n549_o,
    grant => outputs_n5_live_arb_c_grant,
    pointer => open);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:61
  n548_o <= requests (4 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:73
  n549_o <= accepted (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:36
  n552_o <= grants (4 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:39
  n554_o <= '1' when n552_o /= "00000" else '0';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:45:25
  n555_o <= '0' when n554_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:29
  n557_o <= n567_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:46
  n558_o <= out_ready (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:46:33
  n559_o <= n557_o and n558_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:52:3
  crossbar : entity work.crossbar_5x5 port map (
    heads => heads,
    grants => grants,
    outputs => crossbar_c_outputs);
  n561_o <= "00000000000000000000000000000000" & inputs_n2_live_fifo_c_out_data & inputs_n3_live_fifo_c_out_data & "00000000000000000000000000000000" & inputs_n5_live_fifo_c_out_data;
  n562_o <= inputs_n5_live_fifo_c_out_valid & '0' & inputs_n3_live_fifo_c_out_valid & inputs_n2_live_fifo_c_out_valid & '0';
  n563_o <= n559_o & '0' & n544_o & n532_o & '0';
  n564_o <= "00000" & outputs_n2_live_arb_c_grant & outputs_n3_live_arb_c_grant & "00000" & outputs_n5_live_arb_c_grant;
  n565_o <= "0000000000000000000000000000100" & inputs_n2_live_route_c_requested_port & inputs_n3_live_route_c_requested_port & "0000000000000000000000000000100" & inputs_n5_live_route_c_requested_port;
  n566_o <= inputs_n5_live_fifo_c_in_ready & '0' & inputs_n3_live_fifo_c_in_ready & inputs_n2_live_fifo_c_in_ready & '0';
  n567_o <= n555_o & '0' & n540_o & n528_o & '0';
  n568_o <= "0000000000000000000000000000000" & inputs_n2_live_fifo_c_count & inputs_n3_live_fifo_c_count & "0000000000000000000000000000000" & inputs_n5_live_fifo_c_count;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:52:61
  n569_o <= n306_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:77
  n570_o <= n306_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:77
  n571_o <= n306_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:44:77
  n572_o <= n306_o (3);
  n573_o <= n306_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n574_o <= n304_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n574_o select n575_o <=
    n569_o when "00",
    n570_o when "01",
    n571_o when "10",
    n572_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n576_o <= n304_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n577_o <= n575_o when n576_o = '0' else n573_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n578_o <= n312_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n579_o <= not n578_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n580_o <= n312_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n581_o <= not n580_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n582_o <= n579_o and n581_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n583_o <= n579_o and n580_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n584_o <= n578_o and n581_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n585_o <= n312_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n586_o <= not n585_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n587_o <= n582_o and n586_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n588_o <= n582_o and n585_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n589_o <= n583_o and n586_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n590_o <= n583_o and n585_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n591_o <= n584_o and n586_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:9:39
  n592_o <= n314_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n593_o <= n592_o when n587_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:8:39
  n594_o <= n314_o (4 downto 1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:8:5
  n595_o <= n314_o (5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n596_o <= n595_o when n588_o = '0' else '1';
  n597_o <= n314_o (9 downto 6);
  n598_o <= n314_o (10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n599_o <= n598_o when n589_o = '0' else '1';
  n600_o <= n314_o (14 downto 11);
  n601_o <= n314_o (15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n602_o <= n601_o when n590_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:29:3
  n603_o <= n314_o (19 downto 16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:31:14
  n604_o <= n314_o (20);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n605_o <= n604_o when n591_o = '0' else '1';
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:30:14
  n606_o <= n314_o (24 downto 21);
  n607_o <= n606_o & n605_o & n603_o & n602_o & n600_o & n599_o & n597_o & n596_o & n594_o & n593_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n608_o <= n352_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n609_o <= n352_o (1);
  n610_o <= n352_o (2);
  n611_o <= n352_o (3);
  n612_o <= n352_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n613_o <= n350_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n613_o select n614_o <=
    n608_o when "00",
    n609_o when "01",
    n610_o when "10",
    n611_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n615_o <= n350_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n616_o <= n614_o when n615_o = '0' else n612_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n617_o <= n358_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n618_o <= not n617_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n619_o <= n358_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n620_o <= not n619_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n621_o <= n618_o and n620_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n622_o <= n618_o and n619_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n623_o <= n617_o and n620_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n624_o <= n358_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n625_o <= not n624_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n626_o <= n621_o and n625_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n627_o <= n621_o and n624_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n628_o <= n622_o and n625_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n629_o <= n622_o and n624_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n630_o <= n623_o and n625_o;
  n631_o <= n318_o (0);
  n632_o <= n318_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n633_o <= n632_o when n626_o = '0' else '1';
  n634_o <= n318_o (5 downto 2);
  n635_o <= n318_o (6);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n636_o <= n635_o when n627_o = '0' else '1';
  n637_o <= n318_o (10 downto 7);
  n638_o <= n318_o (11);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n639_o <= n638_o when n628_o = '0' else '1';
  n640_o <= n318_o (15 downto 12);
  n641_o <= n318_o (16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n642_o <= n641_o when n629_o = '0' else '1';
  n643_o <= n318_o (20 downto 17);
  n644_o <= n318_o (21);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n645_o <= n644_o when n630_o = '0' else '1';
  n646_o <= n318_o (24 downto 22);
  n647_o <= n646_o & n645_o & n643_o & n642_o & n640_o & n639_o & n637_o & n636_o & n634_o & n633_o & n631_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n648_o <= n394_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n649_o <= n394_o (1);
  n650_o <= n394_o (2);
  n651_o <= n394_o (3);
  n652_o <= n394_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n653_o <= n392_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n653_o select n654_o <=
    n648_o when "00",
    n649_o when "01",
    n650_o when "10",
    n651_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n655_o <= n392_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n656_o <= n654_o when n655_o = '0' else n652_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n657_o <= n400_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n658_o <= not n657_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n659_o <= n400_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n660_o <= not n659_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n661_o <= n658_o and n660_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n662_o <= n658_o and n659_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n663_o <= n657_o and n660_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n664_o <= n400_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n665_o <= not n664_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n666_o <= n661_o and n665_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n667_o <= n661_o and n664_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n668_o <= n662_o and n665_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n669_o <= n662_o and n664_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n670_o <= n663_o and n665_o;
  n671_o <= n362_o (1 downto 0);
  n672_o <= n362_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n673_o <= n672_o when n666_o = '0' else '1';
  n674_o <= n362_o (6 downto 3);
  n675_o <= n362_o (7);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n676_o <= n675_o when n667_o = '0' else '1';
  n677_o <= n362_o (11 downto 8);
  n678_o <= n362_o (12);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n679_o <= n678_o when n668_o = '0' else '1';
  n680_o <= n362_o (16 downto 13);
  n681_o <= n362_o (17);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n682_o <= n681_o when n669_o = '0' else '1';
  n683_o <= n362_o (21 downto 18);
  n684_o <= n362_o (22);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n685_o <= n684_o when n670_o = '0' else '1';
  n686_o <= n362_o (24 downto 23);
  n687_o <= n686_o & n685_o & n683_o & n682_o & n680_o & n679_o & n677_o & n676_o & n674_o & n673_o & n671_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n688_o <= n436_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n689_o <= n436_o (1);
  n690_o <= n436_o (2);
  n691_o <= n436_o (3);
  n692_o <= n436_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n693_o <= n434_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n693_o select n694_o <=
    n688_o when "00",
    n689_o when "01",
    n690_o when "10",
    n691_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n695_o <= n434_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n696_o <= n694_o when n695_o = '0' else n692_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n697_o <= n442_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n698_o <= not n697_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n699_o <= n442_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n700_o <= not n699_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n701_o <= n698_o and n700_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n702_o <= n698_o and n699_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n703_o <= n697_o and n700_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n704_o <= n442_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n705_o <= not n704_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n706_o <= n701_o and n705_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n707_o <= n701_o and n704_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n708_o <= n702_o and n705_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n709_o <= n702_o and n704_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n710_o <= n703_o and n705_o;
  n711_o <= n404_o (2 downto 0);
  n712_o <= n404_o (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n713_o <= n712_o when n706_o = '0' else '1';
  n714_o <= n404_o (7 downto 4);
  n715_o <= n404_o (8);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n716_o <= n715_o when n707_o = '0' else '1';
  n717_o <= n404_o (12 downto 9);
  n718_o <= n404_o (13);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n719_o <= n718_o when n708_o = '0' else '1';
  n720_o <= n404_o (17 downto 14);
  n721_o <= n404_o (18);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n722_o <= n721_o when n709_o = '0' else '1';
  n723_o <= n404_o (22 downto 19);
  n724_o <= n404_o (23);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n725_o <= n724_o when n710_o = '0' else '1';
  n726_o <= n404_o (24);
  n727_o <= n726_o & n725_o & n723_o & n722_o & n720_o & n719_o & n717_o & n716_o & n714_o & n713_o & n711_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:68
  n728_o <= n478_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n729_o <= n478_o (1);
  n730_o <= n478_o (2);
  n731_o <= n478_o (3);
  n732_o <= n478_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n733_o <= n476_o (1 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  with n733_o select n734_o <=
    n728_o when "00",
    n729_o when "01",
    n730_o when "10",
    n731_o when "11",
    'X' when others;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n735_o <= n476_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:37
  n736_o <= n734_o when n735_o = '0' else n732_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n737_o <= n484_o (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n738_o <= not n737_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n739_o <= n484_o (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n740_o <= not n739_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n741_o <= n738_o and n740_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n742_o <= n738_o and n739_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n743_o <= n737_o and n740_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n744_o <= n484_o (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n745_o <= not n744_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n746_o <= n741_o and n745_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n747_o <= n741_o and n744_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n748_o <= n742_o and n745_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n749_o <= n742_o and n744_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n750_o <= n743_o and n745_o;
  n751_o <= n446_o (3 downto 0);
  n752_o <= n446_o (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n753_o <= n752_o when n746_o = '0' else '1';
  n754_o <= n446_o (8 downto 5);
  n755_o <= n446_o (9);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n756_o <= n755_o when n747_o = '0' else '1';
  n757_o <= n446_o (13 downto 10);
  n758_o <= n446_o (14);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n759_o <= n758_o when n748_o = '0' else '1';
  n760_o <= n446_o (18 downto 15);
  n761_o <= n446_o (19);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n762_o <= n761_o when n749_o = '0' else '1';
  n763_o <= n446_o (23 downto 20);
  n764_o <= n446_o (24);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/router.vhd:35:58
  n765_o <= n764_o when n750_o = '0' else '1';
  n766_o <= n765_o & n763_o & n762_o & n760_o & n759_o & n757_o & n756_o & n754_o & n753_o & n751_o;
end rtl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of noc_2x2_core is
  signal wrap_clk: std_logic;
  signal wrap_rst: std_logic;
  subtype typwrap_inject_data is std_logic_vector (127 downto 0);
  signal wrap_inject_data: typwrap_inject_data;
  subtype typwrap_inject_valid is std_logic_vector (3 downto 0);
  signal wrap_inject_valid: typwrap_inject_valid;
  subtype typwrap_eject_ready is std_logic_vector (3 downto 0);
  signal wrap_eject_ready: typwrap_eject_ready;
  subtype typwrap_inject_ready is std_logic_vector (3 downto 0);
  signal wrap_inject_ready: typwrap_inject_ready;
  subtype typwrap_eject_data is std_logic_vector (127 downto 0);
  signal wrap_eject_data: typwrap_eject_data;
  subtype typwrap_eject_valid is std_logic_vector (3 downto 0);
  signal wrap_eject_valid: typwrap_eject_valid;
  subtype typwrap_dbg_count is std_logic_vector (619 downto 0);
  signal wrap_dbg_count: typwrap_dbg_count;
  subtype typwrap_dbg_req is std_logic_vector (99 downto 0);
  signal wrap_dbg_req: typwrap_dbg_req;
  subtype typwrap_dbg_grant is std_logic_vector (99 downto 0);
  signal wrap_dbg_grant: typwrap_dbg_grant;
  subtype typwrap_dbg_out_data is std_logic_vector (639 downto 0);
  signal wrap_dbg_out_data: typwrap_dbg_out_data;
  subtype typwrap_dbg_out_valid is std_logic_vector (19 downto 0);
  signal wrap_dbg_out_valid: typwrap_dbg_out_valid;
  subtype typwrap_dbg_out_ready is std_logic_vector (19 downto 0);
  signal wrap_dbg_out_ready: typwrap_dbg_out_ready;
  signal inputs : std_logic_vector (639 downto 0);
  signal outputs : std_logic_vector (639 downto 0);
  signal iv : std_logic_vector (19 downto 0);
  signal ir : std_logic_vector (19 downto 0);
  signal ov : std_logic_vector (19 downto 0);
  signal orr : std_logic_vector (19 downto 0);
  signal occupancy : std_logic_vector (619 downto 0);
  signal req : std_logic_vector (99 downto 0);
  signal grants : std_logic_vector (99 downto 0);
  signal routers_n1_tile_c_in_ready : std_logic_vector (4 downto 0);
  signal routers_n1_tile_c_out_data : std_logic_vector (159 downto 0);
  signal routers_n1_tile_c_out_valid : std_logic_vector (4 downto 0);
  signal routers_n1_tile_c_dbg_count : std_logic_vector (154 downto 0);
  signal routers_n1_tile_c_dbg_req : std_logic_vector (24 downto 0);
  signal routers_n1_tile_c_dbg_grant : std_logic_vector (24 downto 0);
  signal n9_o : std_logic_vector (159 downto 0);
  signal n10_o : std_logic_vector (4 downto 0);
  signal n14_o : std_logic_vector (4 downto 0);
  signal n18_o : std_logic_vector (31 downto 0);
  signal n19_o : std_logic;
  signal n20_o : std_logic;
  signal n21_o : std_logic_vector (31 downto 0);
  signal n22_o : std_logic;
  signal n23_o : std_logic;
  signal n27_o : std_logic_vector (31 downto 0);
  signal n28_o : std_logic;
  signal n29_o : std_logic;
  signal n30_o : std_logic_vector (31 downto 0);
  signal n31_o : std_logic;
  signal n32_o : std_logic;
  signal n36_o : std_logic_vector (30 downto 0);
  signal n37_o : std_logic_vector (4 downto 0);
  signal n38_o : std_logic_vector (4 downto 0);
  signal n39_o : std_logic_vector (31 downto 0);
  signal n40_o : std_logic;
  signal n41_o : std_logic;
  signal n42_o : std_logic_vector (30 downto 0);
  signal n43_o : std_logic_vector (4 downto 0);
  signal n44_o : std_logic_vector (4 downto 0);
  signal n45_o : std_logic_vector (31 downto 0);
  signal n46_o : std_logic;
  signal n47_o : std_logic;
  signal n48_o : std_logic_vector (30 downto 0);
  signal n49_o : std_logic_vector (4 downto 0);
  signal n50_o : std_logic_vector (4 downto 0);
  signal n51_o : std_logic_vector (31 downto 0);
  signal n52_o : std_logic;
  signal n53_o : std_logic;
  signal n54_o : std_logic_vector (30 downto 0);
  signal n55_o : std_logic_vector (4 downto 0);
  signal n56_o : std_logic_vector (4 downto 0);
  signal n57_o : std_logic_vector (31 downto 0);
  signal n58_o : std_logic;
  signal n59_o : std_logic;
  signal n60_o : std_logic_vector (30 downto 0);
  signal n61_o : std_logic_vector (4 downto 0);
  signal n62_o : std_logic_vector (4 downto 0);
  signal n63_o : std_logic_vector (31 downto 0);
  signal n64_o : std_logic;
  signal n65_o : std_logic;
  signal routers_n2_tile_c_in_ready : std_logic_vector (4 downto 0);
  signal routers_n2_tile_c_out_data : std_logic_vector (159 downto 0);
  signal routers_n2_tile_c_out_valid : std_logic_vector (4 downto 0);
  signal routers_n2_tile_c_dbg_count : std_logic_vector (154 downto 0);
  signal routers_n2_tile_c_dbg_req : std_logic_vector (24 downto 0);
  signal routers_n2_tile_c_dbg_grant : std_logic_vector (24 downto 0);
  signal n66_o : std_logic_vector (159 downto 0);
  signal n67_o : std_logic_vector (4 downto 0);
  signal n71_o : std_logic_vector (4 downto 0);
  signal n75_o : std_logic_vector (31 downto 0);
  signal n76_o : std_logic;
  signal n77_o : std_logic;
  signal n78_o : std_logic_vector (31 downto 0);
  signal n79_o : std_logic;
  signal n80_o : std_logic;
  signal n84_o : std_logic_vector (31 downto 0);
  signal n85_o : std_logic;
  signal n86_o : std_logic;
  signal n90_o : std_logic_vector (31 downto 0);
  signal n91_o : std_logic;
  signal n92_o : std_logic;
  signal n93_o : std_logic_vector (30 downto 0);
  signal n94_o : std_logic_vector (4 downto 0);
  signal n95_o : std_logic_vector (4 downto 0);
  signal n96_o : std_logic_vector (31 downto 0);
  signal n97_o : std_logic;
  signal n98_o : std_logic;
  signal n99_o : std_logic_vector (30 downto 0);
  signal n100_o : std_logic_vector (4 downto 0);
  signal n101_o : std_logic_vector (4 downto 0);
  signal n102_o : std_logic_vector (31 downto 0);
  signal n103_o : std_logic;
  signal n104_o : std_logic;
  signal n105_o : std_logic_vector (30 downto 0);
  signal n106_o : std_logic_vector (4 downto 0);
  signal n107_o : std_logic_vector (4 downto 0);
  signal n108_o : std_logic_vector (31 downto 0);
  signal n109_o : std_logic;
  signal n110_o : std_logic;
  signal n111_o : std_logic_vector (30 downto 0);
  signal n112_o : std_logic_vector (4 downto 0);
  signal n113_o : std_logic_vector (4 downto 0);
  signal n114_o : std_logic_vector (31 downto 0);
  signal n115_o : std_logic;
  signal n116_o : std_logic;
  signal n117_o : std_logic_vector (30 downto 0);
  signal n118_o : std_logic_vector (4 downto 0);
  signal n119_o : std_logic_vector (4 downto 0);
  signal n120_o : std_logic_vector (31 downto 0);
  signal n121_o : std_logic;
  signal n122_o : std_logic;
  signal routers_n3_tile_c_in_ready : std_logic_vector (4 downto 0);
  signal routers_n3_tile_c_out_data : std_logic_vector (159 downto 0);
  signal routers_n3_tile_c_out_valid : std_logic_vector (4 downto 0);
  signal routers_n3_tile_c_dbg_count : std_logic_vector (154 downto 0);
  signal routers_n3_tile_c_dbg_req : std_logic_vector (24 downto 0);
  signal routers_n3_tile_c_dbg_grant : std_logic_vector (24 downto 0);
  signal n123_o : std_logic_vector (159 downto 0);
  signal n124_o : std_logic_vector (4 downto 0);
  signal n128_o : std_logic_vector (4 downto 0);
  signal n132_o : std_logic_vector (31 downto 0);
  signal n133_o : std_logic;
  signal n134_o : std_logic;
  signal n135_o : std_logic_vector (31 downto 0);
  signal n136_o : std_logic;
  signal n137_o : std_logic;
  signal n138_o : std_logic_vector (31 downto 0);
  signal n139_o : std_logic;
  signal n140_o : std_logic;
  signal n144_o : std_logic_vector (31 downto 0);
  signal n145_o : std_logic;
  signal n146_o : std_logic;
  signal n150_o : std_logic_vector (30 downto 0);
  signal n151_o : std_logic_vector (4 downto 0);
  signal n152_o : std_logic_vector (4 downto 0);
  signal n153_o : std_logic_vector (31 downto 0);
  signal n154_o : std_logic;
  signal n155_o : std_logic;
  signal n156_o : std_logic_vector (30 downto 0);
  signal n157_o : std_logic_vector (4 downto 0);
  signal n158_o : std_logic_vector (4 downto 0);
  signal n159_o : std_logic_vector (31 downto 0);
  signal n160_o : std_logic;
  signal n161_o : std_logic;
  signal n162_o : std_logic_vector (30 downto 0);
  signal n163_o : std_logic_vector (4 downto 0);
  signal n164_o : std_logic_vector (4 downto 0);
  signal n165_o : std_logic_vector (31 downto 0);
  signal n166_o : std_logic;
  signal n167_o : std_logic;
  signal n168_o : std_logic_vector (30 downto 0);
  signal n169_o : std_logic_vector (4 downto 0);
  signal n170_o : std_logic_vector (4 downto 0);
  signal n171_o : std_logic_vector (31 downto 0);
  signal n172_o : std_logic;
  signal n173_o : std_logic;
  signal n174_o : std_logic_vector (30 downto 0);
  signal n175_o : std_logic_vector (4 downto 0);
  signal n176_o : std_logic_vector (4 downto 0);
  signal n177_o : std_logic_vector (31 downto 0);
  signal n178_o : std_logic;
  signal n179_o : std_logic;
  signal routers_n4_tile_c_in_ready : std_logic_vector (4 downto 0);
  signal routers_n4_tile_c_out_data : std_logic_vector (159 downto 0);
  signal routers_n4_tile_c_out_valid : std_logic_vector (4 downto 0);
  signal routers_n4_tile_c_dbg_count : std_logic_vector (154 downto 0);
  signal routers_n4_tile_c_dbg_req : std_logic_vector (24 downto 0);
  signal routers_n4_tile_c_dbg_grant : std_logic_vector (24 downto 0);
  signal n180_o : std_logic_vector (159 downto 0);
  signal n181_o : std_logic_vector (4 downto 0);
  signal n185_o : std_logic_vector (4 downto 0);
  signal n189_o : std_logic_vector (31 downto 0);
  signal n190_o : std_logic;
  signal n191_o : std_logic;
  signal n192_o : std_logic_vector (31 downto 0);
  signal n193_o : std_logic;
  signal n194_o : std_logic;
  signal n195_o : std_logic_vector (31 downto 0);
  signal n196_o : std_logic;
  signal n197_o : std_logic;
  signal n204_o : std_logic_vector (31 downto 0);
  signal n205_o : std_logic;
  signal n206_o : std_logic;
  signal n207_o : std_logic_vector (30 downto 0);
  signal n208_o : std_logic_vector (4 downto 0);
  signal n209_o : std_logic_vector (4 downto 0);
  signal n210_o : std_logic_vector (31 downto 0);
  signal n211_o : std_logic;
  signal n212_o : std_logic;
  signal n213_o : std_logic_vector (30 downto 0);
  signal n214_o : std_logic_vector (4 downto 0);
  signal n215_o : std_logic_vector (4 downto 0);
  signal n216_o : std_logic_vector (31 downto 0);
  signal n217_o : std_logic;
  signal n218_o : std_logic;
  signal n219_o : std_logic_vector (30 downto 0);
  signal n220_o : std_logic_vector (4 downto 0);
  signal n221_o : std_logic_vector (4 downto 0);
  signal n222_o : std_logic_vector (31 downto 0);
  signal n223_o : std_logic;
  signal n224_o : std_logic;
  signal n225_o : std_logic_vector (30 downto 0);
  signal n226_o : std_logic_vector (4 downto 0);
  signal n227_o : std_logic_vector (4 downto 0);
  signal n228_o : std_logic_vector (31 downto 0);
  signal n229_o : std_logic;
  signal n230_o : std_logic;
  signal n231_o : std_logic_vector (30 downto 0);
  signal n232_o : std_logic_vector (4 downto 0);
  signal n233_o : std_logic_vector (4 downto 0);
  signal n234_o : std_logic_vector (31 downto 0);
  signal n235_o : std_logic;
  signal n236_o : std_logic;
  signal n237_o : std_logic_vector (639 downto 0);
  signal n238_o : std_logic_vector (639 downto 0);
  signal n239_o : std_logic_vector (19 downto 0);
  signal n240_o : std_logic_vector (19 downto 0);
  signal n241_o : std_logic_vector (19 downto 0);
  signal n242_o : std_logic_vector (19 downto 0);
  signal n243_o : std_logic_vector (619 downto 0);
  signal n244_o : std_logic_vector (99 downto 0);
  signal n245_o : std_logic_vector (99 downto 0);
  signal n246_o : std_logic_vector (3 downto 0);
  signal n247_o : std_logic_vector (127 downto 0);
  signal n248_o : std_logic_vector (3 downto 0);
  signal n249_o : std_logic_vector (619 downto 0);
  signal n250_o : std_logic_vector (99 downto 0);
  signal n251_o : std_logic_vector (99 downto 0);
  signal n252_o : std_logic_vector (639 downto 0);
  signal n253_o : std_logic_vector (19 downto 0);
  signal n254_o : std_logic_vector (19 downto 0);
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_inject_data (31 downto 0) <= std_logic_vector(inject_data ( 0));
  wrap_inject_data (63 downto 32) <= std_logic_vector(inject_data ( 1));
  wrap_inject_data (95 downto 64) <= std_logic_vector(inject_data ( 2));
  wrap_inject_data (127 downto 96) <= std_logic_vector(inject_data ( 3));
  wrap_inject_valid <= typwrap_inject_valid(inject_valid);
  wrap_eject_ready <= typwrap_eject_ready(eject_ready);
  inject_ready <= std_logic_vector(wrap_inject_ready);
  eject_data ( 0) <= packet_t(wrap_eject_data (31 downto 0));
  eject_data ( 1) <= packet_t(wrap_eject_data (63 downto 32));
  eject_data ( 2) <= packet_t(wrap_eject_data (95 downto 64));
  eject_data ( 3) <= packet_t(wrap_eject_data (127 downto 96));
  eject_valid <= std_logic_vector(wrap_eject_valid);
  dbg_count ( 0) <= to_integer (unsigned (wrap_dbg_count (30 downto 0)));
  dbg_count ( 1) <= to_integer (unsigned (wrap_dbg_count (61 downto 31)));
  dbg_count ( 2) <= to_integer (unsigned (wrap_dbg_count (92 downto 62)));
  dbg_count ( 3) <= to_integer (unsigned (wrap_dbg_count (123 downto 93)));
  dbg_count ( 4) <= to_integer (unsigned (wrap_dbg_count (154 downto 124)));
  dbg_count ( 5) <= to_integer (unsigned (wrap_dbg_count (185 downto 155)));
  dbg_count ( 6) <= to_integer (unsigned (wrap_dbg_count (216 downto 186)));
  dbg_count ( 7) <= to_integer (unsigned (wrap_dbg_count (247 downto 217)));
  dbg_count ( 8) <= to_integer (unsigned (wrap_dbg_count (278 downto 248)));
  dbg_count ( 9) <= to_integer (unsigned (wrap_dbg_count (309 downto 279)));
  dbg_count ( 10) <= to_integer (unsigned (wrap_dbg_count (340 downto 310)));
  dbg_count ( 11) <= to_integer (unsigned (wrap_dbg_count (371 downto 341)));
  dbg_count ( 12) <= to_integer (unsigned (wrap_dbg_count (402 downto 372)));
  dbg_count ( 13) <= to_integer (unsigned (wrap_dbg_count (433 downto 403)));
  dbg_count ( 14) <= to_integer (unsigned (wrap_dbg_count (464 downto 434)));
  dbg_count ( 15) <= to_integer (unsigned (wrap_dbg_count (495 downto 465)));
  dbg_count ( 16) <= to_integer (unsigned (wrap_dbg_count (526 downto 496)));
  dbg_count ( 17) <= to_integer (unsigned (wrap_dbg_count (557 downto 527)));
  dbg_count ( 18) <= to_integer (unsigned (wrap_dbg_count (588 downto 558)));
  dbg_count ( 19) <= to_integer (unsigned (wrap_dbg_count (619 downto 589)));
  dbg_req ( 0) <= ports_t(wrap_dbg_req (4 downto 0));
  dbg_req ( 1) <= ports_t(wrap_dbg_req (9 downto 5));
  dbg_req ( 2) <= ports_t(wrap_dbg_req (14 downto 10));
  dbg_req ( 3) <= ports_t(wrap_dbg_req (19 downto 15));
  dbg_req ( 4) <= ports_t(wrap_dbg_req (24 downto 20));
  dbg_req ( 5) <= ports_t(wrap_dbg_req (29 downto 25));
  dbg_req ( 6) <= ports_t(wrap_dbg_req (34 downto 30));
  dbg_req ( 7) <= ports_t(wrap_dbg_req (39 downto 35));
  dbg_req ( 8) <= ports_t(wrap_dbg_req (44 downto 40));
  dbg_req ( 9) <= ports_t(wrap_dbg_req (49 downto 45));
  dbg_req ( 10) <= ports_t(wrap_dbg_req (54 downto 50));
  dbg_req ( 11) <= ports_t(wrap_dbg_req (59 downto 55));
  dbg_req ( 12) <= ports_t(wrap_dbg_req (64 downto 60));
  dbg_req ( 13) <= ports_t(wrap_dbg_req (69 downto 65));
  dbg_req ( 14) <= ports_t(wrap_dbg_req (74 downto 70));
  dbg_req ( 15) <= ports_t(wrap_dbg_req (79 downto 75));
  dbg_req ( 16) <= ports_t(wrap_dbg_req (84 downto 80));
  dbg_req ( 17) <= ports_t(wrap_dbg_req (89 downto 85));
  dbg_req ( 18) <= ports_t(wrap_dbg_req (94 downto 90));
  dbg_req ( 19) <= ports_t(wrap_dbg_req (99 downto 95));
  dbg_grant ( 0) <= ports_t(wrap_dbg_grant (4 downto 0));
  dbg_grant ( 1) <= ports_t(wrap_dbg_grant (9 downto 5));
  dbg_grant ( 2) <= ports_t(wrap_dbg_grant (14 downto 10));
  dbg_grant ( 3) <= ports_t(wrap_dbg_grant (19 downto 15));
  dbg_grant ( 4) <= ports_t(wrap_dbg_grant (24 downto 20));
  dbg_grant ( 5) <= ports_t(wrap_dbg_grant (29 downto 25));
  dbg_grant ( 6) <= ports_t(wrap_dbg_grant (34 downto 30));
  dbg_grant ( 7) <= ports_t(wrap_dbg_grant (39 downto 35));
  dbg_grant ( 8) <= ports_t(wrap_dbg_grant (44 downto 40));
  dbg_grant ( 9) <= ports_t(wrap_dbg_grant (49 downto 45));
  dbg_grant ( 10) <= ports_t(wrap_dbg_grant (54 downto 50));
  dbg_grant ( 11) <= ports_t(wrap_dbg_grant (59 downto 55));
  dbg_grant ( 12) <= ports_t(wrap_dbg_grant (64 downto 60));
  dbg_grant ( 13) <= ports_t(wrap_dbg_grant (69 downto 65));
  dbg_grant ( 14) <= ports_t(wrap_dbg_grant (74 downto 70));
  dbg_grant ( 15) <= ports_t(wrap_dbg_grant (79 downto 75));
  dbg_grant ( 16) <= ports_t(wrap_dbg_grant (84 downto 80));
  dbg_grant ( 17) <= ports_t(wrap_dbg_grant (89 downto 85));
  dbg_grant ( 18) <= ports_t(wrap_dbg_grant (94 downto 90));
  dbg_grant ( 19) <= ports_t(wrap_dbg_grant (99 downto 95));
  dbg_out_data ( 0) <= packet_t(wrap_dbg_out_data (31 downto 0));
  dbg_out_data ( 1) <= packet_t(wrap_dbg_out_data (63 downto 32));
  dbg_out_data ( 2) <= packet_t(wrap_dbg_out_data (95 downto 64));
  dbg_out_data ( 3) <= packet_t(wrap_dbg_out_data (127 downto 96));
  dbg_out_data ( 4) <= packet_t(wrap_dbg_out_data (159 downto 128));
  dbg_out_data ( 5) <= packet_t(wrap_dbg_out_data (191 downto 160));
  dbg_out_data ( 6) <= packet_t(wrap_dbg_out_data (223 downto 192));
  dbg_out_data ( 7) <= packet_t(wrap_dbg_out_data (255 downto 224));
  dbg_out_data ( 8) <= packet_t(wrap_dbg_out_data (287 downto 256));
  dbg_out_data ( 9) <= packet_t(wrap_dbg_out_data (319 downto 288));
  dbg_out_data ( 10) <= packet_t(wrap_dbg_out_data (351 downto 320));
  dbg_out_data ( 11) <= packet_t(wrap_dbg_out_data (383 downto 352));
  dbg_out_data ( 12) <= packet_t(wrap_dbg_out_data (415 downto 384));
  dbg_out_data ( 13) <= packet_t(wrap_dbg_out_data (447 downto 416));
  dbg_out_data ( 14) <= packet_t(wrap_dbg_out_data (479 downto 448));
  dbg_out_data ( 15) <= packet_t(wrap_dbg_out_data (511 downto 480));
  dbg_out_data ( 16) <= packet_t(wrap_dbg_out_data (543 downto 512));
  dbg_out_data ( 17) <= packet_t(wrap_dbg_out_data (575 downto 544));
  dbg_out_data ( 18) <= packet_t(wrap_dbg_out_data (607 downto 576));
  dbg_out_data ( 19) <= packet_t(wrap_dbg_out_data (639 downto 608));
  dbg_out_valid <= std_logic_vector(wrap_dbg_out_valid);
  dbg_out_ready <= std_logic_vector(wrap_dbg_out_ready);
  wrap_inject_ready <= n246_o;
  wrap_eject_data <= n247_o;
  wrap_eject_valid <= n248_o;
  wrap_dbg_count <= n249_o;
  wrap_dbg_req <= n250_o;
  wrap_dbg_grant <= n251_o;
  wrap_dbg_out_data <= n252_o;
  wrap_dbg_out_valid <= n253_o;
  wrap_dbg_out_ready <= n254_o;
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:20:10
  inputs <= n237_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:20:17
  outputs <= n238_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:21:10
  iv <= n239_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:21:13
  ir <= n240_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:21:16
  ov <= n241_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:21:19
  orr <= n242_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:22:10
  occupancy <= n243_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:23:10
  req <= n244_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:23:14
  grants <= n245_o; -- (signal)
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:26:5
  routers_n1_tile : entity work.router_0_4 port map (
    clk => wrap_clk,
    rst => wrap_rst,
    in_data => n9_o,
    in_valid => n10_o,
    out_ready => n14_o,
    in_ready => routers_n1_tile_c_in_ready,
    out_data => routers_n1_tile_c_out_data,
    out_valid => routers_n1_tile_c_out_valid,
    dbg_count => routers_n1_tile_c_dbg_count,
    dbg_req => routers_n1_tile_c_dbg_req,
    dbg_grant => routers_n1_tile_c_dbg_grant);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:27:30
  n9_o <= inputs (639 downto 480);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:27:36
  n10_o <= iv (19 downto 15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:27:66
  n14_o <= orr (19 downto 15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:28:30
  n18_o <= wrap_inject_data (127 downto 96);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:28:56
  n19_o <= wrap_inject_valid (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:28:82
  n20_o <= ir (19);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:29:30
  n21_o <= outputs (511 downto 480);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:29:55
  n22_o <= ov (19);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:29:81
  n23_o <= wrap_eject_ready (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:35:37
  n27_o <= outputs (319 downto 288);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:35:67
  n28_o <= ov (5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:36:29
  n29_o <= ir (5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:35:37
  n30_o <= outputs (383 downto 352);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:35:67
  n31_o <= ov (13);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:36:29
  n32_o <= ir (13);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n36_o <= occupancy (619 downto 589);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n37_o <= req (99 downto 95);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n38_o <= grants (99 downto 95);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n39_o <= outputs (639 downto 608);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n40_o <= ov (15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n41_o <= orr (15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n42_o <= occupancy (588 downto 558);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n43_o <= req (94 downto 90);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n44_o <= grants (94 downto 90);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n45_o <= outputs (607 downto 576);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n46_o <= ov (16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n47_o <= orr (16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n48_o <= occupancy (557 downto 527);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n49_o <= req (89 downto 85);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n50_o <= grants (89 downto 85);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n51_o <= outputs (575 downto 544);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n52_o <= ov (17);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n53_o <= orr (17);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n54_o <= occupancy (526 downto 496);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n55_o <= req (84 downto 80);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n56_o <= grants (84 downto 80);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n57_o <= outputs (543 downto 512);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n58_o <= ov (18);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n59_o <= orr (18);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n60_o <= occupancy (495 downto 465);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n61_o <= req (79 downto 75);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n62_o <= grants (79 downto 75);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n63_o <= outputs (511 downto 480);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n64_o <= ov (19);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n65_o <= orr (19);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:26:5
  routers_n2_tile : entity work.router_1_4 port map (
    clk => wrap_clk,
    rst => wrap_rst,
    in_data => n66_o,
    in_valid => n67_o,
    out_ready => n71_o,
    in_ready => routers_n2_tile_c_in_ready,
    out_data => routers_n2_tile_c_out_data,
    out_valid => routers_n2_tile_c_out_valid,
    dbg_count => routers_n2_tile_c_dbg_count,
    dbg_req => routers_n2_tile_c_dbg_req,
    dbg_grant => routers_n2_tile_c_dbg_grant);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:27:30
  n66_o <= inputs (479 downto 320);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:27:36
  n67_o <= iv (14 downto 10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:27:66
  n71_o <= orr (14 downto 10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:28:30
  n75_o <= wrap_inject_data (95 downto 64);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:28:56
  n76_o <= wrap_inject_valid (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:28:82
  n77_o <= ir (14);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:29:30
  n78_o <= outputs (351 downto 320);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:29:55
  n79_o <= ov (14);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:29:81
  n80_o <= wrap_eject_ready (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:35:37
  n84_o <= outputs (159 downto 128);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:35:67
  n85_o <= ov (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:36:29
  n86_o <= ir (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:35:37
  n90_o <= outputs (575 downto 544);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:35:67
  n91_o <= ov (17);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:36:29
  n92_o <= ir (17);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n93_o <= occupancy (464 downto 434);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n94_o <= req (74 downto 70);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n95_o <= grants (74 downto 70);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n96_o <= outputs (479 downto 448);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n97_o <= ov (10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n98_o <= orr (10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n99_o <= occupancy (433 downto 403);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n100_o <= req (69 downto 65);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n101_o <= grants (69 downto 65);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n102_o <= outputs (447 downto 416);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n103_o <= ov (11);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n104_o <= orr (11);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n105_o <= occupancy (402 downto 372);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n106_o <= req (64 downto 60);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n107_o <= grants (64 downto 60);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n108_o <= outputs (415 downto 384);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n109_o <= ov (12);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n110_o <= orr (12);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n111_o <= occupancy (371 downto 341);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n112_o <= req (59 downto 55);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n113_o <= grants (59 downto 55);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n114_o <= outputs (383 downto 352);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n115_o <= ov (13);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n116_o <= orr (13);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n117_o <= occupancy (340 downto 310);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n118_o <= req (54 downto 50);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n119_o <= grants (54 downto 50);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n120_o <= outputs (351 downto 320);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n121_o <= ov (14);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n122_o <= orr (14);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:26:5
  routers_n3_tile : entity work.router_2_4 port map (
    clk => wrap_clk,
    rst => wrap_rst,
    in_data => n123_o,
    in_valid => n124_o,
    out_ready => n128_o,
    in_ready => routers_n3_tile_c_in_ready,
    out_data => routers_n3_tile_c_out_data,
    out_valid => routers_n3_tile_c_out_valid,
    dbg_count => routers_n3_tile_c_dbg_count,
    dbg_req => routers_n3_tile_c_dbg_req,
    dbg_grant => routers_n3_tile_c_dbg_grant);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:27:30
  n123_o <= inputs (319 downto 160);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:27:36
  n124_o <= iv (9 downto 5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:27:66
  n128_o <= orr (9 downto 5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:28:30
  n132_o <= wrap_inject_data (63 downto 32);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:28:56
  n133_o <= wrap_inject_valid (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:28:82
  n134_o <= ir (9);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:29:30
  n135_o <= outputs (191 downto 160);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:29:55
  n136_o <= ov (9);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:29:81
  n137_o <= wrap_eject_ready (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:35:37
  n138_o <= outputs (607 downto 576);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:35:67
  n139_o <= ov (16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:36:29
  n140_o <= ir (16);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:35:37
  n144_o <= outputs (63 downto 32);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:35:67
  n145_o <= ov (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:36:29
  n146_o <= ir (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n150_o <= occupancy (309 downto 279);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n151_o <= req (49 downto 45);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n152_o <= grants (49 downto 45);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n153_o <= outputs (319 downto 288);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n154_o <= ov (5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n155_o <= orr (5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n156_o <= occupancy (278 downto 248);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n157_o <= req (44 downto 40);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n158_o <= grants (44 downto 40);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n159_o <= outputs (287 downto 256);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n160_o <= ov (6);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n161_o <= orr (6);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n162_o <= occupancy (247 downto 217);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n163_o <= req (39 downto 35);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n164_o <= grants (39 downto 35);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n165_o <= outputs (255 downto 224);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n166_o <= ov (7);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n167_o <= orr (7);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n168_o <= occupancy (216 downto 186);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n169_o <= req (34 downto 30);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n170_o <= grants (34 downto 30);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n171_o <= outputs (223 downto 192);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n172_o <= ov (8);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n173_o <= orr (8);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n174_o <= occupancy (185 downto 155);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n175_o <= req (29 downto 25);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n176_o <= grants (29 downto 25);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n177_o <= outputs (191 downto 160);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n178_o <= ov (9);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n179_o <= orr (9);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:26:5
  routers_n4_tile : entity work.router_3_4 port map (
    clk => wrap_clk,
    rst => wrap_rst,
    in_data => n180_o,
    in_valid => n181_o,
    out_ready => n185_o,
    in_ready => routers_n4_tile_c_in_ready,
    out_data => routers_n4_tile_c_out_data,
    out_valid => routers_n4_tile_c_out_valid,
    dbg_count => routers_n4_tile_c_dbg_count,
    dbg_req => routers_n4_tile_c_dbg_req,
    dbg_grant => routers_n4_tile_c_dbg_grant);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:27:30
  n180_o <= inputs (159 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:27:36
  n181_o <= iv (4 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:27:66
  n185_o <= orr (4 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:28:30
  n189_o <= wrap_inject_data (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:28:56
  n190_o <= wrap_inject_valid (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:28:82
  n191_o <= ir (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:29:30
  n192_o <= outputs (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:29:55
  n193_o <= ov (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:29:81
  n194_o <= wrap_eject_ready (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:35:37
  n195_o <= outputs (447 downto 416);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:35:67
  n196_o <= ov (11);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:36:29
  n197_o <= ir (11);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:35:37
  n204_o <= outputs (255 downto 224);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:35:67
  n205_o <= ov (7);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:36:29
  n206_o <= ir (7);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n207_o <= occupancy (154 downto 124);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n208_o <= req (24 downto 20);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n209_o <= grants (24 downto 20);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n210_o <= outputs (159 downto 128);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n211_o <= ov (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n212_o <= orr (0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n213_o <= occupancy (123 downto 93);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n214_o <= req (19 downto 15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n215_o <= grants (19 downto 15);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n216_o <= outputs (127 downto 96);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n217_o <= ov (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n218_o <= orr (1);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n219_o <= occupancy (92 downto 62);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n220_o <= req (14 downto 10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n221_o <= grants (14 downto 10);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n222_o <= outputs (95 downto 64);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n223_o <= ov (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n224_o <= orr (2);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n225_o <= occupancy (61 downto 31);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n226_o <= req (9 downto 5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n227_o <= grants (9 downto 5);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n228_o <= outputs (63 downto 32);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n229_o <= ov (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n230_o <= orr (3);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:37
  n231_o <= occupancy (30 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:63
  n232_o <= req (4 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:43:94
  n233_o <= grants (4 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:38
  n234_o <= outputs (31 downto 0);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:69
  n235_o <= ov (4);
  -- /workspace/scratch/3a2e521c2479/vhdl-2x2-mesh-noc/rtl/noc_2x2_core.vhd:44:101
  n236_o <= orr (4);
  n237_o <= "00000000000000000000000000000000" & n27_o & n30_o & "00000000000000000000000000000000" & n18_o & "00000000000000000000000000000000" & n84_o & "00000000000000000000000000000000" & n90_o & n75_o & n138_o & "00000000000000000000000000000000" & n144_o & "00000000000000000000000000000000" & n132_o & n195_o & "00000000000000000000000000000000" & "00000000000000000000000000000000" & n204_o & n189_o;
  n238_o <= routers_n1_tile_c_out_data & routers_n2_tile_c_out_data & routers_n3_tile_c_out_data & routers_n4_tile_c_out_data;
  n239_o <= n19_o & '0' & n31_o & n28_o & '0' & n76_o & n91_o & '0' & n85_o & '0' & n133_o & '0' & n145_o & '0' & n139_o & n190_o & n205_o & '0' & '0' & n196_o;
  n240_o <= routers_n1_tile_c_in_ready & routers_n2_tile_c_in_ready & routers_n3_tile_c_in_ready & routers_n4_tile_c_in_ready;
  n241_o <= routers_n1_tile_c_out_valid & routers_n2_tile_c_out_valid & routers_n3_tile_c_out_valid & routers_n4_tile_c_out_valid;
  n242_o <= n23_o & '0' & n32_o & n29_o & '0' & n80_o & n92_o & '0' & n86_o & '0' & n137_o & '0' & n146_o & '0' & n140_o & n194_o & n206_o & '0' & '0' & n197_o;
  n243_o <= routers_n1_tile_c_dbg_count & routers_n2_tile_c_dbg_count & routers_n3_tile_c_dbg_count & routers_n4_tile_c_dbg_count;
  n244_o <= routers_n1_tile_c_dbg_req & routers_n2_tile_c_dbg_req & routers_n3_tile_c_dbg_req & routers_n4_tile_c_dbg_req;
  n245_o <= routers_n1_tile_c_dbg_grant & routers_n2_tile_c_dbg_grant & routers_n3_tile_c_dbg_grant & routers_n4_tile_c_dbg_grant;
  n246_o <= n191_o & n134_o & n77_o & n20_o;
  n247_o <= n21_o & n78_o & n135_o & n192_o;
  n248_o <= n193_o & n136_o & n79_o & n22_o;
  n249_o <= n36_o & n42_o & n48_o & n54_o & n60_o & n93_o & n99_o & n105_o & n111_o & n117_o & n150_o & n156_o & n162_o & n168_o & n174_o & n207_o & n213_o & n219_o & n225_o & n231_o;
  n250_o <= n37_o & n43_o & n49_o & n55_o & n61_o & n94_o & n100_o & n106_o & n112_o & n118_o & n151_o & n157_o & n163_o & n169_o & n175_o & n208_o & n214_o & n220_o & n226_o & n232_o;
  n251_o <= n38_o & n44_o & n50_o & n56_o & n62_o & n95_o & n101_o & n107_o & n113_o & n119_o & n152_o & n158_o & n164_o & n170_o & n176_o & n209_o & n215_o & n221_o & n227_o & n233_o;
  n252_o <= n39_o & n45_o & n51_o & n57_o & n63_o & n96_o & n102_o & n108_o & n114_o & n120_o & n153_o & n159_o & n165_o & n171_o & n177_o & n210_o & n216_o & n222_o & n228_o & n234_o;
  n253_o <= n235_o & n229_o & n223_o & n217_o & n211_o & n178_o & n172_o & n166_o & n160_o & n154_o & n121_o & n115_o & n109_o & n103_o & n97_o & n64_o & n58_o & n52_o & n46_o & n40_o;
  n254_o <= n236_o & n230_o & n224_o & n218_o & n212_o & n179_o & n173_o & n167_o & n161_o & n155_o & n122_o & n116_o & n110_o & n104_o & n98_o & n65_o & n59_o & n53_o & n47_o & n41_o;
end rtl;
