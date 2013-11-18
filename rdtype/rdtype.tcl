
simvision { 
   # =========================================================================
   # Waveform Window
   # Open new Waveform window

   window new WaveWindow  -name  "rdtype-desex3"
   waveform  using  "rdtype-desex3"

   # Pe

   waveform add -signals rdtype_stim.Clk        
   waveform add -signals rdtype_stim.Rst
   waveform add -signals rdtype_stim.D
   waveform add -signals rdtype_stim.Q 
   waveform add -signals rdtype_stim.nQ
  


   # =========================================================================
   # Probe and run
   # All remaing signals   
  
     probe -create -shm rdtype -depth all
   
     run
   # =========================================================================
   
}
