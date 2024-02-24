
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Nexy2_sin_filtr -dir "C:/Xilinx/Project/laba_spartan3e/Nexy2_sin_filtr/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "top_modul.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {spi_master.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {filter.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ADC_priem.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {top_modul.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top top_modul $srcset
add_files [list {top_modul.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
