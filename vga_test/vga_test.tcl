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

# Quartus Prime Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition
# File: E:\FPGA\VGA\vga_test\vga_test.tcl
# Generated on: Tue Jun 07 21:47:56 2022

package require ::quartus::project

set_location_assignment PIN_E1 -to clk
set_location_assignment PIN_M15 -to key1
set_location_assignment PIN_C3 -to vga_out_b[0]
set_location_assignment PIN_D4 -to vga_out_b[1]
set_location_assignment PIN_D3 -to vga_out_b[2]
set_location_assignment PIN_E5 -to vga_out_b[3]
set_location_assignment PIN_F6 -to vga_out_b[4]
set_location_assignment PIN_F5 -to vga_out_g[0]
set_location_assignment PIN_G5 -to vga_out_g[1]
set_location_assignment PIN_F7 -to vga_out_g[2]
set_location_assignment PIN_K8 -to vga_out_g[3]
set_location_assignment PIN_L8 -to vga_out_g[4]
set_location_assignment PIN_J6 -to vga_out_g[5]
set_location_assignment PIN_K6 -to vga_out_r[0]
set_location_assignment PIN_K5 -to vga_out_r[1]
set_location_assignment PIN_L7 -to vga_out_r[2]
set_location_assignment PIN_L3 -to vga_out_r[3]
set_location_assignment PIN_L4 -to vga_out_r[4]
set_location_assignment PIN_N3 -to vga_out_vs
set_location_assignment PIN_L6 -to vga_out_hs
set_location_assignment PIN_N13 -to rst_n
