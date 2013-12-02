** HSPICE file for fulladder_ld
**   - generated by ext2sp v4.1

** Include netlist file for fulladder_ld
.include fulladder_ld2.spice

** Default 3.3V Power Supply
Vsupply Vdd GND 3.3V

** Specify input signals here
** e.g. for inputs A and B
VnA nA GND PWL(0NS 3.3V  3.75NS 3.3V  4NS 0V  7.75NS 0V  8NS 3.3V  11.75NS 3.3V  12NS  0V  15.75NS 0V  16NS 3.3V  19.75NS 3.3V  20NS 0V  23.75NS 0V  24NS  3.3V  27.75NS 3.3V  28NS  0V  31.75NS 0V  32NS 3.3V  35.75NS 3.3V  36NS 0V)
VnB nB GND PWL(0NS 3.3V  8.25NS 3.3V  8.5NS 0V  16.25NS 0V  16.5NS 3.3V  24.25NS 3.3V  24.5NS  0V  32.25NS 0V  32.5NS 3.3V)
VnCin nCin GND PWL(0NS 3.3V  16.75NS 3.3V  17.25NS 0V  32.75NS 0V  33.25NS 3.3V  37NS 3.3V  37.50NS 0V  44.50NS 0V  44.75NS 3.3V)

** Default Simulation - Type, Resolution & Duration
.TRAN 10PS 50NS

** Specify ouput signals to measure here
.measure tran prop_delay_AS_1 TRIG v(A) VAL='3.3*0.5' TD=0NS RISE=1 TARG v(S) VAL='3.3*0.5' TD=0NS RISE=1
.measure tran prop_delay_BS_1 TRIG v(B) VAL='3.3*0.5' TD=0NS RISE=1 TARG v(S) VAL='3.3*0.5' TD=0NS RISE=2
.measure tran prop_delay_CinS_1 TRIG v(Cin) VAL='3.3*0.5' TD=0NS RISE=1 TARG v(S) VAL='3.3*0.5' TD=0NS RISE=4
.measure tran prop_delay_AS_0 TRIG v(A) VAL='3.3*0.5' TD=0NS FALL=1 TARG v(S) VAL='3.3*0.5' TD=0NS FALL=1
.measure tran prop_delay_BS_0 TRIG v(B) VAL='3.3*0.5' TD=0NS FALL=1 TARG v(S) VAL='3.3*0.5' TD=0NS FALL=3
.measure tran prop_delay_CinS_0 TRIG v(Cin) VAL='3.3*0.5' TD=0NS FALL=1 TARG v(S) VAL='3.3*0.5' TD=0NS FALL=7

.measure tran prop_delay_ACout_1 TRIG v(A) VAL='3.3*0.5' TD=0NS RISE=2 TARG v(Cout) VAL='3.3*0.5' TD=0NS RISE=1
.measure tran prop_delay_BCout_1 TRIG v(B) VAL='3.3*0.5' TD=0NS RISE=2 TARG v(Cout) VAL='3.3*0.5' TD=0NS RISE=3
.measure tran prop_delay_CinCout_1 TRIG v(Cin) VAL='3.3*0.5' TD=0NS RISE=2 TARG v(Cout) VAL='3.3*0.5' TD=0NS RISE=4
.measure tran prop_delay_ACout_0 TRIG v(A) VAL='3.3*0.5' TD=0NS FALL=2 TARG v(Cout) VAL='3.3*0.5' TD=0NS FALL=1
.measure tran prop_delay_BCout_0 TRIG v(B) VAL='3.3*0.5' TD=0NS FALL=2 TARG v(Cout) VAL='3.3*0.5' TD=0NS FALL=3
.measure tran prop_delay_CinCout_0 TRIG v(Cin) VAL='3.3*0.5' TD=0NS FALL=2 TARG v(Cout) VAL='3.3*0.5' TD=0NS FALL=4

** Save results for display
.OPTIONS POST
** Avoid DC convergence in at unreasonable voltage
.OPTIONS GMINDC=1n

.END