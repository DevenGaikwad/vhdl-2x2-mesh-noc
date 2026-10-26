# Fabric-only OOC experiment. This does NOT create a board-ready implementation.
source [file join [file dirname [info script]] common.tcl]
noc_read_design
synth_design -top noc_fpga_demo_top -part $noc_part -mode out_of_context -generic DEPTH=4
read_xdc [file join $noc_root constraints clock_only.xdc]
opt_design
place_design
route_design
set noc_report_dir [file join $noc_reports route_demo_ooc]
source [file join $noc_root vivado reports.tcl]
noc_metadata route_demo_ooc $noc_report_dir
set checkpoint_dir [file join $noc_root build checkpoints];file mkdir $checkpoint_dir
write_checkpoint -force [file join $checkpoint_dir demo_ooc_routed.dcp]
puts "OOC DEMO ROUTE RETURNED. No pins, external delays, bitstream or hardware claim."
