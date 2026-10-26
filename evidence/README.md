# Evidence index

Verified here: `ghdl/verification.json`, 14 saved test logs, depth-2/4/8 directed CSV, and `experiments/results/` (93 saved RTL CSV and logs, configuration, metrics). Source and trace SHA-256 values tie measurements to this exact RTL/TB snapshot. A directory named `vivado` is an execution destination, not proof of an executed tool run.

`ghdl/core-synthesis.log` and its optional generated netlist describe a successful generic GHDL synthesis check. They do not measure AMD device utilization, routed timing, I/O fit, or power. Generated netlists stay out of Git.

Actual baseline directed results: accepted 106; delivered 74; documented reset-discarded 32; outstanding 0. Pending-reset discards are expected, not unexplained packet loss. Controlled experiments have no mid-run resets: accepted=delivered=82,523 across all runs.

Required local captures after executing Vivado: version/part console, package-first compile order, actual XSim PASS summaries and waveform showing accepted injections/link/ejection and held data through stall; synthesized hierarchy, utilization, all warnings, `check_timing`, DRC, routed timing and critical path endpoints. Save full reports before cropping screenshots. No waveform image or AMD resource number is supplied as measured evidence here.

`frontend/production/` and `frontend/subpath/` record the final production dashboard at root and nested paths. `artifacts/` records final document/presentation validation and the successful manuscript compile log. `package/` records evidence hashes, Tcl script completeness and clean-checkout checks; these have the narrower scopes described in each record. None substitutes for a target-device run.

The earlier dashboard captures and browser record are preserved under `frontend/baseline/`. The current control-room UI is in the production/subpath folders, including every desktop/mobile view and the edge-231 mission-control capture. Production checks include active mobile-tab visibility, keyboard replay and router focus, malformed-import errors, measured-data controls and all eight directed channels.

The artifact records now identify the six-page proposal, 27-page report, seven-page guide, one-page viva sheet, six-page IEEE manuscript and sixteen-slide presentation by their current hashes. The report index has 29 checked entries. All three editable chart datasets were compared with the original measured metrics.
