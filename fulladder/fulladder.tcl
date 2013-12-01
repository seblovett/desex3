# SimVision command script fulladder.tcl for fulladder
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  fulladder_stim.A
  fulladder_stim.B
  fulladder_stim.Cin
  fulladder_stim.Cout
  fulladder_stim.S
}

# View Results
#
window new WaveWindow -name "Waves for magic cell fulladder"
waveform add -using "Waves for magic cell fulladder" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell fulladder" -outfull

}

