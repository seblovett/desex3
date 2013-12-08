** HSPICE file for mux2_ld
**   - generated by ext2sp v4.1

** Include netlist file for mux2_ld
.include mux2_ld.spice

** Default 3.3V Power Supply
Vsupply Vdd GND 3.3V

** Specify input signals here
** e.g. for inputs A and B
   VNS NS GND PWL(0NS 0V  10NS 0V  10.25NS 3.3V  20NS 3.3V  24NS 3.3V  24.24NS 0V  28NS 0V  28.25NS 3.3V  38NS 3.3V  38.25NS 0V  42NS 0V  42.25NS 3.3V)
   VNI1 NI1 GND PWL(0NS 3.3V  4NS 3.3V  4.25NS 0V  8NS 0V  8.25NS 3.3V  20NS 3.3V  20.25NS 0V  30NS 0V  30.25NS 3.3V)
   VNI0 NI0 GND PWL(0NS 3.3V  14NS 3.3V  14.25NS 0V  18NS 0V  18.24NS 3.3V  30NS 3.3V  34NS 3.3V  34.24NS 0V)

** Default Simulation - Type, Resolution & Duration
.TRAN 10PS 45NS

** Specify ouput signals to measure here
** e.g. rise and fall delays for output Y
   .measure tran I1_Rise_Propagation_Delay TRIG v(I1) VAL='3.3*0.5' TD=0NS RISE=1
   + TARG v(Y) VAL='3.3*0.5' TD=0NS RISE=1
   .measure tran I1_Fall_Propagation_Delay TRIG v(I1) VAL='3.3*0.5' TD=0NS FALL=1
   + TARG v(Y) VAL='3.3*0.5' TD=0NS FALL=1
   
   .measure tran I0_Rise_Propagation_Delay TRIG v(I0) VAL='3.3*0.5' TD=0NS RISE=1
   + TARG v(Y) VAL='3.3*0.5' TD=0NS RISE=2
   .measure tran I0_Fall_Propagation_Delay TRIG v(I0) VAL='3.3*0.5' TD=0NS FALL=1
   + TARG v(Y) VAL='3.3*0.5' TD=0NS FALL=2

   .measure tran S_Pass_I1_Rise_Propagation_Delay TRIG v(S) VAL='3.3*0.5' TD=0NS RISE=1
   + TARG v(Y) VAL='3.3*0.5' TD=0NS RISE=3
   .measure tran S_Pass_I0_Fall_Propagation_Delay TRIG v(S) VAL='3.3*0.5' TD=0NS FALL=2
   + TARG v(Y) VAL='3.3*0.5' TD=0NS FALL=3

   .measure tran S_Pass_I1_Fall_Propagation_Delay TRIG v(S) VAL='3.3*0.5' TD=0NS RISE=2
   + TARG v(Y) VAL='3.3*0.5' TD=0NS FALL=4
   .measure tran S_Pass_I0_Rise_Propagation_Delay TRIG v(S) VAL='3.3*0.5' TD=0NS FALL=3
   + TARG v(Y) VAL='3.3*0.5' TD=0NS RISE=5

** Save results for display
.OPTIONS POST
** Avoid DC convergence in at unreasonable voltage
.OPTIONS GMINDC=1n

.END
