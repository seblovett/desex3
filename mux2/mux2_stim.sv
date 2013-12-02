// stimulus file smux2_stim.sv for smux2
// created by ext2svmod 5.5

module mux2_stim;

timeunit 1ns;
timeprecision 10ps;

logic D ;
logic SDI ;
logic Test ;

wire M ;

mux2 instance1(
	.M ( M ),
	.D ( D ),
	.SDI ( SDI ),
	.Test ( Test )
	);

// stimulus information follows

initial
  begin
    D = 0;
    SDI = 0;
    Test = 0;

    #1000
          D = 1; //D to output
    #1000
          D = 0; //D to output
    #1000
	Test = 1; //SDI to output
    #1000
	SDI = 1; //SDI to output
    #1000
	SDI = 0; //SDI to output
    #1000
	Test = 0; //D to output

    #1000
          $stop;
          $finish;
  end

// probe information follows

initial
  $monitor($time,
    ,"%b", D ,
    ,"%b", SDI ,
    ,"%b", Test ,
    ,"%b", M ,
    );


//SIMVISION SCRIPT:smux2.tcl

endmodule
