transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Quartus\ er\ kaj\ kam/assignment2/ha_2to1 {D:/Quartus er kaj kam/assignment2/ha_2to1/ha_2to1.v}

