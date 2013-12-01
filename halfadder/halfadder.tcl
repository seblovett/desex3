# SimVision command script halfadder.tcl for halfadder
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  halfadder_stim.A
  halfadder_stim.B
  halfadder_stim.C
  halfadder_stim.S
}

# View Results
#
window new WaveWindow -name "Waves for magic cell halfadder"
waveform add -using "Waves for magic cell halfadder" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell halfadder" -outfull

}

