module rdtype_stim;

timeunit 1ns;
timeprecision 10ps;

logic D ;
logic Clk;
logic nRst;
logic nQ;  
logic Q ;

rdtype DUT(
	.Clk  (Clk),
	.nRst (nRst),
	.D    (D),
   .nQ   (nQ),
	.Q    (Q)
	);

// stimulus information follows

always begin
         Clk = 0;
   #10   Clk = 1;
   #10   Clk = 0;
end

initial
  begin
    D = 0;
    nRst = 0;

    #100
          nRst = 1;
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
   $monitor($time               ,"      %b    %b       %b  %b",nRst,D,Q,nQ);  
end
endmodule
