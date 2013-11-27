# SimVision command script trisbuf.tcl for trisbuf
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  trisbuf_stim.A
  trisbuf_stim.Enable
  trisbuf_stim.Y
}

# View Results
#
window new WaveWindow -name "Waves for magic cell trisbuf"
waveform add -using "Waves for magic cell trisbuf" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell trisbuf" -outfull

}

