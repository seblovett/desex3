import os
import re
import sys
import subprocess


#              Globe Name        Top         Bottom
globes   = [
               ["ScanReturn"     ,"775"     ,"765"  ],
               ["Scan"           ,"752"     ,"742"  ],
               ["Vdd!"           ,"729"     ,"704"  ],
               ["GND!"           ,"94"      ,"69"   ],
               ["Clock"          ,"56"      ,"46"   ],
               ["Test"           ,"33"      ,"23"   ],
               ["nReset"         ,"10"      ,"0"    ]
            ]
modules  = [
               "and2"      ,
               "buffer"    ,
               "fulladder" ,
               "halfadder" ,
               "inv"       ,
               "leftbuf"   ,
               "mux2"      ,
               "nand2"     ,
               "nand3"     ,
               "nand4"     ,
               "nor2"      ,
               "nor3"      ,
               "or2"       ,
               "rdtype"    ,
               "rightend"  ,
               "rowcrosser",
               "smux2"     ,
               "smux3"     ,
               "tiehigh"   ,
               "tielow"    ,
               "trisbuf"   ,
               "xor2"
            ]
pfet = ["pfet","w=48","l=7"]
nfet = ["nfet","w=30","l=7"]

totalGlobals = (len(globes)*2)




# Header
print("\n\n\n")
print("###########################")
print("#      Desex3 Check       #")
print("###########################")


if not os.path.exists("Errors"):
   os.makedirs("Errors")

# Iterate modules
globalErrors = 0;
for module in modules:
   infoFile = "Errors/"+module+".txt"
   sys.stdout = open(infoFile, 'w')
   localErrors = 0;
   print("Testing "+module+"...\n")



   # Global port check
   print("   Checking ports...")
   INPUTFILE = "../"+module+"/"+module+".mag"
   infile = open(INPUTFILE, 'r')
   magfile = infile.read()
   rlabels = re.findall("rlabel.*\n", magfile)
   numGlobals = 0
   for rlabel in rlabels:
      nonGlobal = 1
      rlabelBreak = rlabel.split(" ")                                      # Split
      rlabelBreak[7] = rlabelBreak[7].rstrip('\n')                         # Remove new line
      rlabelBreak[7] = rlabelBreak[7].rstrip('\r')                         # Remove return carridge
      for i in range(len(globes)):
         if(globes[i][0] == rlabelBreak[7]):
            nonGlobal = 0
            if(globes[i][1] != rlabelBreak[5]):
               print("      FAIL: Align port top "+globes[i][0])
               localErrors += 1
            if(globes[i][2] != rlabelBreak[3]):
               print("      FAIL: Align port bottom "+globes[i][0])
               localErrors += 1
      if(nonGlobal == 1):
         print("         INFO: Found non global port "+rlabelBreak[7])
      else:
         numGlobals += 1

   if(numGlobals != totalGlobals):
      print("      FAIL: Only "+str(numGlobals)+" global ports, there should be "+str(totalGlobals))
      localErrors += 1

   if(localErrors == 0):
      print("         INFO: Pass global ports")





   # Extract if no errors
   if(localErrors == 0):
      print ("\n   Extracting from "+module+".mag to "+module+".ext")
      os.system("magic -T c035u -dnull << EOF &> /dev/null\n:load ../"+module+"/"+module+"\n:extract\n:q")
      print("   Creating "+module+".spice")
      print("   Creating "+module+".sp")
      os.system("ext2sp ../"+module+"/"+module+" &> /dev/null")






   # Transistor size check
   if(localErrors == 0):
      tranErrors = 0
      print("\n   Checking transistor sizes...")
      INPUTFILE = "../"+module+"/"+module+".spice"
      infile = open(INPUTFILE, 'r')
      spicefile = infile.read()
      transistors = re.findall("m1.*\n", spicefile)
      for transistor in transistors:
         transistor = transistor.rstrip('\n')                         # Remove new line
         transistor = transistor.rstrip('\r')                         # Remove return carridge
         transistorBreak = transistor.split(" ")                                      # Split
         if(transistorBreak[5] == pfet[0]):
            if((transistorBreak[6] != pfet[1])):
               print("   FAIL: transistor "+transistorBreak[0]+" width "+transistorBreak[6])
               tranErrors += 1
            if(transistorBreak[7] != pfet[2]):
               print("   FAIL: transistor "+transistorBreak[0]+" length "+transistorBreak[6])
               tranErrors += 1
         if(transistorBreak[5] == nfet[0]):
            if((transistorBreak[6] != nfet[1])):
               print("   FAIL: transistor "+transistorBreak[0]+" width "+transistorBreak[6])
               tranErrors += 1
            if(transistorBreak[7] != pfet[2]):
               print("   FAIL: transistor "+transistorBreak[0]+" length "+transistorBreak[6])
               tranErrors += 1
      if(tranErrors == 0):
         print("         INFO: Pass transistors")
      else:
         localErrors += tranErrors


   sys.stdout = open("/dev/stdout","w")
   # Display local errors
   print
   if(localErrors == 0):
      print("Passed "+module)
   else:
      print("Failed "+module)
      globalErrors += localErrors

   os.system("mv Errors/"+module+".txt Errors/"+str(localErrors)+"_"+module+".txt")








# PASS/FAIL ending
print
if(globalErrors == 0):
   print("###########################")
   print("#          PASSED         #")
   print("###########################")
else:
   print("!!!!!!!!!!!!!!!!!!!!!!!!!!!")
   print("!!         FAILED        !!")
   print("!!!!!!!!!!!!!!!!!!!!!!!!!!!")
   if(globalErrors == 1):
      print("\n "+str(globalErrors)+" error")
   else:
      print("\n "+str(globalErrors)+" errors")
   print

print("Error files held in desex3/global/Errors/\n\n")
