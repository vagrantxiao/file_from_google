set logFileId [open ./runLog_impl_big_static_32.log "w"]

#####################
## read_checkpoint ##
#####################
set start_time [clock seconds]
open_checkpoint ./floorplan_static.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X2Y0/inst ./dummy_repo/X2Y0/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X2Y1/inst ./dummy_repo/X2Y1/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X2Y2/inst ./dummy_repo/X2Y2/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X3Y0/inst ./dummy_repo/X3Y0/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X3Y1/inst ./dummy_repo/X3Y1/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X3Y2/inst ./dummy_repo/X3Y2/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X0Y3/inst ./dummy_repo/X0Y3/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X0Y4/inst ./dummy_repo/X0Y4/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X0Y5/inst ./dummy_repo/X0Y5/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X0Y6/inst ./dummy_repo/X0Y6/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X1Y3/inst ./dummy_repo/X1Y3/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X1Y4/inst ./dummy_repo/X1Y4/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X1Y5/inst ./dummy_repo/X1Y5/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X1Y6/inst ./dummy_repo/X1Y6/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X2Y3/inst ./dummy_repo/X2Y3/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X2Y4/inst ./dummy_repo/X2Y4/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X2Y5/inst ./dummy_repo/X2Y5/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X2Y6/inst ./dummy_repo/X2Y6/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X3Y3/inst ./dummy_repo/X3Y3/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X3Y4/inst ./dummy_repo/X3Y4/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X3Y5/inst ./dummy_repo/X3Y5/netlist.dcp
read_checkpoint -cell floorplan_static_i/pe_empty_X3Y6/inst ./dummy_repo/X3Y6/netlist.dcp
set end_time [clock seconds]
set total_seconds [expr $end_time - $start_time]
puts $logFileId "read_checkpoint: $total_seconds seconds"

####################
## implementation ##
####################
set start_time [clock seconds]
opt_design
set end_time [clock seconds]
set total_seconds [expr $end_time - $start_time]
puts $logFileId "opt: $total_seconds seconds"
set start_time [clock seconds]
place_design
set end_time [clock seconds]
set total_seconds [expr $end_time - $start_time]
puts $logFileId "place: $total_seconds seconds"
# write_hwdef -force pr_test_wrapper.hwdef
write_checkpoint -force init_placed_32.dcp
set start_time [clock seconds]
route_design
set end_time [clock seconds]
set total_seconds [expr $end_time - $start_time]
puts $logFileId "route: $total_seconds seconds"
write_checkpoint -force init_routed_32.dcp
set_param bitstream.enablePR 2341
write_bitstream -force -no_partial_bitfile  ./main.bit
#############################################
## create static design with no bft pblock ##
#############################################

set start_time [clock seconds]
update_design -cell floorplan_static_i/axi_leaf -black_box
update_design -cell floorplan_static_i/pe_empty_X2Y0/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X2Y1/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X2Y2/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X3Y0/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X3Y1/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X3Y2/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X0Y3/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X0Y4/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X0Y5/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X0Y6/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X1Y3/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X1Y4/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X1Y5/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X1Y6/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X2Y3/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X2Y4/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X2Y5/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X2Y6/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X3Y3/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X3Y4/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X3Y5/inst -black_box
update_design -cell floorplan_static_i/pe_empty_X3Y6/inst -black_box
#############################################
## Only after empty all modules out, can   ##
## you add -buffer_ports                   ##
#############################################
update_design -cell floorplan_static_i/axi_leaf -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X2Y0/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X2Y1/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X2Y2/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X3Y0/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X3Y1/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X3Y2/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X0Y3/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X0Y4/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X0Y5/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X0Y6/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X1Y3/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X1Y4/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X1Y5/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X1Y6/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X2Y3/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X2Y4/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X2Y5/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X2Y6/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X3Y3/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X3Y4/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X3Y5/inst -buffer_ports
update_design -cell floorplan_static_i/pe_empty_X3Y6/inst -buffer_ports
lock_design -level routing
write_checkpoint -force big_static_routed_32.dcp
close_design
set end_time [clock seconds]
set total_seconds [expr $end_time - $start_time]
puts $logFileId "update, black_box: $total_seconds seconds"
# set start_time [clock seconds]
# set end_time [clock seconds]
# set total_seconds [expr $end_time - $start_time]
# puts $logFileId "write bitstream: $total_seconds seconds"
