# Execute only while XSim is open. These are actual design signals.
foreach signal {clk rst tv tr rv rr tx rx count req grant ov orr} {
    set objects [get_objects -quiet /tb_noc_2x2/$signal]
    if {[llength $objects]} {add_wave $objects}
}
# To inspect a full router, use Objects / dut / routers[0] / tile.
# Save File > Save Waveform Configuration into evidence/vivado after a real run.
