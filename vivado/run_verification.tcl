source [file join [file dirname [info script]] common.tcl]
noc_project
set jobs {}
foreach d {1 3 4 8} {lappend jobs [list fifo-$d tb_fifo_buffer [list DEPTH=$d]]}
lappend jobs [list routing tb_xy_route_unit {}] [list arbitration tb_rr_arbiter {}]
foreach r {0 1 2 3} {lappend jobs [list router-$r tb_router [list CURRENT=$r]]}
lappend jobs [list demo tb_demo {}]
foreach d {4 2 8} {
    set dir [file join $noc_reports xsim directed-d$d];file mkdir $dir
    set csv [string map {\\ /} [file join $dir trace.csv]]
    lappend jobs [list mesh-$d tb_noc_2x2 [list DEPTH=$d SCENARIO=0 RUN_ID="xsim-directed-d$d" TRACE_FILE="$csv" TRACE_LEVEL=2]]
}
foreach job $jobs {
    lassign $job name top generics
    puts "BEGIN VERIFICATION: $name TOP: $top"
    set_property top $top [get_filesets sim_1]
    set_property generic $generics [get_filesets sim_1]
    update_compile_order -fileset sim_1
    launch_simulation -simset sim_1 -mode behavioral
    run all
    # finish stops the testbench. No automatic PASS claim is made by this script.
    set simdir [file join [get_property DIRECTORY [current_project]] NoC_2x2.sim sim_1 behav xsim]
    set logfile ""
    set newest -1
    foreach candidate [list [file join $simdir simulate.log] [file join $simdir xsim.log]] {
        if {[file exists $candidate] && [file mtime $candidate] > $newest} {
            set logfile $candidate
            set newest [file mtime $candidate]
        }
    }
    if {$logfile eq ""} {error "Actual XSim log missing in $simdir. Save GUI log and inspect before continuing."}
    set f [open $logfile r];set body [read $f];close $f
    set outdir [file join $noc_reports xsim];file mkdir $outdir
    file copy -force $logfile [file join $outdir $name.log]
    if {![string match "*PASS $top*" $body]} {error "No actual PASS marker for $name; inspect saved log"}
    if {[regexp -nocase {severity failure|assertion failure|ERROR:} $body]} {error "Failure text in $name log"}
    close_sim
    puts "LOG CHECK PASSED: $name"
}
set_property top tb_noc_2x2 [get_filesets sim_1]
set_property generic {DEPTH=4 SCENARIO=0 TRACE_LEVEL=2} [get_filesets sim_1]
puts "All 14 actual XSim logs contained PASS. Preserve these logs before any claim."
