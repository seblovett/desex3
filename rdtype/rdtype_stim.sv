module rdtype_stim;

timeunit 1ns;
timeprecision 10ps;

logic D ;
logic Clock;
logic nReset;
logic nQ;  
logic Q ;

rdtype DUT(
	.Clock  (Clock),
	.nReset (nReset),
	.D    (D),
   .nQ   (nQ),
	.Q    (Q)
	);

// stimulus information follows

always begin
         Clock = 0;
   #10   Clock = 1;
   #10   Clock = 0;
end

initial
  begin
    D = 0;
    nReset = 0;

    #100
          nReset = 1;
    #100
          D = 1;
    #100
          D = 0;
    #100
          D = 1;
    #100
          D = 0;
    #100
          D = 1;
    #100
          $stop;
          $finish;
  end

// probe information follows

initial begin
   $display( "                Time     nRst  D       Q  nQ");
   $monitor($time               ,"      %b    %b       %b  %b",nReset,D,Q,nQ);  
end
endmodule
