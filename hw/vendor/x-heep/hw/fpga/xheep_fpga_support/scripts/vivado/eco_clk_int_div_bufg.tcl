# Copyright 2026 X-HEEP contibutors
#
# File: eco_clk_int_div_bufg.tcl
#
# Insert BUFG cells on the even and odd clock inputs of clk_int_div's
# even/odd selection mux. This runs as a post-synthesis, pre-opt_design ECO.

proc eco_clk_int_div_require_one {objects message} {
  set count [llength $objects]
  if {$count != 1} {
    return -code error "$message; expected 1 object, found $count"
  }
  return [lindex $objects 0]
}

proc eco_clk_int_div_insert_bufg {mux pin_ref basename} {
  set mux_name [get_property NAME $mux]
  set mux_pin [eco_clk_int_div_require_one \
    [get_pins -quiet -of_objects $mux -filter "REF_PIN_NAME == $pin_ref"] \
    "Could not find $pin_ref on $mux_name"]
  set old_net [eco_clk_int_div_require_one \
    [get_nets -quiet -of_objects $mux_pin] \
    "Could not find net connected to $mux_name/$pin_ref"]

  set bufg_name "${basename}_BUFG"
  set new_net_name "${basename}_BUF"


  puts "INFO: Inserting $bufg_name before [get_property NAME $mux_pin]"
  puts "INFO:   source net: [get_property NAME $old_net]"

  create_cell -reference BUFG $bufg_name
  create_net $new_net_name

  set bufg [eco_clk_int_div_require_one [get_cells -quiet $bufg_name] \
    "Could not create $bufg_name"]
  set new_net [eco_clk_int_div_require_one [get_nets -quiet $new_net_name] \
    "Could not create $new_net_name"]
  set bufg_i [eco_clk_int_div_require_one \
    [get_pins -quiet -of_objects $bufg -filter {REF_PIN_NAME == I}] \
    "Could not find I pin on $bufg_name"]
  set bufg_o [eco_clk_int_div_require_one \
    [get_pins -quiet -of_objects $bufg -filter {REF_PIN_NAME == O}] \
    "Could not find O pin on $bufg_name"]

  disconnect_net -net $old_net -objects $mux_pin
  connect_net -hier -net $old_net -objects $bufg_i
  connect_net -hier -net $new_net -objects $bufg_o
  connect_net -hier -net $new_net -objects $mux_pin

  set_property DONT_TOUCH TRUE $bufg

  return [list $old_net $new_net $bufg]
}

set clk_divs [get_cells -quiet -hier -filter {REF_NAME == clk_int_div}]
if {[llength $clk_divs] == 0} {
  puts "WARNING: No clk_int_div instances found for BUFG ECO; skipping"
  return
}

set patched_count 0
set div_idx 0

foreach clk_div $clk_divs {
  set clk_div_name [get_property NAME $clk_div]
  set muxes [get_cells -quiet -hier \
    -filter "NAME =~ ${clk_div_name}/i_clk_mux/xilinx_i_clk_mux2_i/i_BUFGMUX && REF_NAME =~ BUFG*"]

  if {[llength $muxes] == 0} {
    puts "WARNING: No even/odd BUFG mux found under $clk_div_name; skipping"
    incr div_idx
    continue
  } elseif {[llength $muxes] > 1} {
    puts "WARNING: Expected one even/odd BUFG mux under $clk_div_name, found [llength $muxes]"
  }

  set mux [lindex $muxes 0]
  puts "INFO: Applying clk_int_div BUFG ECO to [get_property NAME $mux]"

  set basename "ECO_CLK_INT_DIV_${div_idx}_EVEN"
  eco_clk_int_div_insert_bufg $mux I0 $basename

  set basename "ECO_CLK_INT_DIV_${div_idx}_ODD"
  eco_clk_int_div_insert_bufg $mux I1 $basename

  incr patched_count
  incr div_idx
}

# if {$patched_count == 0} {
#   return -code error "No clk_int_div even/odd muxes were patched"
# }

puts "INFO: Inserted BUFG ECO on $patched_count clk_int_div instance(s)"
