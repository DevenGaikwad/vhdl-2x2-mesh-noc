source [file join [file dirname [info script]] common.tcl]
noc_project
set dir [file join $noc_reports xsim directed-d4];file mkdir $dir
set csv [string map {\\ /} [file join $dir trace.csv]]
set_property top tb_noc_2x2 [get_filesets sim_1]
set_property generic [list DEPTH=4 SCENARIO=0 RUN_ID="xsim-directed-d4" TRACE_FILE="$csv" TRACE_LEVEL=2] [get_filesets sim_1]
launch_simulation -simset sim_1 -mode behavioral
source [file join $noc_root vivado waves.tcl]
run all
# The console must contain PASS tb_noc_2x2. Assertions/errors are a failed gate.
puts "DIRECTED RUN RETURNED. Save the actual console/log; inspect PASS and assertions."
puts "TRACE: $csv"
