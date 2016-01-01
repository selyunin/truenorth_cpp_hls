#***************************************************************
# Author: Selyunin 
# Date : 31 December 2015
# Licence: BSDv2
# Device: Zybo
#***************************************************************
# This is the modified version of script generated by vivado
#***************************************************************

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To execute the script, run from Vivado Tcl console:
# source rocket_stl_demo2_script.tcl

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}

# CHANGE DESIGN NAME HERE
set design_name rocket_stl_bd

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name


set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

create_bd_design $design_name
current_bd_design $design_name



##################################################################
# DESIGN PROCs
##################################################################

# Hierarchical cell: neural_mon_0
proc create_hier_cell_neural_mon_0 { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_neural_mon_0() - Empty argument(s)!"
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk ap_clk
  create_bd_pin -dir I -from 0 -to 0 -type rst ap_rst
  create_bd_pin -dir I ap_start
  create_bd_pin -dir I -from 0 -to 0 detonation
  create_bd_pin -dir I -from 0 -to 0 -type data fire_en
  create_bd_pin -dir I -from 0 -to 0 -type data launch_en
  create_bd_pin -dir O -from 0 -to 0 -type data spike_V

  # Create instances
  set and_mon_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:and_mon:1.0 and_mon_0 ]
  set bounded_hist_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:bounded_hist:1.0 bounded_hist_0 ]
  set bounded_once_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:bounded_once:1.0 bounded_once_0 ]
  set edge_mon_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:edge_mon:1.0 edge_mon_0 ]
  set edge_mon_1 [ create_bd_cell -type ip -vlnv xilinx.com:hls:edge_mon:1.0 edge_mon_1 ]
  set impl_mon_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:impl_mon:1.0 impl_mon_0 ]
  set punc_once_4_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:punc_once_4:1.0 punc_once_4_0 ]
  set punc_once_5_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:punc_once_5:1.0 punc_once_5_0 ]
  set punc_once_5_1 [ create_bd_cell -type ip -vlnv xilinx.com:hls:punc_once_5:1.0 punc_once_5_1 ]
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_0

  # Create port connections
  connect_bd_net -net and_mon_0_spike_V [get_bd_pins and_mon_0/spike_V] [get_bd_pins bounded_once_0/indata_0_V]
  connect_bd_net -net ap_clk_1 [get_bd_pins ap_clk] [get_bd_pins and_mon_0/ap_clk] [get_bd_pins bounded_hist_0/ap_clk] [get_bd_pins bounded_once_0/ap_clk] [get_bd_pins edge_mon_0/ap_clk] [get_bd_pins edge_mon_1/ap_clk] [get_bd_pins impl_mon_0/ap_clk] [get_bd_pins punc_once_4_0/ap_clk] [get_bd_pins punc_once_5_0/ap_clk] [get_bd_pins punc_once_5_1/ap_clk]
  connect_bd_net -net ap_rst_1 [get_bd_pins ap_rst] [get_bd_pins and_mon_0/ap_rst] [get_bd_pins bounded_hist_0/ap_rst] [get_bd_pins bounded_once_0/ap_rst] [get_bd_pins edge_mon_0/ap_rst] [get_bd_pins edge_mon_1/ap_rst] [get_bd_pins impl_mon_0/ap_rst] [get_bd_pins punc_once_4_0/ap_rst] [get_bd_pins punc_once_5_0/ap_rst] [get_bd_pins punc_once_5_1/ap_rst]
  connect_bd_net -net ap_start_1 [get_bd_pins ap_start] [get_bd_pins and_mon_0/ap_start] [get_bd_pins bounded_hist_0/ap_start] [get_bd_pins bounded_once_0/ap_start] [get_bd_pins edge_mon_0/ap_start] [get_bd_pins edge_mon_1/ap_start] [get_bd_pins impl_mon_0/ap_start] [get_bd_pins punc_once_4_0/ap_start] [get_bd_pins punc_once_5_0/ap_start] [get_bd_pins punc_once_5_1/ap_start]
  connect_bd_net -net bounded_hist_0_spike_V [get_bd_pins and_mon_0/indata_1_V] [get_bd_pins bounded_hist_0/spike_V]
  connect_bd_net -net bounded_once_0_spike_V [get_bd_pins bounded_once_0/spike_V] [get_bd_pins impl_mon_0/indata_1_V]
  connect_bd_net -net detonation_1 [get_bd_pins detonation] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net edge_mon_0_spike_V [get_bd_pins edge_mon_0/spike_V] [get_bd_pins punc_once_5_0/indata_0_V]
  connect_bd_net -net edge_mon_1_spike_V [get_bd_pins edge_mon_1/spike_V] [get_bd_pins punc_once_5_1/indata_0_V]
  connect_bd_net -net fire_en_1 [get_bd_pins fire_en] [get_bd_pins edge_mon_1/indata_0_V]
  connect_bd_net -net impl_mon_0_spike_V [get_bd_pins spike_V] [get_bd_pins impl_mon_0/spike_V]
  connect_bd_net -net launch_en_1 [get_bd_pins launch_en] [get_bd_pins edge_mon_0/indata_0_V]
  connect_bd_net -net punc_once_4_0_spike_V [get_bd_pins impl_mon_0/indata_0_V] [get_bd_pins punc_once_4_0/spike_V]
  connect_bd_net -net punc_once_5_0_spike_V [get_bd_pins punc_once_4_0/indata_0_V] [get_bd_pins punc_once_5_0/spike_V]
  connect_bd_net -net punc_once_5_1_spike_V [get_bd_pins and_mon_0/indata_0_V] [get_bd_pins punc_once_5_1/spike_V]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins bounded_hist_0/indata_0_V] [get_bd_pins util_vector_logic_0/Res]
  
  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create interface ports

  # Create ports
  set clk_div [ create_bd_port -dir O clk_div ]
  set clk_i [ create_bd_port -dir I clk_i ]
  set detonation_en [ create_bd_port -dir O detonation_en ]
  set fire_en [ create_bd_port -dir O fire_en ]
  set launch_en_mon [ create_bd_port -dir O launch_en_mon ]
  set mon_o [ create_bd_port -dir O -from 0 -to 0 mon_o ]
  set mon_o_scope [ create_bd_port -dir O -from 0 -to 0 mon_o_scope ]
  set rst_n_i [ create_bd_port -dir I rst_n_i ]

  # Create instances
  set SR_ff_1 [ create_bd_cell -type ip -vlnv infineon:user:SR_ff:1.1 SR_ff_1 ]
  create_hier_cell_neural_mon_0 [current_bd_instance .] neural_mon_0

  set rocket_gen_loop_0 [ create_bd_cell -type ip -vlnv infineon:user:rocket_gen_loop:1.0 rocket_gen_loop_0 ]

  set uClkDiv_0 [ create_bd_cell -type ip -vlnv infineon.com:user:uClkDiv:1.0 uClkDiv_0 ]

  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_0

  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_1

  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list CONFIG.CONST_VAL {3} CONFIG.CONST_WIDTH {16}  ] $xlconstant_0

  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list CONFIG.CONST_VAL {7} CONFIG.CONST_WIDTH {16}  ] $xlconstant_1

  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list CONFIG.CONST_VAL {10} CONFIG.CONST_WIDTH {24}  ] $xlconstant_2

  connect_bd_net -net SR_ff_1_Q_o [get_bd_ports mon_o] [get_bd_pins SR_ff_1/Q_o]
  connect_bd_net -net clk_i_1 [get_bd_ports clk_i] [get_bd_pins uClkDiv_0/clk_i]
  connect_bd_net -net launch_en_1 [get_bd_ports launch_en_mon] [get_bd_pins SR_ff_1/Reset_i] [get_bd_pins neural_mon_0/launch_en] [get_bd_pins rocket_gen_loop_0/launch_en_o]
  connect_bd_net -net neural_mon_0_spike_V [get_bd_ports mon_o_scope] [get_bd_pins neural_mon_0/spike_V] [get_bd_pins util_vector_logic_1/Op1]
  connect_bd_net -net rocket_gen_0_fire_en_o [get_bd_ports fire_en] [get_bd_pins neural_mon_0/fire_en] [get_bd_pins rocket_gen_loop_0/fire_en_o]
  connect_bd_net -net rocket_gen_loop_0_detonation_o [get_bd_ports detonation_en] [get_bd_pins neural_mon_0/detonation] [get_bd_pins rocket_gen_loop_0/detonation_o]
  connect_bd_net -net rst_n_i_1 [get_bd_ports rst_n_i] [get_bd_pins SR_ff_1/sys_rst_n_i] [get_bd_pins neural_mon_0/ap_start] [get_bd_pins rocket_gen_loop_0/sys_rst_n_i] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net uClkDiv_0_clk_o [get_bd_ports clk_div] [get_bd_pins SR_ff_1/sys_clk_i] [get_bd_pins neural_mon_0/ap_clk] [get_bd_pins rocket_gen_loop_0/sys_clk_i] [get_bd_pins uClkDiv_0/clk_o]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins neural_mon_0/ap_rst] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins SR_ff_1/Set_i] [get_bd_pins util_vector_logic_1/Res]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins rocket_gen_loop_0/fire_en_time_i] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins rocket_gen_loop_0/detonation_en_time_i] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins uClkDiv_0/div_val_i] [get_bd_pins xlconstant_2/dout]

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################
create_root_design ""

# Added by selyunin
##################################################################
# MARK PINS FOR DEBUG
##################################################################
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {uClkDiv_0_clk_o }]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {neural_mon_0_spike_V }]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {launch_en_1 }]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {rocket_gen_0_fire_en_o }]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {rocket_gen_loop_0_detonation_o }]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {util_vector_logic_0_Res }]

set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {neural_mon_0/and_mon_0_spike_V}]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {neural_mon_0/bounded_once_0_spike_V}]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {neural_mon_0/launch_en_1}]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {neural_mon_0/fire_en_1}]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {neural_mon_0/ap_start_1}]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {neural_mon_0/impl_mon_0_spike_V}]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {neural_mon_0/punc_once_4_0_spike_V}]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {neural_mon_0/edge_mon_1_spike_V}]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {neural_mon_0/edge_mon_0_spike_V}]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {neural_mon_0/detonation_1}]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {neural_mon_0/punc_once_5_1_spike_V}]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {neural_mon_0/ap_rst_1}]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {neural_mon_0/bounded_hist_0_spike_V}]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {neural_mon_0/punc_once_5_0_spike_V}]
set_property HDL_ATTRIBUTE.MARK_DEBUG true [get_bd_nets {neural_mon_0/ap_clk_1}]

##################################################################
# GENERATE OUTPUT PRODUCTS
##################################################################
generate_target all [get_files [get_files ${design_name}.bd]]

##################################################################
# CREATE A DESIGN WRAPPER
##################################################################
set design_wrapper [make_wrapper -files [get_files [get_files ${design_name}.bd] ] -top ]
add_files -norecurse $design_wrapper
