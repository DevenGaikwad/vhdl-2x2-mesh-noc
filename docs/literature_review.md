# Verified primary-source survey

Publication metadata below was checked against publisher/author/institutional records and official AMD documentation. Borrowed concepts are identified; no publication is treated as proof of this four-router implementation's numerical performance.

| Source | Method / architecture / evaluation | Idea used here | Limit or difference |
| --- | --- | --- | --- |
| L. Benini and G. De Micheli, “Networks on Chips: A New SoC Paradigm,” Computer 35(1), 70–78, Jan. 2002, DOI 10.1109/2.976921 | Network-based modular SoC interconnection perspective; architectural motivation | Separate communication fabric and endpoint functions; traffic models as educational scope | Conceptual SoC perspective does not validate our latencies, fairness or FPGA cost |
| W. J. Dally and B. Towles, “Route Packets, Not Wires: On-Chip Interconnection Networks,” DAC 2001, 684–689, DOI 10.1145/378239.379048 | Packet-network on-chip interconnect argument and architecture; different scale/router assumptions | Packetized links and explicit router/link microarchitecture | Our whole packet is one 32-bit flit with input queues; no adoption/claim of its complete architecture |
| P. P. Pande, C. Grecu, M. Jones, A. Ivanov and R. Saleh, “Performance Evaluation and Design Trade-Offs for Network-on-Chip Interconnect Architectures,” IEEE Trans. Comput. 54(8), 1025–1040, Aug. 2005, DOI 10.1109/TC.2005.134 | Compared topology design tradeoffs including performance/cost/energy metrics under stated assumptions | Controlled conditions, clear latency/throughput definitions and design-space evaluation | Published topology assumptions/costs cannot be substituted for our device and four-node measurements |
| W. J. Dally and C. L. Seitz, “Deadlock-Free Message Routing in Multiprocessor Interconnection Networks,” IEEE Trans. Comput. C-36(5), 547–553, May 1987, DOI 10.1109/TC.1987.1676939 | Channel-dependency framework for routing deadlock | Explain X→Y acyclic dependencies under legal dimension-order routes | Routing-cycle argument does not eliminate sink stalls, congestion, HOL blocking or end-to-end unfairness |
| AMD UG900,UG901,UG903,UG906 (Vivado 2026.1),UG475,DS189 | Tool simulation/language/constraints/STA and device/package specification | Actual target-tool flow; distinguish functional simulation, STA and board constraints | Official documentation guides tool use; execution reports are still required |

## Primary verification links

- Benini/DeMicheli publisher DOI: https://doi.org/10.1109/2.976921 ; author/IEEE CEDA record: https://www.c-eda.org/resources/publications
- Dally/Towles publisher DOI: https://doi.org/10.1145/378239.379048 ; primary paper reproduction: https://www.cs.uaf.edu/2012/fall/cs441/641_papers/route_packets_not_wires_2001_dally.pdf
- Pande et al. publisher DOI: https://doi.org/10.1109/TC.2005.134 ; author publications: https://eecs.wsu.edu/~pande/publications.html
- Dally/Seitz publisher DOI: https://doi.org/10.1109/TC.1987.1676939 ; author repository technical-report version: https://authors.library.caltech.edu/records/fd0yr-br438 . The technical-report repository's 1988 record date is not substituted for the 1987 journal date.
- UG900: https://docs.amd.com/r/en-US/ug900-vivado-logic-simulation
- UG901: https://docs.amd.com/r/en-US/ug901-vivado-synthesis
- UG903: https://docs.amd.com/r/en-US/ug903-vivado-using-constraints
- UG906: https://docs.amd.com/r/en-US/ug906-vivado-design-analysis
- UG475: https://docs.amd.com/v/u/en-US/ug475_7Series_Pkg_Pinout
- DS189: https://docs.amd.com/r/en-US/ds189-spartan-7-data-sheet/Introduction
- IEEE template guidance: https://conferences.ieeeauthorcenter.ieee.org/write-your-paper/authoring-tools-and-templates/

Official UG900 2026.1 states that VHDL timing simulation is unsupported. Functional RTL/post-synthesis simulation and post-route static timing are separate evidence. No long copyrighted passages or redistributed research PDFs are included. References are paraphrased and attributed, not fabricated.
