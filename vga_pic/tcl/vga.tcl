# Copyright (C) 2018  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details.

# Quartus Prime Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition
# File: E:\1\code\rgb\tcl\rgb.tcl
# Generated on: Wed Jun 01 20:33:44 2022

package require ::quartus::project

set_location_assignment PIN_E12 -to rgb_r[0]
set_location_assignment PIN_E11 -to rgb_r[1]
set_location_assignment PIN_D10 -to rgb_r[2]
set_location_assignment PIN_F12 -to rgb_r[3]
set_location_assignment PIN_G10 -to rgb_r[4]
set_location_assignment PIN_J12 -to rgb_r[5]
set_location_assignment PIN_H8 -to rgb_r[6]
set_location_assignment PIN_H10 -to rgb_r[7]
set_location_assignment PIN_G8 -to rgb_g[0]
set_location_assignment PIN_G11 -to rgb_g[1]
set_location_assignment PIN_F8 -to rgb_g[2]
set_location_assignment PIN_H12 -to rgb_g[3]
set_location_assignment PIN_C8 -to rgb_g[4]
set_location_assignment PIN_B8 -to rgb_g[5]
set_location_assignment PIN_F10 -to rgb_g[6]
set_location_assignment PIN_C9 -to rgb_g[7]
set_location_assignment PIN_B10 -to rgb_b[0]
set_location_assignment PIN_A10 -to rgb_b[1]
set_location_assignment PIN_C11 -to rgb_b[2]
set_location_assignment PIN_B11 -to rgb_b[3]
set_location_assignment PIN_A11 -to rgb_b[4]
set_location_assignment PIN_C12 -to rgb_b[5]
set_location_assignment PIN_D11 -to rgb_b[6]
set_location_assignment PIN_D12 -to rgb_b[7]
set_location_assignment PIN_A12 -to vga_clk
set_location_assignment PIN_Y2 -to clk
set_location_assignment PIN_G13 -to h_sync
set_location_assignment PIN_C13 -to v_sync
set_location_assignment PIN_M23 -to rst_n
