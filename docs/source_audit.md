> Historical source-snapshot note: retained for provenance. Current execution status, corrected diagrams and release downloads are in the root README and docs/verification.md. Older pending-status statements below describe that earlier stage.

# Source inventory and consistency audit

Four supplied technical references were inspected in full: project proposal DOCX; main diagram explanation PDF; canonical main topology PNG; ZIP with fifteen diagram images including compact alternatives. No source code, waveform, FPGA report or pin file was supplied. The earlier diagram ZIP is an image archive, not a retained project ZIP. The present project was rebuilt because no recoverable source/checkpoint was found.

Authority: explicit baseline proposal plus canonical main diagram/explanation; consistent detail illustrations; official AMD documentation and actual tool behavior; verified primary research; documented implementation choices. The refinement uses the supplied A18 PBEL proposal for typography, logo, cover geometry and team details, and the PBEL final-report format for chapter structure. The three students are Anjor Giri (1022411048), Nidhi Kanoujia (1022411051) and Deven Gaikwad (1022411052), TY ECE Division A, Semester I, 2026–2027, DES Pune University. The current user instruction names Dr. Madan Mali as both faculty and mentor. The course is HDL and PLD. No signed certification, dated attendance or similarity percentage is supplied; these remain genuine academic records to complete after review. Wi-Fi/ESP32 project content from the formatting reference is not carried into this NoC implementation.

## Every image mapped

| Original filename | Audit/decision | Corrected figure | Section / validation |
| --- | --- | --- | --- |
| 01_2x2_mesh_noc_architecture.png | Alternative placement contradicts X-east/Y-south | 01_topology | Architecture; all 16 pair / all 8 link tests |
| 02_functional_block_diagram.png | Conceptual operation retained, source/sink models clarified | 02_functional_flow | Architecture; directed mesh |
| 03_router_internal_architecture.png | Corrected to active corner FIFOs, held grants and no extra output packet register | 03_router_datapath | Microarchitecture; tb_router |
| 04_overall_system_flowchart.png | Destination checked before forwarding via X/Y/Local route | 02_functional_flow | Protocol; tb_xy_route_unit |
| 04_overall_system_flowchart_compact.png | Same forwarding-before-destination conflict corrected | 02_functional_flow | Protocol; tb_xy_route_unit |
| 05_xy_routing_decision_flowchart.png | Coordinates/route order retained and explicit | 02_functional_flow / 11_recorded_paths | All 16 route selections |
| 06_round_robin_arbitration_flowchart.png | Pointer changes only at acceptance; grant held through stall | 07_arbitration | tb_rr_arbiter; every active router output |
| 06_round_robin_arbitration_flowchart_compact.png | Same accepted-grant control, no request-dependent revocation | 07_arbitration | Persistent-request success bound |
| 07_router_fsm_state_diagram.png | Eight illustrative states replaced by per-output FREE/HELD | 08_controller | Held state; router concurrency/stall tests |
| 08_vhdl_module_hierarchy.png | Removed imaginary whole-router FSM; actual eleven-file hierarchy | 09_hierarchy | Compile order and core/demo tops |
| 09_fpga_vhdl_development_workflow.png | Distinct tool/board gates; VHDL timing simulation not supported | 12_evidence_gates | Windows workflow |
| 10_suggested_packet_format.png | Frozen exact 32 bits and X/Y bit order; priority reserved | 04_packet_fields | Packet packing tests and dashboard decode |
| 11_simulation_timing_diagram.png | Illustrative waveform is not measured evidence | 06_handshake_trace | Actual CSV-derived held-output table; XSim capture pending |
| 12_eight_week_project_timeline.png | Excluded from measured chronology; it is a proposal schedule | Excluded | Optional planning reference only; no invented completion dates |
| 13_testbench_verification_architecture.png | Accepted-injection table, full-word/hop/order/reset assertions | 10_scoreboard | Top-level scoreboard and watchdog |

The canonical topology places R01 right of R00 and R10 below R00. Alternative geometric placement is corrected. No diagram is treated as proof of earlier RTL execution. All final figures are original SVG derivations of the present code/protocol; the handshake and example path figures are calculated from actual CSV records, not handmade waveform screenshots.
