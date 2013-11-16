module nand3_stim;

timeunit 1ns;
timeprecision 10ps;

logic D ;
logic Clk;
logic nRst;
logic W;   
logic X;  
logic Y;   
logic Z;   
logic nQ;  
logic Q ;

rdtype DUT(
	.Clk  (Clk),
	.nRst (nRst),
	.D    (D),
   .W    (W),
   .X    (X),
   .Y    (Y),
   .Z    (Z),
   .nQ   (nQ),
	.Q    (Q)
	);

// stimulus information follows

always begin
      Clk = 0;
   #10 Clk = 1;
   #10 Clk = 0;
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
   $display( "                 Time   nRst Clk D     Q W X Y Z nQ");
   $monitor($time
      ,"     %b", nRst ,
      ,"   %b", Clk ,
      ," %b", D ,
      ,"    %b", Q ,
      ,"%b", W ,
      ,"%b", X ,
      ,"%b", Y ,
      ,"%b", Z ,
      ,"%b", nQ     

   );  
end
endmodule
