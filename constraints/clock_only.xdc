# Design target only. This is NOT a verified board oscillator specification.
# Do not invent package pins, I/O standards, or external delay values.
create_clock -name noc_clk -period 10.000 [get_ports clk]
# rst/start and logical packet/status interfaces have no external timing model.
# Report these unconstrained paths; this file is sufficient only for internal STA.
