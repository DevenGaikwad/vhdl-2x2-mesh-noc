# Results and interpretation

## Packet populations

| Population | Accepted | Delivered | Reset discarded | Outstanding |
|---|---:|---:|---:|---:|
| Original 93 benchmark runs | 82,523 | 82,523 | 0 | 0 |
| Directed depth-4 reset test | 106 | 74 | 32 | 0 |

The scoreboard identity is `accepted = delivered + reset_discarded + outstanding`. Offered-but-stalled traffic has not yet entered that population. Four-bit IDs wrap; the bounded testbench uses payload identities and source/destination stream accounting to distinguish transactions. An intentionally flushed packet is not silently labelled delivered.

## Latency and rate

Packet latency is delivery-edge index minus accepted-injection-edge index. Multiplication by 10 ns gives simulated nanoseconds at the testbench's 100 MHz clock basis; a path's logic delay in static timing is a different quantity. Empty-network Local/one-hop/two-hop cases take 2/4/6 cycles. Congestion/backpressure can increase latency.

`experiments/results/metrics.json` defines rate denominators and measurement cohorts. Each benchmark uses 100 warm-up cycles and 1000 measurement cycles, followed by drain. Delivered-window throughput is not interchangeable with latency samples, whose injection cohort can complete during drain. Offered-valid cycles include repeated presentation while stalled. Report rates with their scope and units.

The registered arbiter introduces one bubble between accepts. Hence 0.5 flits/cycle is an ideal ceiling for one saturated output under this controller. It is not an aggregate mesh limit. Jain fairness across four source service counts can be biased by unequal eligibility; it must not be treated as a standalone arbiter-fairness proof.

## Mapped FPGA costs

| Observation | LUT | FF | WNS ns | TNS ns |
|---|---:|---:|---:|---:|
| Archived core OOC synthesis | 1086 | 147 | +6.233 | 0 |
| Later GUI core synthesis | 1085 | 147 | +6.129 | 0 |
| Routed finite demo wrapper | 1067 | 236 | +4.571 | 0 |

Different tops, exposed debug logic and synthesis contexts can produce different resource totals. Do not subtract these runs to claim an optimization. Router input storage uses distributed RAM LUTs; zero BRAM does not mean there is no buffering. Primitive-class counters such as LUT/DMEM are not automatically additive Slice-LUT totals. Routed LUT decomposition is 841 logic + 226 memory = 1067.

WNS is the worst setup slack: required arrival minus actual arrival for the worst analyzed setup path. Positive slack means that checked path meets its requirement. TNS sums negative setup slacks; zero means no negative setup slack among the analyzed endpoints. WHS/THS are corresponding hold metrics. WPWS refers to pulse-width slack. The routed report has WHS +0.066 ns, THS 0, WPWS +3.870 ns. There is no project metric named PNS to substitute for these report labels.

The 10 ns clock constraint is a design target. Neither `1000/(10-WNS)` nor the smallest packet latency establishes measured Fmax. Clock skew, uncertainty, path classes and external constraints matter.

## Constraint scope and warnings

The core GUI check identifies 137 inputs without external input delays and 648 outputs without output delays. These are not 785 failed internal setup paths. The routed demo has CFGBVS-1 (configuration voltage properties absent) and RTSTAT-10 (unloaded nets) warnings, with no reported DRC errors. Board voltage/pin/delay values are not invented to hide warnings.

1468 routable nets are fully routed out of 1845 logical nets; the remaining 377 need no fabric routing. Placement colors and routed nets describe mapped logic connectivity, not live packet movement.

Static timing met for the saved internal clock domain. Supplemental SDF simulation did not pass. External board timing, programming and physical operation are outside the demonstrated result.
