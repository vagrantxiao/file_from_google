set_param general.maxThreads  8
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY XPM_FIFO} [current_project]
add_files  -norecurse ./pe_empty1010.v
set logFileId [open ./runLog_pe_empty1010.log "a"]
set start_time [clock seconds]
set_param general.maxThreads  8 
synth_design -top pe_empty1010 -part xczu9eg-ffvb1156-2-e -mode out_of_context
write_checkpoint -force netlist.dcp
set end_time [clock seconds]
set total_seconds [expr $end_time - $start_time]
puts $logFileId "syn: $total_seconds seconds"
report_utilization -hierarchical > utilization.rpt

