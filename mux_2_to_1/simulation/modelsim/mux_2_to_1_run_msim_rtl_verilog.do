transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Quartus\ er\ kaj\ kam/mux_2_to_1 {D:/Quartus er kaj kam/mux_2_to_1/mux_2_to_1.v}

