** HSPICE file for nand4_ld
**   - generated by ext2sp v4.1

** Include netlist file for nand4_ld
.include nand4_ld.spice

** Default 3.3V Power Supply
Vsupply Vdd GND 3.3V

** Specify input signals here
** e.g. for inputs A and B
   VNA NA GND PWL(0NS 0V  2NS 0V  2.25NS 3.3V  6NS 3.3V  6.25NS 0V)
   VNB NB GND PWL(0NS 0V  10NS 0V  10.25NS 3.3V  14NS 3.3V  14.25NS 0V)
   VNC NC GND PWL(0NS 0V  20NS 0V  20.25NS 3.3V  24NS 3.3V  24.25NS 0V)
   VND ND GND PWL(0NS 0V  30NS 0V  30.25NS 3.3V  34NS 3.3V  34.25NS 0V)

** Default Simulation - Type, Resolution & Duration
.TRAN 10PS 40NS
co
** Specify ouput signals to measure here
** e.g. rise and fall delays for output Y
   .measure tran x_A_Rise_Propagation_Delay TRIG v(A) VAL='3.3*0.5' TD=0NS FALL=1
   + TARG v(Y) VAL='3.3*0.5' TD=0NS RISE=1
   .measure tran x_A_Fall_Propagation_Delay TRIG v(A) VAL='3.3*0.5' TD=0NS RISE=1
   + TARG v(Y) VAL='3.3*0.5' TD=0NS FALL=1
   
   .measure tran x_B_Rise_Propagation_Delay TRIG v(B) VAL='3.3*0.5' TD=0NS FALL=1
   + TARG v(Y) VAL='3.3*0.5' TD=0NS RISE=2
   .measure tran x_B_Fall_Propagation_Delay TRIG v(B) VAL='3.3*0.5' TD=0NS RISE=1
   + TARG v(Y) VAL='3.3*0.5' TD=0NS FALL=2
   
   .measure tran x_C_Rise_Propagation_Delay TRIG v(C) VAL='3.3*0.5' TD=0NS FALL=1
   + TARG v(Y) VAL='3.3*0.5' TD=0NS RISE=3
   .measure tran x_C_Fall_Propagation_Delay TRIG v(C) VAL='3.3*0.5' TD=0NS RISE=1
   + TARG v(Y) VAL='3.3*0.5' TD=0NS FALL=3


   .measure tran x_D_Rise_Propagation_Delay TRIG v(D) VAL='3.3*0.5' TD=0NS FALL=1
   + TARG v(Y) VAL='3.3*0.5' TD=0NS RISE=4
   .measure tran x_D_Fall_Propagation_Delay TRIG v(D) VAL='3.3*0.5' TD=0NS RISE=1
   + TARG v(Y) VAL='3.3*0.5' TD=0NS FALL=4
   
   .measure A_to_Y PARAM = '(x_A_Fall_Propagation_Delay + x_A_Rise_Propagation_Delay)/2'
   .measure B_to_Y PARAM = '(x_B_Fall_Propagation_Delay + x_B_Rise_Propagation_Delay)/2'
   .measure C_to_Y PARAM = '(x_C_Fall_Propagation_Delay + x_C_Rise_Propagation_Delay)/2'
   .measure D_to_Y PARAM = '(x_D_Fall_Propagation_Delay + x_D_Rise_Propagation_Delay)/2'
   
** Save results for display
.OPTIONS POST
** Avoid DC convergence in at unreasonable voltage
.OPTIONS GMINDC=1n

.END
