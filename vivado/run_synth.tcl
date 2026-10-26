# Non-project OOC flow: logical core interfaces are not bonded package pins.
source [file join [file dirname [info script]] common.tcl]
noc_read_design
synth_design -top noc_2x2_core -part $noc_part -mode out_of_context -generic DEPTH=4
read_xdc [file join $noc_root constraints clock_only.xdc]
if {[get_property PART [current_design]] ne $noc_part} {error "Synthesized part mismatch"}
set noc_report_dir [file join $noc_reports synthesis_ooc]
source [file join $noc_root vivado reports.tcl]
noc_metadata synthesis_ooc $noc_report_dir
set checkpoint_dir [file join $noc_root build checkpoints];file mkdir $checkpoint_dir
write_checkpoint -force [file join $checkpoint_dir core_synth.dcp]
puts "OOC CORE SYNTHESIS RETURNED. Review warnings, inference, DRC and timing constraints."
