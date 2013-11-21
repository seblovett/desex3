# SimVision command script buffer.tcl for buffer
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  buffer_stim.A
  buffer_stim.Y
}

# View Results
#
window new WaveWindow -name "Waves for magic cell buffer"
waveform add -using "Waves for magic cell buffer" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell buffer" -outfull

}

