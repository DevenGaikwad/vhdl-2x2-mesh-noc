> Historical source-snapshot note: retained for provenance. Current execution status, corrected diagrams and release downloads are in the root README and docs/verification.md. Older pending-status statements below describe that earlier stage.

## Slide 1

Use the exact project title. Introduce four routers and traffic models, not implemented processors. State that this software package was rebuilt and verified with GHDL, while the required Vivado and physical-board gates remain open. The team is Anjor Giri, Nidhi Kanoujia and Deven Gaikwad; faculty and mentor is Dr. Madan Mali. Course is HDL and PLD at DES Pune University, Pune.

## Slide 2

The 82,523 figure is the whole-run total across 93 controlled experiments, including warm-up and drain completions. Latency tables use a narrower measurement injection cohort. The directed reset test intentionally flushes 32 accepted pending packets; do not describe it as loss-free delivery.

## Slide 3

These node labels attach traffic models through Local. Each corner has one local, one horizontal and one vertical active input/output. The four paired connectors stand for eight separate directional links in RTL, not a single bidirectional electrical bus. Point out R01 is east of R00 and R10 is south.

## Slide 4

Widths sum to 1+2+2+2+4+2+19=32. Priority is ignored by the baseline arbiter. Unsupported encodings fail simulation assertions and are outside the hardware contract; do not claim a synthesized type-rejection circuit. Payload identity is a bounded-testbench convention, not a new field.

## Slide 5

The diagram separates routing requests from data muxing. In code, the crossbar reads retained FIFO heads; a held one-hot grant chooses a head. The FIFO cannot pop until output valid AND ready, so the offered data remains stable without a separate output packet register. Ready does not depend combinationally on downstream ready. Full+pop refuses a push until retry.

## Slide 6

This table is derived from evidence/ghdl/directed-d4.csv, not a drawn XSim waveform. 94400012 is offered unchanged from the first recorded stall until the accepted Local delivery at cycle 118. Grant 10000 selects Local input bit 4. Acceptance clears the held grant; one arbitration bubble follows. Reset clears grant/pointer.

## Slide 7

Use these exact accepted events from the actual depth-four directed trace. The first path resolves X with East then Y with South. The second resolves X with East then Y with North. The two link transfers and final Local ejection are distinct events. The example packet words agree with the shared field layout.

## Slide 8

The mesh asserts every pair and every active nonlocal link were exercised. Router unit tests contend three active inputs at every active output for all four coordinates and test three nonconflicting transfers. FIFO tests cover depths 1, 3, 4, 8 and 1200 cycles each, including non-power-of-two wrap. The same suite must be run locally in XSim before claiming that gate.

## Slide 9

The bounded payload UID avoids ambiguity from packet-ID wrap. Every accepted injection is stored once. Link movement checks location/route and hop count. A delivery must have a pending entry, exact word, correct destination and expected source/destination stream order. Reset accounting deliberately removes pending entries. Finite watchdogs prevent quiet hangs. These tests are not exhaustive formal verification.

## Slide 10

Each depth has four deterministic cases, two random workloads×four gates×three seeds=24 cases, and three sink-stall trials: 31. Sources are closed-loop and hold stalled requests. Configured gate is conditional on a free slot, and PRNG advances every cycle even when blocked; matching seeds do not guarantee identical accepted arrival lists across depths. Testbench clock is 10 ns scheduling; hardware frequency is not measured.

## Slide 11

The chart uses measured configuration metrics, not generated UI data. Means are arithmetic means of per-run throughput, each with the same 1000-cycle denominator. The report chart also displays min/max across seeds; those ranges are not confidence intervals. Sources are free-slot gated and backpressure affects accepted load. Different outputs permit aggregate throughput above 0.5. Editable chart cells round the three-run mean to six decimal places; unrounded metrics remain in the source JSON.

## Slide 12

Actual mean latencies are 26.090, 53.749 and 108.251 cycles. Editable chart cells round metrics to three decimal places; the source JSON retains full precision. Cohort counts come from the actual per-depth table in the report. Throughput 0.5 is delivered-window count/1000. Logical packet capacity = 12 × D × 32 bits is not physical LUT/FF/BRAM utilization. This does not prove deeper buffering is universally bad; it exposes this saturated bottleneck.

## Slide 13

This is an actual browser screenshot of the created application, not a physical FPGA feed or XSim capture. The native shapes, tables and charts in other slides remain editable; a screen capture is intentionally a raster record. Run npm ci, npm test and npm run build, then serve through Vite/HTTP. Rates are unavailable if imported measurement-state coverage is incomplete. Full status needs a known FIFO depth. There is no WebSerial implementation.

## Slide 14

Vivado is the tool suite; the part string is a device/package/speed grade, not a board. No PACKAGE_PIN or IOSTANDARD is invented. Core logical bus/debug ports cannot be assigned blindly to package pins. OOC demo route analyzes fabric, not verified external timing. VHDL timing simulation is unsupported in Vivado 2026.1; functional simulation and routed STA are distinct. See official UG900/903/906.

## Slide 15

Vivado 2026.1/XSim verification is complete: all 14 configurations passed, exact-part out-of-context synthesis completed, and the demonstration wrapper was fully routed for the 10 ns target with positive timing slack. The next engineering step is to identify the exact Spartan-7 board, verify schematic-derived pins and configuration-bank voltage, apply manufacturer board constraints, and then generate and test a bitstream. A secure GitHub CLI session can privately push independently using the supplied bundle/history; no remote URL or CI is reported until observed. Future bubble-free arbitration, virtual channels, longer trials and a fair bus baseline remain proposals rather than completed features. The faculty mentor is Dr. Madan Mali.

## Slide 16

DOIs:10.1109/2.976921;10.1145/378239.379048;10.1109/TC.2005.134;10.1109/TC.1987.1676939. Supplied proposal, main topology and fifteen image files were inspected and mapped to corrected figures. Their original files are not redistributed because reuse rights are unconfirmed. IEEEtran is a TeX distribution formatting dependency, not publication evidence. No project-wide license was selected.
