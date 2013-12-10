u** HSPICE file for trisbuf_ld
**   - generated by ext2sp v4.1

** Include netlist file for trisbuf_ld
.include trisbuf_ld.spice

** Default 3.3V Power Supply
Vsupply Vdd GND 3.3V

** Specify input signals here
** e.g. for inputs A and B
   VA NA GND PWL(
      +0NS        0V  
      +2NS        0V
      +2.25NS     3.3V
      +6NS        3.3V  
      +6.25NS     0V
      +10NS       0V
   +)

   VB NEnable GND PWL(
      +0NS        0V  
      +10NS        0V
   +)

** Default Simulation - Type, Resolution & Duration
.TRAN 10PS 10NS

** Specify ouput signals to measure here
** e.g. rise and fall delays for output Y
**   .measure tran fall_delay TRIG v(Y) VAL='3.3*0.9' TD=0NS FALL=1
**   + TARG v(Y) VAL='3.3*0.1' TD=0NS FALL=1
**   .measure tran rise_delay TRIG v(Y) VAL='3.3*0.1' TD=0NS RISE=1
**   + TARG v(Y) VAL='3.3*0.9' TD=0NS RISE=1

   .measure tran x_prop_delay_a_1
      +TRIG v(a) VAL='3.3*0.5' TD=0NS FALL=1
      +TARG v(y) VAL='3.3*0.5' TD=0NS FALL=1
   .measure tran x_prop_delay_a_2
      +TRIG v(a) VAL='3.3*0.5' TD=0NS RISE=1
      +TARG v(y) VAL='3.3*0.5' TD=0NS RISE=1


   .measure A_to_Y PARAM = '(x_prop_delay_a_1 + x_prop_delay_a_2)/2'


** Save results for display
.OPTIONS POST
** Avoid DC convergence in at unreasonable voltage
.OPTIONS GMINDC=1n

.END
