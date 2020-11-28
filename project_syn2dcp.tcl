open_project ./prj/floorplan_static.xpr
reset_run synth_1
launch_runs synth_1 
wait_on_run synth_1
open_run synth_1 -name synth_1
write_checkpoint -force floorplan_static.dcp

