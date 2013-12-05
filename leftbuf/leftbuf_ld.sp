** HSPICE file for leftbuf_ld
**   - generated by ext2sp v4.1

** Include netlist file for leftbuf_ld
.include leftbuf_ld.spice

** Default 3.3V Power Supply
Vsupply Vdd GND 3.3V

** Specify input signals here
** e.g. for inputs A and B
VnClock  nClock  GND PWL(0NS 3.3V  2NS 3.3V  2.25NS 0V  6NS  0V  6.25NS  3.3V)
VnTest   nTest   GND PWL(0NS 3.3V  4NS 3.3V  4.25NS 0V  8NS  0V  8.25NS  3.3V)
VnnReset nnReset GND PWL(0NS 3.3V  6NS 3.3V  6.25NS 0V  10NS 0V  10.25NS 3.3V)
VnnSDO   nnSDO   GND PWL(0NS 3.3V  8NS 3.3V  8.25NS 0V  12NS 0V  12.25NS 3.3V)

** Default Simulation - Type, Resolution & Duration
.TRAN 10PS 15NS

** Specify ouput signals to measure here
** e.g. rise and fall delays for output Y
.measure tran clock_rise_prop_delay 
+ TRIG v(Clock)    VAL='3.3*0.5' TD=0NS RISE=1
+ TARG v(ClockOut) VAL='3.3*0.5' TD=0NS RISE=1

.measure tran clock_fall_prop_delay
+ TRIG v(Clock)    VAL='3.3*0.5' TD=0NS FALL=1
+ TARG v(ClockOut) VAL='3.3*0.5' TD=0NS FALL=1

.measure tran test_rise_prop_delay 
+ TRIG v(Test)    VAL='3.3*0.5' TD=0NS RISE=1
+ TARG v(TestOut) VAL='3.3*0.5' TD=0NS RISE=1

.measure tran test_fall_prop_delay
+ TRIG v(Test)    VAL='3.3*0.5' TD=0NS FALL=1
+ TARG v(TestOut) VAL='3.3*0.5' TD=0NS FALL=1

.measure tran nreset_rise_prop_delay 
+ TRIG v(nReset)    VAL='3.3*0.5' TD=0NS RISE=1
+ TARG v(nResetOut) VAL='3.3*0.5' TD=0NS RISE=1

.measure tran nreset_fall_prop_delay
+ TRIG v(nReset)    VAL='3.3*0.5' TD=0NS FALL=1
+ TARG v(nResetOut) VAL='3.3*0.5' TD=0NS FALL=1

.measure tran sdo_rise_prop_delay 
+ TRIG v(nSDO)    VAL='3.3*0.5' TD=0NS RISE=1
+ TARG v(SDO)     VAL='3.3*0.5' TD=0NS FALL=1

.measure tran sdo_fall_prop_delay
+ TRIG v(nSDO)    VAL='3.3*0.5' TD=0NS FALL=1
+ TARG v(SDO)     VAL='3.3*0.5' TD=0NS RISE=1
**   .measure tran rise_delay TRIG v(Y) VAL='3.3*0.1' TD=0NS RISE=1
**   + TARG v(Y) VAL='3.3*0.9' TD=0NS RISE=1

** Save results for display
.OPTIONS POST
** Avoid DC convergence in at unreasonable voltage
.OPTIONS GMINDC=1n

.END
