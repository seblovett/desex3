# SimVision command script rdtype.tcl for rdtype
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  rdtype_stim.Clk
  rdtype_stim.D
  rdtype_stim.nRst
  rdtype_stim.nQ
  rdtype_stim.Q
  rdtype_stim.W
  rdtype_stim.X
  rdtype_stim.Y
  rdtype_stim.Z
}

# View Results
#
window new WaveWindow -name "Waves for magic cell rdtype"
waveform add -using "Waves for magic cell rdtype" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell rdtype" -outfull

}

