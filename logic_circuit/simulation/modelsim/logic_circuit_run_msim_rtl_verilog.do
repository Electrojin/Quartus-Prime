transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Quartus\ er\ kaj\ kam/logic_circuit {D:/Quartus er kaj kam/logic_circuit/logic_circuit.v}

