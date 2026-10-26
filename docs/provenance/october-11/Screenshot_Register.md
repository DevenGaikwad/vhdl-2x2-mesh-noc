# Screenshot register

The numbered sequence has 31 steps and 32 images because step 09 has two views. The source PDF has two additional context images. File numbers are preserved.

| Step | Source PDF page | Screenshot | Main purpose |
|---|---:|---|---|
| 01 | 1 | `Vivado_Screenshots/01_Vivado_Project_Opened.png` | Open the correct Vivado project |
| 02 | 2 | `Vivado_Screenshots/02_Simulation_Sources.png` | Select the simulation testbench |
| 03 | 3 | `Vivado_Screenshots/03_Behavioral_Simulation_Opened.png` | Load behavioral simulation |
| 04 | 4 | `Vivado_Screenshots/04_Reset_and_Clock_60ns.png` | Observe clock and reset up to 60 ns |
| 05 | 5 | `Vivado_Screenshots/05_First_Packet_Injection_25ns.png` | Accept the first packet at 25 ns |
| 06 | 6 | `Vivado_Screenshots/06_First_Packet_at_Receiver_40ns.png` | See the packet presented to the receiver |
| 07 | 7 | `Vivado_Screenshots/07_FIFO_Occupancy_25ns.png` | Check FIFO occupancy at 25 ns |
| 08 | 8 | `Vivado_Screenshots/08_XY_Routing_Request_25ns.png` | Read routing requests at the cursor time |
| 09A | 9 | `Vivado_Screenshots/09A_Internal_Output_Data_40ns.png` | Match internal output data and valid |
| 09B | 10 | `Vivado_Screenshots/09B_Internal_Output_Valid_40ns.png` | Match internal output data and valid |
| 10 | 11 | `Vivado_Screenshots/10_Receiver_Delivery_Handshake_44p999ns.png` | Confirm the delivery handshake |
| 11 | 12 | `Vivado_Screenshots/11_Local_Packet_Latency_20ns_2Cycles.png` | Measure this packet's latency |
| 12 | 13 | `Vivado_Screenshots/12_XSim_Self_Checking_PASS_2400ns.png` | Read the self-checking PASS result |
| 13 | 14 | `Vivado_Screenshots/13_Elaborated_2x2_NoC_Router_Hierarchy.png` | Inspect the complete RTL hierarchy |
| 14 | 15 | `Vivado_Screenshots/14_Router0_Internal_RTL_Hierarchy.png` | Inspect one corner router |
| 15 | 16 | `Vivado_Screenshots/15_Router0_FIFO_Synthesized_Primitive_Statistics.png` | Inspect a synthesized FIFO |
| 16 | 17 | `Vivado_Screenshots/16_NoC_Core_Synthesis_Utilization_Hierarchy.png` | Read core resource totals by hierarchy |
| 17 | 18 | `Vivado_Screenshots/17_NoC_Core_Utilization_Summary_and_IO_Limit.png` | Recognize the exposed core's I/O limit |
| 18 | 19 | `Vivado_Screenshots/18_NoC_Core_LUT_Memory_By_Router.png` | Find memory LUT use in all routers |
| 19 | 20 | `Vivado_Screenshots/19_Router0_Three_FIFO_Memory_Breakdown.png` | Account for all three Router 0 FIFOs |
| 20 | 21 | `Vivado_Screenshots/20_NoC_Core_PreRoute_Timing_Summary.png` | Read pre-route static timing |
| 21 | 22 | `Vivado_Screenshots/21_NoC_Core_Check_Timing_Missing_IO_Delays.png` | Identify incomplete timing constraints |
| 22 | 23 | `Vivado_Screenshots/22_NoC_Core_Clock_Summary_10ns.png` | Confirm the 10 ns clock target |
| 23 | 24 | `Vivado_Screenshots/23_NoC_Core_Missing_Input_Delays.png` | Inspect ports lacking input delays |
| 24 | 25 | `Vivado_Screenshots/24_NoC_Core_Worst_Setup_Path_Router3_FIFO_to_Arbiter.png` | Inspect the worst synthesized setup path |
| 25 | 26 | `Vivado_Screenshots/25_Routed_Demo_Four_Router_Placement.png` | View placed routers in the routed demo |
| 26 | 27 | `Vivado_Screenshots/26_Routed_Demo_Route_Status.png` | Verify routing completion |
| 27 | 28 | `Vivado_Screenshots/27_Routed_Demo_Timing_Summary.png` | Read final routed timing |
| 28 | 29 | `Vivado_Screenshots/28_Routed_Demo_Slice_Logic_Utilization.png` | Read routed demo resource cost |
| 29 | 30 | `Vivado_Screenshots/29_Routed_Demo_DRC_Warnings.png` | Explain the two DRC warnings |
| 30 | 31 | `Vivado_Screenshots/30_Routed_Demo_Local_Arbiter_Primitive_Schematic.png` | Inspect the implemented local arbiter |
| 31 | 32 | `Vivado_Screenshots/31_Routed_Demo_Worst_Timing_Path_Summary.png` | Identify the routed critical path |

## Dashboard selections

| ID | Original filename | Meaning |
|---|---|---|
| D01 | `image(20261004-180741).png` | Architecture overview |
| D02 | `image(20261004-180755).png` | Four-router mesh |
| D03 | `image(20261004-180822).png` | Exact-edge event stream |
| D04 | `image(20261004-172458).png` | Trace replay |
| D05 | `image(20261004-172846).png` | Transaction selection |
| D06 | `image(20261004-173003).png` | Packet decoding and history |
| D07 | `image(20261004-173245).png` | Router inspector |
| D08 | `image(20261004-173555).png` | A later router state |
| D09 | `image(20261004-172136).png` | Completed tool checks and pending hardware |
| D10 | `image(20261004-180954).png` | Trace latency summary |
| D11 | `image(20261004-173919).png` | Controlled experiment throughput |
| D12 | `image(20261004-164045).png` | Imported Vivado resource summaries |
| D13 | `image(20261004-174321).png` | Research configuration |
| D14 | `image(20261004-181010).png` | Execution and data guide |
| D15 | `image(20261004-172105).png` | Fourteen supplemental test configurations |

## Important corrections

- Step 08: `req[2]=0x10` in Objects is the current 60 ns view. The first packet at the 25 ns cursor requests Local output 4; mask bit 4 identifies the Local input.
- Steps 06/09 present valid data at 40 ns; Step 10 supports acceptance at the 45 ns rising edge.
- Step 11 is Local latency, not two-hop latency.
- Setup screenshots 01–03 establish configuration, not correctness. Resource screenshots 16/17 show different views of the same GUI run; 18/19 deliberately move from router totals to FIFO detail.
- Supplemental PDF pages 33–34 are context images, not successful post-route timing screenshots.
- Dashboard originals include heading crops and historical stale-status screens. The atlas selects useful views; the full recovered archive is retained for reference.
