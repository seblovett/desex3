// stimulus file smux3_stim.sv for smux3
// created by ext2svmod 5.5

module smux3_stim;

timeunit 1ns;
timeprecision 10ps;

logic D ;
logic Load ;
logic Q ;
logic SDI ;
logic Test ;

wire M ;

smux3 instance1(
	.M ( M ),
	.D ( D ),
	.Load ( Load ),
	.Q ( Q ),
	.SDI ( SDI ),
	.Test ( Test )
	);

// stimulus information follows

initial
  begin
    D = 0;
    Load = 0;
    Q = 0;
    SDI = 0;
    Test = 0;

    #1000
          D = 1;
    #1000
          Load = 1;
    #1000
          Q = 1;
    #1000
          SDI = 1;
    #1000
          Test = 1;
    #1000
          D = 0;
    #1000
          Load = 0;
    #1000
          Q = 0;
    #1000
          SDI = 0;
    #1000
          Test = 0;

    #1000
          $stop;
//          $finish;
  end

// probe information follows

initial
  $monitor($time,
    ,"%b", D ,
    ,"%b", Load ,
    ,"%b", Q ,
    ,"%b", SDI ,
    ,"%b", Test ,
    ,"%b", M ,
    );


//SIMVISION SCRIPT:smux3.tcl

always
begin
	#100;
	case(Test)
	0:
		case(Load)
		0: assert(M==Q) else $display("Test=0,Load=0: M should equal Q");
		1: assert(M==D) else $display("Test=0,Load=1: M should equal D");
		endcase
	1: assert(M==SDI) else $display("Test=1: M should equal SDI");
	endcase
	#1100;
end

endmodule
