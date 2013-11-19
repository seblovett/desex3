// stimulus file inv_stim.sv for inv
// created by ext2svmod 5.5

module inv_stim;

timeunit 1ns;
timeprecision 10ps;

logic A ;

wire Y ;

inv instance1(
	.Y ( Y ),
	.A ( A )
	);

// stimulus information follows

initial
  begin
    A = 0;

    #1000
          A = 1;
    #1000
          A = 0;

    #1000
          $stop;
          $finish;
  end

// probe information follows

initial
  $monitor($time,
    ,"%b", A ,
    ,"%b", Y ,
    );


//SIMVISION SCRIPT:inv.tcl

endmodule
