# CSV schema v1 and replay interpretation

Exact header:

```text
run_id,scenario,cycle,phase,event,router,port,src,dst,packet_id,payload,packet_hex,fifo_count,req_mask,grant_mask,ready
```

| Field | Meaning / range |
| --- | --- |
| run_id / scenario | One consistent run; scenario 0 directed, 1..7 controlled |
| cycle / phase | Rising-edge index; phase 0 warm-up, 1 measurement, 2 drain |
| event | offer, inject, link, deliver, stall, state, reset_discard |
| router / port | Router index 0..3; N, S, E, W, L |
| src / dst / packet_id / payload | Decoded packet fields; −1 on state rows |
| packet_hex | Complete eight-digit hexadecimal word; empty on state rows |
| fifo_count | Pre-edge input occupancy for this port; −1 on packet events |
| req_mask / grant_mask / ready | Pre-edge output state; blank on packet events |

Masks are decimal 0..31, displayed in binary order L W E S N. A state row combines input FIFO count and output arbitration state for the same logical port; that occupancy is not an output queue. TRACE_LEVEL=2 emits twenty state rows at every active nonreset edge, including tied-off values for unused ports. Head data is not logged on every state row; an output's offered data is recorded in its stall or accepted-transfer event.

An offer is a cycle presenting valid, including a repeated stalled request. Inject is accepted local input; link is accepted directional output; deliver is accepted local ejection. Stall is a port-cycle with output valid and no ready. Reset_discard explicitly accounts for an already-accepted pending packet flushed by reset. Unaccepted cancelled attempts are not accepted packet losses.

The four-bit packet ID wraps. The bounded testbench uses a unique payload value for transaction identity and compares every bit of the original word. This convention is not a new permanent protocol field.

Replay steps exact rising-edge events without interpolated packet movement. A computed route is metadata; current transfer highlights require real link events. The bundled sample has a known depth-four configuration. Arbitrary CSV cannot independently authenticate a simulator/version or reliably establish FIFO depth. Empty derives from recorded count zero; Full requires known depth and active storage.

Metrics schema version 1 contains provenance, tool, target part, source hashes, configurations, trace hashes and per-run metrics. The frontend accepts GHDL/XSim RTL provenance declarations, but arbitrary imports remain user-supplied until correlated with actual logs. Rate calculation requires complete contiguous pre-edge state coverage during measurement; incomplete intervals yield unavailable rates. Partial traces can still expose latency and completion accounting.

A Vivado summary uses kind=vivado_report_export and contains values parsed by scripts/import_vivado_reports.mjs from saved raw reports. Unmatched values remain null. Raw reports and constraint coverage remain authoritative. No physical FPGA live-feed schema is implemented.
