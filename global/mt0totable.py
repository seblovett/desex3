# -*- coding: utf-8 -*-
"""
Created on Thu Dec 05 22:31:30 2013

@author: seblovett
@brief converts an mt0 to a LaTeX table
"""
 
from optparse import OptionParser

PICO = 1e-12

parser = OptionParser()
parser.add_option("-i", "--input", dest="input",
                  help="Input *.mt0 file", metavar="FILE")
parser.add_option("-o", "--output", dest="output",
                  help="Output file", metavar="FILE")

(options, args) = parser.parse_args()

print options.input
print options.output

f = open(options.input, 'r')
mt0 = f.read()
f.close()
mt0 = mt0.split('\n')[2:] #only extract the good stuff

endofnames = None;
for i in range(len(mt0)):
    mt0[i] = ' '.join(mt0[i].split())
    
for i in range(len(mt0)):
    if mt0[i].endswith('#'):
        endofnames = i;
names = " ".join(mt0[0:endofnames+1])
values = " ".join(mt0[endofnames+1:])

names = names.split()
values = values.split()

for i in range(len(names)):
    names[i] = " ".join(names[i].split("_"))
    
#convert all numbers to pico
for i in range(len(values)):
    values[i] = float(values[i]) / PICO

#output to table
outfile = open(options.output, 'w')
for i in range(len(values)):
    if((names[i] == "temper") or (names[i] == "alter#")):
        continue
    outfile.write("%s & %.1f \\\\\n" % (names[i], values[i]))
outfile.close()
print names
print values