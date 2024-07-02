onerror {exit -code 1}
vlib work
vcom -work work pr1_er2.vho
vcom -work work Waveform.vwf.vht
vsim -novopt -c -t 1ps -L fiftyfivenm -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.pr1_er2_vhd_vec_tst
vcd file -direction pr1_er2.msim.vcd
vcd add -internal pr1_er2_vhd_vec_tst/*
vcd add -internal pr1_er2_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
