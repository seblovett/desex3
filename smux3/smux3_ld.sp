** HSPICE file for smux3_ld
**   - generated by ext2sp v4.1

** Include netlist file for smux3_ld
.include smux3_ld.spice

** Default 3.3V Power Supply
Vsupply Vdd GND 3.3V

** Specify input signals here
   VNLOAD NLOAD GND PWL(0NS 0V  10NS 0V  10.25NS 3.3V  24NS 3.3V  24.25NS 0V  28NS 0V  28.25NS 3.3V  38NS 3.3V  38.25NS 0V  42NS 0V  42.25NS 3.3V  88NS 3.3V  88.25NS 0V)
   VND ND GND PWL(0NS 3.3V  4NS 3.3V  4.25NS 0V  8NS 0V  8.25NS 3.3V  20NS 3.3V  20.25NS 0V  30NS 0V  30.25NS 3.3V  108NS 3.3V  108.25NS 0V)
   VNQ NQ GND PWL(0NS 3.3V  14NS 3.3V  14.25NS 0V  18NS 0V  18.24NS 3.3V  30NS 3.3V  34NS 3.3V  34.24NS 0V  74NS 0V  74.25NS 3.3V)
   VNTEST NTEST GND PWL(0NS 3.3V  50NS 3.3V  50.25NS 0V  64NS 0V  64.25NS 3.3V  68NS 3.3V  68.25NS 0V  78NS 0V  78.25NS  3.3V  84NS 3.3V  84.25NS 0V  94NS 0V  94.25NS 3.3V  104NS 3.3V  104.25NS 0V  114NS 0V  114.25NS 3.3V)
   VNSDI NSDI GND PWL(0NS 3.3V  54NS 3.3V  54.25NS 0V  58NS 0V  58.25NS 3.3V 74NS 3.3V  74.25NS 0V  98NS 0V  98.25NS 3.3V)

** Default Simulation - Type, Resolution & Duration
.TRAN 10PS 120NS

** Specify ouput signals to measure here
** e.g. rise and fall delays for output Y
   .measure tran x_D_Rise_Propagation_Delay TRIG v(D) VAL='3.3*0.5' TD=0NS RISE=1
   + TARG v(M) VAL='3.3*0.5' TD=0NS RISE=1
   .measure tran x_D_Fall_Propagation_Delay TRIG v(D) VAL='3.3*0.5' TD=0NS FALL=1
   + TARG v(M) VAL='3.3*0.5' TD=0NS FALL=1
   
   .measure tran x_Q_Rise_Propagation_Delay TRIG v(Q) VAL='3.3*0.5' TD=0NS RISE=1
   + TARG v(M) VAL='3.3*0.5' TD=0NS RISE=2
   .measure tran x_Q_Fall_Propagation_Delay TRIG v(Q) VAL='3.3*0.5' TD=0NS FALL=1
   + TARG v(M) VAL='3.3*0.5' TD=0NS FALL=2

   .measure tran x_Load_Pass_D_Rise_Propagation_Delay TRIG v(LOAD) VAL='3.3*0.5' TD=0NS RISE=1
   + TARG v(M) VAL='3.3*0.5' TD=0NS RISE=3
   .measure tran x_Load_Pass_Q_Fall_Propagation_Delay TRIG v(LOAD) VAL='3.3*0.5' TD=0NS FALL=2
   + TARG v(M) VAL='3.3*0.5' TD=0NS FALL=3

   .measure tran x_Load_Pass_D_Fall_Propagation_Delay TRIG v(LOAD) VAL='3.3*0.5' TD=0NS RISE=2
   + TARG v(M) VAL='3.3*0.5' TD=0NS FALL=4
   .measure tran x_Load_Pass_Q_Rise_Propagation_Delay TRIG v(LOAD) VAL='3.3*0.5' TD=0NS FALL=3
   + TARG v(M) VAL='3.3*0.5' TD=0NS RISE=5
   
   .measure tran x_SDI_Rise_Propagation_Delay TRIG v(SDI) VAL='3.3*0.5' TD=0NS RISE=1
   + TARG v(M) VAL='3.3*0.5' TD=0NS RISE=6
   .measure tran x_SDI_Fall_Propagation_Delay TRIG v(SDI) VAL='3.3*0.5' TD=0NS FALL=1
   + TARG v(M) VAL='3.3*0.5' TD=0NS FALL=6
**Use Test to switch output
   .measure tran x_Test_Pass_Q_Rise_Propagation_Delay TRIG v(TEST) VAL='3.3*0.5' TD=0NS FALL=1
   + TARG v(M) VAL='3.3*0.5' TD=0NS RISE=7
   .measure tran x_Test_Pass_SDI_Fall_Propagation_Delay TRIG v(TEST) VAL='3.3*0.5' TD=0NS RISE=2
   + TARG v(M) VAL='3.3*0.5' TD=0NS FALL=7
   
   .measure tran x_Test_Pass_Q_Fall_Propagation_Delay TRIG v(TEST) VAL='3.3*0.5' TD=0NS FALL=2
   + TARG v(M) VAL='3.3*0.5' TD=0NS FALL=8
   .measure tran x_Test_Pass_SDI_Rise_Propagation_Delay TRIG v(TEST) VAL='3.3*0.5' TD=0NS RISE=3   
   + TARG v(M) VAL='3.3*0.5' TD=0NS RISE=9
   
   .measure tran x_Test_Pass_D_Fall_Propagation_Delay TRIG v(TEST) VAL='3.3*0.5' TD=0NS FALL=3
   + TARG v(M) VAL='3.3*0.5' TD=0NS FALL=9
   .measure tran x_Test_Pass_D_Rise_Propagation_Delay TRIG v(TEST) VAL='3.3*0.5' TD=0NS FALL=4   
   + TARG v(M) VAL='3.3*0.5' TD=0NS RISE=10

   .measure SDI_Propagation PARAM = '(x_SDI_Fall_Propagation_Delay + x_SDI_Rise_Propagation_Delay)/2'
   .measure D_Propagation PARAM = '(x_D_Fall_Propagation_Delay + x_D_Rise_Propagation_Delay)/2'
   .measure Q_Propagation PARAM = '(x_Q_Fall_Propagation_Delay + x_Q_Rise_Propagation_Delay)/2'
   .measure Test_Pass_SDI_Propagation PARAM = '(x_Test_Pass_SDI_Fall_Propagation_Delay + x_Test_Pass_SDI_Rise_Propagation_Delay)/2'
   .measure Test_Pass_D_Propagation PARAM = '(x_Test_Pass_D_Fall_Propagation_Delay + x_Test_Pass_D_Rise_Propagation_Delay)/2'
   .measure Test_Pass_Q_Propagation PARAM = '(x_Test_Pass_Q_Fall_Propagation_Delay + x_Test_Pass_Q_Rise_Propagation_Delay)/2'
   .measure Load_Pass_D_Propagation PARAM = '(x_Load_Pass_D_Fall_Propagation_Delay + x_Load_Pass_D_Rise_Propagation_Delay)/2'
   .measure Load_Pass_Q_Propagation PARAM = '(x_Load_Pass_Q_Fall_Propagation_Delay + x_Load_Pass_Q_Rise_Propagation_Delay)/2'

** Save results for display
.OPTIONS POST
** Avoid DC convergence in at unreasonable voltage
.OPTIONS GMINDC=1n

.END