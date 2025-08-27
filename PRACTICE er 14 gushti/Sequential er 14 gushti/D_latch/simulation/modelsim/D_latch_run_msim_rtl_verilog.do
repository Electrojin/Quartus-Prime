transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Quartus\ er\ kaj\ kam/PRACTICE\ er\ 14\ gushti/Sequential\ er\ 14\ gushti/D_latch {D:/Quartus er kaj kam/PRACTICE er 14 gushti/Sequential er 14 gushti/D_latch/D_latch.v}

