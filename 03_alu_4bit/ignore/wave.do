onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_alu_4bit/dut/a
add wave -noupdate /tb_alu_4bit/dut/b
add wave -noupdate /tb_alu_4bit/dut/op
add wave -noupdate /tb_alu_4bit/dut/result
add wave -noupdate /tb_alu_4bit/dut/cout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {76826 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 244
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {3165 ps} {138484 ps}
