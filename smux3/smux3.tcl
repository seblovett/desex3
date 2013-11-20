# SimVision command script smux3.tcl for smux3
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  smux3_stim.D
  smux3_stim.Load
  smux3_stim.Q
  smux3_stim.SDI
  smux3_stim.Test
  smux3_stim.M
}

# View Results
#
window new WaveWindow -name "Waves for magic cell smux3"
waveform add -using "Waves for magic cell smux3" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell smux3" -outfull

}

