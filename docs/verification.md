# Verification and evidence scope

There are three independent kinds of checking: archived-evidence integrity, new portable simulations, and historical Vivado implementation evidence. Passing one does not automatically pass the others.

## Saved records

`node scripts/verify_evidence.mjs` checks 17 VHDL source hashes, 14 saved GHDL PASS logs, 14 saved XSim PASS logs, 93 benchmark trace/log pairs, configurations, packet totals, dashboard copies, and 12 imported Vivado report records. It writes `evidence/package/source_trace_audit.json`. It does not launch GHDL or Vivado. `node scripts/verify_publication.mjs` separately checks the published-file inventory and 42 canonical image entries.

The historical supplemental GHDL suite was recorded with GHDL 6.0.0. The original 93-run study used GHDL 4.1.0. A new publication check with GHDL 4.1.0 passes all fourteen configurations in an isolated copy. These are separate run provenances; original log bytes are preserved.

## Fourteen portable configurations

| Testbench | Configurations | Main checks |
|---|---|---|
| `tb_fifo_buffer` | DEPTH=1,3,4,8 | Queue order, boundary cases, wrap and occupancy |
| `tb_xy_route_unit` | One | All current/destination pairs follow XY |
| `tb_rr_arbiter` | One | One-hot grant, retention, acceptance and rotating service |
| `tb_router` | CURRENT=0,1,2,3 | Corner masks, local forwarding and legal boundary use |
| `tb_demo` | One | Four finite endpoints; 64 received, done=1, error=0 |
| `tb_noc_2x2` | DEPTH=4,2,8; directed | Full mesh scoreboard, stalls, FIFO full, links and reset accounting |

The XSim suite ran the corresponding fourteen configurations. A screenshot of one packet proves that event only; the self-checking logs and scoreboards carry the broader assertion evidence. No finite test suite proves all possible traffic histories.

## Implementation evidence

Core synthesis targets `xc7s15cpga196-2`. The routed demo top includes finite endpoints and uses clock-only OOC constraints. Saved reports support internal static setup/hold timing and utilization claims. Later GUI screenshots are supplementary observations, not replacements for differently numbered archived reports.

The supplemental post-route functional console reports 64 deliveries at 530 ns. The SDF timing console reports a status/count assertion failure at 20,150 ns. This gate remains unresolved/deferred, even though SDF annotation itself succeeded. The recovered package lacks the generated DCP/netlist/SDF files needed to repeat that exact experiment.

## Hosted checks

The workflow has separate frontend, archival-evidence and supplemental-GHDL jobs. Each starts from a fresh `actions/checkout`. GHDL simulations run under runner temporary storage, and generated logs are uploaded even on failure. Vivado is not installed or executed by these jobs. Read the actual run status on the Actions page before claiming current CI success.

## Demonstration checkpoints

1. Show the four-router RTL hierarchy and exact source files.
2. Explain valid/ready at the chosen rising edge, matching packet words at injection and delivery.
3. Show directed reset accounting and separate 93-run no-loss totals.
4. Show routed placement, resources, static timing and warnings.
5. Use the dashboard to replay those recorded transfers.
6. Disclose the deferred SDF test and absence of physical-board evidence.
