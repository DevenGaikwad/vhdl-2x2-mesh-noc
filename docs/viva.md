# One-page viva quick reference

**Project:** four-router, 32-bit single-flit XY NoC in VHDL-2008. **Target:** xc7s15cpga196-2, Vivado 2026.1/XSim; 14 local XSim configurations passed; exact-part OOC synthesis and routed internal STA completed. Physical-board operation is outside the demonstrated scope.

| Question | Precise answer |
| --- | --- |
| Why a NoC? | Packet links separate communication from endpoint functions; this project is a small implementation study, not proof of universal superiority over a bus. |
| Which coordinates? | R00(0,0), R01(1,0), R10(0,1), R11(1,1); X east, Y south; index=X+2Y. |
| Which route? | X first, then Y, then Local. 0→3 is 0→1→3; 2→1 is 2→3→1. |
| When does a packet move? | Rising edge, reset inactive, external valid AND ready. Data/valid hold during a stall. |
| Why two valid fields? | Bit 31 is a legal-packet marker; the external valid signal governs handshake. |
| Which buffering? | Three depth-four input FIFOs per corner, twelve total; no bypass or virtual channels. |
| How is output stable? | Held one-hot grant retains the selected FIFO head; pop occurs only on acceptance. |
| What happens at a full boundary? | A simultaneous pop is accepted but push is refused; the producer retries next cycle. |
| What limits throughput? | One arbitration bubble after each acceptance gives 0.5 flits/cycle per output; independent outputs can act together. |
| What fairness is guaranteed? | A persistent requester is served within five successful grants in the five-port arbiter test, assuming progress; stalled cycles do not count. |
| Is reset packet loss? | It deliberately flushes storage. Depth-four directed accounting is 106=74 delivered+32 reset discards; no unexplained pending packets. |
| What was actually tested? | Fourteen GHDL test configurations and 93 RTL experiments; 82,523 accepted benchmark packets all delivered. |
| What is latency? | Delivery-accept edge minus injection-accept edge. Empty/ready local=2, one-hop=4, two-hop=6 cycles. |
| Do deeper FIFOs improve saturation? | More accepted backlog raises latency; measured hotspot output remains 0.5 flits/cycle for depths 2/4/8. |
| Is 10 ns a measured clock? | No. It is an XDC design target; no fMAX, board oscillator or bits/s is established. |
| Are CPU/AI blocks real? | No; synthesizable finite traffic models only. No Zynq PS/AXI/Linux subsystem. |
| What remains? | XSim, exact-device utilization/STA, verified board constraints/bitstream and secure private GitHub push. |

**Evidence boundary:** GHDL checks are supplemental. A green dashboard/CI does not certify FPGA timing. VHDL timing simulation is unsupported in Vivado 2026.1; use functional simulation and routed STA. No FPGA power or bus-improvement claim was measured.
