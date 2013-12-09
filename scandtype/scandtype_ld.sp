** HSPICE file for scandtype_ld
**   - generated by ext2sp v4.1

** Include netlist file for scandtype_ld
.include scandtype_ld.spice

** Default 3.3V Power Supply
Vsupply Vdd GND 3.3V

** Specify input signals here
** e.g. for inputs A and B
VnClock nClock GND PWL( 0NS 3.3V  2NS  3.3V  2.25NS  0V  4NS  0V  4.25NS  3.3V 6NS  3.3V  6.25NS  0V  8NS  0V  8.25NS  3.3V 10NS 3.3V  10.25NS 0V  12NS 0V  12.25NS 3.3V 14NS 3.3V  14.25NS 0V  16NS 0V  16.25NS 3.3V 18NS 3.3V  18.25NS 0V  20NS 0V  20.25NS 3.3V 22NS 3.3V  22.25NS 0V  24NS 0V  24.25NS 3.3V)	


VnnReset nnReset GND PWL(0NS 0V  1NS 0V  1.25NS 3.3V  3NS 3.3V  3.25NS 0V 21NS 0V 21.25NS 3.3V)
VnD nD GND PWL(0NS 3.3V  9NS 3.3V  9.25NS 0V  13NS 0V  13.25NS 3.3V 17NS 3.3V 17.25NS 0V)
VnTest nTest GND PWL ( 0NS 3.3V ) 
VnSDI nSDI GND PWL ( 0NS 3.3V )
**   VB B GND PWL(0NS 0V  4NS 0V  4.25NS 3.3V  8NS 3.3V  8.25NS 0V)

** Default Simulation - Type, Resolution & Duration
.TRAN 10PS 26NS

.measure tran Clock_to_Q_rise TRIG v(Clock) VAL='3.3*0.5' TD=0NS RISE=3
+ TARG v(Q) VAL='3.3*0.5' TD=0NS RISE=1
.measure tran Clock_to_Q_fall TRIG v(Clock) VAL='3.3*0.5' TD=0NS RISE=4
+ TARG v(Q) VAL='3.3*0.5' TD=0NS FALL=1
.measure tran Clock_to_nQ_rise TRIG v(Clock) VAL='3.3*0.5' TD=0NS RISE=4
+ TARG v(nQ) VAL='3.3*0.5' TD=0NS RISE=1
.measure tran Clock_to_nQ_fall TRIG v(Clock) VAL='3.3*0.5' TD=0NS RISE=3
+ TARG v(nQ) VAL='3.3*0.5' TD=0NS FALL=1

.measure tran nReset_to_Q_fall TRIG v(nReset) VAL='3.3*0.5' TD=0NS FALL=2
+ TARG v(Q) VAL='3.3*0.5' TD=0NS FALL=2
.measure tran nReset_to_nQ_rise TRIG v(nReset) VAL='3.3*0.5' TD=0NS FALL=2
+ TARG v(nQ) VAL='3.3*0.5' TD=0NS RISE=2

** Specify ouput signals to measure here
** e.g. rise and fall delays for output Y
**   .measure tran fall_delay TRIG v(Y) VAL='3.3*0.9' TD=0NS FALL=1
**   + TARG v(Y) VAL='3.3*0.1' TD=0NS FALL=1
**   .measure tran rise_delay TRIG v(Y) VAL='3.3*0.1' TD=0NS RISE=1
**   + TARG v(Y) VAL='3.3*0.9' TD=0NS RISE=1

** Save results for display
.OPTIONS POST
** Avoid DC convergence in at unreasonable voltage
.OPTIONS GMINDC=1n

.END
