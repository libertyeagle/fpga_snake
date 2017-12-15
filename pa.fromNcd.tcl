
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name fpga_snake -dir "C:/FPGA/fpga_snake/planAhead_run_1" -part xc6slx16csg324-3
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "C:/FPGA/fpga_snake/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/FPGA/fpga_snake} }
set_property target_constrs_file "snake.ucf" [current_fileset -constrset]
add_files [list {snake.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "C:/FPGA/fpga_snake/top.ncd"
if {[catch {read_twx -name results_1 -file "C:/FPGA/fpga_snake/top.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"C:/FPGA/fpga_snake/top.twx\": $eInfo"
}
