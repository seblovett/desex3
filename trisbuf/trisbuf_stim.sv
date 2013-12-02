// stimulus file trisbuf_stim.sv for trisbuf
// created by ext2svmod 5.5

module trisbuf_stim;

timeunit 1ns;
timeprecision 10ps;

logic A ;
logic Enable ;

wire Y ;

trisbuf instance1(
	.Y ( Y ),
	.A ( A ),
	.Enable ( Enable )
	);

// stimulus information follows

initial
  begin
    A = 0;
    Enable = 0;

    #1000
          A = 1;
    
    #1000
          A =  0;
    #1000
          Enable = 1;
    #1000
          A = 0;
    #1000
          A = 1;
    #1000
          Enable = 0;

    #1000
          $stop;
          $finish;
  end

// probe information follows

initial
  $monitor($time,
    ,"%b", A ,
    ,"%b", Enable ,
    ,"%b", Y ,
    );


//SIMVISION SCRIPT:trisbuf.tcl

endmodule
