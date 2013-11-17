// structural model of rdtype extracted from rdtype.mag
// created by ext2svmod 5.5

module rdtype(
	output nQ ,
	output Q ,
	input Clk ,
	input D ,
	input nRst 
	);

timeunit 1ns;
timeprecision 10ps;


// include netlist information from rdtype.vnet

`include "rdtype.vnet"

endmodule
