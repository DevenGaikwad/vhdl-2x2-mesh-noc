# Requires an open synthesized or routed design and a defined noc_report_dir.
file mkdir $noc_report_dir
report_utilization -file [file join $noc_report_dir utilization.rpt]
report_utilization -hierarchical -file [file join $noc_report_dir utilization_hierarchical.rpt]
check_timing -verbose -file [file join $noc_report_dir check_timing.rpt]
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -file [file join $noc_report_dir timing_summary.rpt]
report_timing -max_paths 10 -sort_by group -file [file join $noc_report_dir critical_paths.rpt]
report_drc -file [file join $noc_report_dir drc.rpt]
puts "REPORTS SAVED: $noc_report_dir"
