import os
import re
import sys

module = sys.argv[1]
print(module)
INPUTFILE = "../%s/%s.mag" % (module, module)
OUTPUTFILE = "../%s/bbprep" % (module)

outfile = open(OUTPUTFILE, 'w')
infile = open(INPUTFILE, 'r')
outfile.write(':erase poly\n\
:erase nw\n\
:erase pfet\n\
:erase nfet\n\
:erase pc\n\
:erase pdc\n\
:erase ndc\n\
:erase pohmic\n\
:erase nohmic\n\
:erase m2c\n\
:erase pst\n\
:erase nwt\n\
:erase pad\n\
:erase pw\n\
:erase glass\n\
:erase pdiff\n\
:erase ndiff\n')

magfile = infile.read()
print(magfile)
#match = re.findall("rlabel.*GND", magfile)
#if match:
#	parts = match[0].split(" ")
#	GBL = (parts[2], parts[3])
#	GTL = (parts[4], parts[5])
#	parts = match[1].split(" ")
#	GBR = (parts[2], parts[3])
#	GTR = (parts[4], parts[5])
#print(GBL)
#print(GBR)
#print(GTL)
#print(GTR)
ports = ["Vdd!", "GND!", "A", "B", "C", "Y"]
for port in ports:
	print(port)
	pattern = "rlabel.* "+port+"\n"
	match = re.findall(pattern, magfile)
	if match:
		parts = match[0].split(" ")
		print(parts)
		BL = (parts[2], parts[3])
		TL = (parts[4], parts[5])
		parts = match[1].split(" ")
		print(parts)
		BR = (parts[2], parts[3])
		TR = (parts[4], parts[5])
		outfile.write(":box %s %s %s %s\n" % (BL[0], BL[1], TR[0], TR[1]))
		outfile.write(":paint %s\n" % parts[1])#repaints the vdd
		if("GND!" == port):
			GBL = BL
			GBR = BR
			GTL = TL
			GTR = TR
		if("Vdd!" == port):
			VBL = BL
			VBR = BR
			VTL = TL
			VTR = TR
	
outfile.write(":box %s %s %s %s\n" % (GTL[0], GTL[1], VBR[0], VBR[1]))
outfile.write(":erase m1\n")#removes m1 from between vdd and gnd

outfile.write(":save\n:quit\n")
outfile.close()
		
