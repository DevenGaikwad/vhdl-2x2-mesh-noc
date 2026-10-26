# Shared setup for Vivado 2026.1; paths are relative to this script, not a machine.
set noc_root [file normalize [file join [file dirname [info script]] ..]]
set noc_part xc7s15cpga196-2
set noc_reports [file join $noc_root evidence vivado]
file mkdir $noc_reports
proc noc_check_tool {} {
    global noc_part
    puts "TOOL: [version -short]"
    if {![string match "2026.1*" [version -short]]} {
        puts "WARNING: reference workflow targets Vivado 2026.1; record this other build."
    }
    if {[llength [get_parts -quiet $noc_part]] != 1} {
        error "Exact part $noc_part unavailable. Install Spartan-7 support; do not substitute a device."
    }
    puts "EXACT PART AVAILABLE: $noc_part"
}
proc noc_rtl_files {} {
    global noc_root
    set f [open [file join $noc_root rtl compile_order.txt] r]
    set lines [split [string trim [read $f]] "\n"];close $f
    set result {}
    foreach line $lines {lappend result [file normalize [file join $noc_root [string trim $line]]]}
    return $result
}
proc noc_read_design {} {
    global noc_root
    noc_check_tool
    foreach f [noc_rtl_files] {read_vhdl -vhdl2008 $f}
}
proc noc_project {} {
    global noc_root noc_part
    noc_check_tool
    set dir [file join $noc_root build vivado NoC_2x2]
    if {[info exists ::env(NOC_PROJECT_DIR)] && $::env(NOC_PROJECT_DIR) ne ""} {
        set dir [file normalize $::env(NOC_PROJECT_DIR)]
    }
    file mkdir $dir
    set xpr [file join $dir NoC_2x2.xpr]
    if {[file exists $xpr]} {
        open_project $xpr
        if {[get_property PART [current_project]] ne $noc_part} {error "Existing project has a different part"}
    } else {create_project NoC_2x2 $dir -part $noc_part}
    set_property target_language VHDL [current_project]
    set_property simulator_language VHDL [current_project]
    set_property target_simulator XSim [current_project]
    foreach f [noc_rtl_files] {
        if {[llength [get_files -quiet $f]]==0} {add_files -fileset sources_1 -norecurse $f}
        set_property file_type {VHDL 2008} [get_files $f]
    }
    foreach f [lsort [glob [file join $noc_root tb *.vhd]]] {
        if {[llength [get_files -quiet $f]]==0} {add_files -fileset sim_1 -norecurse $f}
        set_property file_type {VHDL 2008} [get_files $f]
        set_property used_in_synthesis false [get_files $f]
    }
    set xdc [file join $noc_root constraints clock_only.xdc]
    if {[llength [get_files -quiet $xdc]]==0} {add_files -fileset constrs_1 -norecurse $xdc}
    set_property top noc_2x2_core [get_filesets sources_1]
    set_property top tb_noc_2x2 [get_filesets sim_1]
    set_property generic {DEPTH=4 SCENARIO=0 TRACE_LEVEL=2} [get_filesets sim_1]
    set_property xsim.simulate.runtime {0ns} [get_filesets sim_1]
    update_compile_order -fileset sources_1
    update_compile_order -fileset sim_1
    puts "PROJECT: $xpr PART: [get_property PART [current_project]]"
    return $xpr
}
proc noc_metadata {stage dir} {
    global noc_part
    set f [open [file join $dir metadata.json] w]
    puts $f [format { {"schema_version":1,"part":"%s","tool":"Vivado %s","stage":"%s","target_period_ns":10.0,"board_verified":false} } $noc_part [version -short] $stage]
    close $f
}
