// stimulus file scandtype_stim.sv for scandtype
// created by ext2svmod 5.5

module scandtype_stim;

timeunit 1ns;
timeprecision 10ps;

logic Clock ;
logic D ;
logic nReset ;
logic SDI ;
logic Test ;

wire nQ ;
wire Q ;

scandtype instance1(
	.nQ ( nQ ),
	.Q ( Q ),
	.Clock ( Clock ),
	.D ( D ),
	.nReset ( nReset ),
	.SDI ( SDI ),
	.Test ( Test )
	);

// stimulus information follows
always
begin
	Clock = 0;
	#250 Clock = 1;
	#500 Clock = 0;
	#250 Clock = 0;
end
initial
  begin
    D = 0;
    nReset = 0;
    SDI = 0;
    Test = 0;

    #1000 
	nReset = 1;

    #1000 
	D = 1;

    #1000
	Test = 1;

#1000 
	SDI = 1;
	D = 0;

#1000 
	Test = 0;
    #1000
          $stop;
          $finish;
  end

// probe information follows

initial
  $monitor($time,
    ,"%b", Clock ,
    ,"%b", D ,
    ,"%b", nReset ,
    ,"%b", SDI ,
    ,"%b", Test ,
    ,"%b", nQ ,
    ,"%b", Q ,
    );


//SIMVISION SCRIPT:scandtype.tcl

endmodule
