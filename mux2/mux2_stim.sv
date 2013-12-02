// stimulus file smux2_stim.sv for smux2
// created by ext2svmod 5.5

module mux2_stim;

timeunit 1ns;
timeprecision 10ps;

logic I0 ;
logic I1 ;
logic S ;
logic Y ;

wire M ;

mux2 instance1(
	.I0 ( I0 ),
	.I1 ( I1 ),
	.S ( S ),
	.Y ( Y )
	);

// stimulus information follows

initial
  begin
    I0 = 0;
    I1 = 0;
    S = 0;
	
    #1000 
	I0 = 1;
    #1000
	S = 1;
    #1000
	I1 = 1;
    #1000
	I0 = 0;
    #1000
	S = 0;
    #1000
    $stop;
    $finish;
  end

// probe information follows

initial
  $monitor($time,
    ,"%b", I0,
    ,"%b", I1 ,
    ,"%b", S ,
    ,"%b", Y ,
    );


//SIMVISION SCRIPT:smux2.tcl

endmodule
