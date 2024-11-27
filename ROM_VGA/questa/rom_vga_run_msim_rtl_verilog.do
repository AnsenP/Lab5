transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/FPGA_Laboratory/Lab5/ROM_VGA/RTL {C:/FPGA_Laboratory/Lab5/ROM_VGA/RTL/vga_pic.v}
vlog -vlog01compat -work work +incdir+C:/FPGA_Laboratory/Lab5/ROM_VGA/RTL {C:/FPGA_Laboratory/Lab5/ROM_VGA/RTL/rom_vga.v}
vlog -vlog01compat -work work +incdir+C:/FPGA_Laboratory/Lab5/ROM_VGA/RTL {C:/FPGA_Laboratory/Lab5/ROM_VGA/RTL/vga_ctrl.v}
vlog -vlog01compat -work work +incdir+C:/FPGA_Laboratory/Lab5/ROM_VGA/Quartus_prj/ip_core/clk_gen {C:/FPGA_Laboratory/Lab5/ROM_VGA/Quartus_prj/ip_core/clk_gen/clk_gen.v}
vlog -vlog01compat -work work +incdir+C:/FPGA_Laboratory/Lab5/ROM_VGA/Quartus_prj/ip_core/rom_pic {C:/FPGA_Laboratory/Lab5/ROM_VGA/Quartus_prj/ip_core/rom_pic/rom_pic.v}
vlog -vlog01compat -work work +incdir+C:/FPGA_Laboratory/Lab5/ROM_VGA/Quartus_prj/db {C:/FPGA_Laboratory/Lab5/ROM_VGA/Quartus_prj/db/clk_gen_altpll.v}

vlog -vlog01compat -work work +incdir+C:/FPGA_Laboratory/Lab5/ROM_VGA/Quartus_prj/../Sim {C:/FPGA_Laboratory/Lab5/ROM_VGA/Quartus_prj/../Sim/tb_rom_vga.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_rom_vga

add wave *
view structure
view signals
run 1 us
