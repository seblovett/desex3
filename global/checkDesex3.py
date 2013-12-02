import os
import re
import sys
import subprocess


#              Globe Name        Top         Bottom   Left
globes   = [
               ["ScanReturn"     ,"792"     ,"782"    ,"0"  ],
               ["Scan"           ,"769"     ,"759"    ,"0"  ],
               ["Vdd!"           ,"746"     ,"721"    ,"0"  ],
               ["GND!"           ,"101"      ,"76"    ,"0"  ],
               ["Clock"          ,"63"      ,"53"     ,"0"  ],
               ["Test"           ,"40"      ,"30"     ,"0"  ],
               ["nReset"         ,"17"      ,"7"      ,"0"  ]
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
infoDump = "checkDesex3info"
totalGlobals = (len(globes)*2)



# Header
print("\n\n\n")
print("###########################")
print("#      Desex3 Check       #")
print("###########################")


if not os.path.exists(infoDump):
   os.makedirs(infoDump)
else:
   os.system("rm "+infoDump+"/*")

# Iterate modules
globalErrors = 0;
for module in modules:
   infoFile = infoDump+"/"+module+".txt"
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
         print("         INFO: Found global port "+rlabelBreak[7])
         numGlobals += 1

   if(numGlobals != totalGlobals):
      print("         WARNING: Found "+str(numGlobals)+" global ports, normally "+str(totalGlobals))

   if(localErrors == 0):
      print("         INFO: Pass global ports")




   # Extract if no errors
   if(localErrors == 0):

      #TODO: Can only pipe stdout to scratch file, this is bad

      print ("\n   Extracting from "+module+".mag to "+module+".ext")
      os.system("magic -T c035u -dnull << EOF &> "+module+"\n:load ../"+module+"/"+module+"\n:extract\n:q")
      data = open(module,'r+')
      for line in data.readlines():
         print("         "+line.rstrip('\n').rstrip('\r')    )
      print("\n   Running 'ext2sp'...")
      os.system("ext2sp ../"+module+"/"+module+" &> "+module)
      data = open(module,'r+')
      for line in data.readlines():
         print("         "+line.rstrip('\n').rstrip('\r')    )
      print("\n   Running 'ext2svmod'...")
      os.system("ext2svmod ../"+module+"/"+module+" &> "+module)
      data = open(module,'r+')
      for line in data.readlines():
         print("         "+line.rstrip('\n').rstrip('\r')    )
      os.system("rm "+module)






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
   if(localErrors == 0):
      print(module+"... OK")
   else:
      print(module+"... FAILED!!!!!!")
      globalErrors += localErrors


   # Rename info file with errors
   os.system("mv "+infoDump+"/"+module+".txt "+infoDump+"/"+module+"_"+str(localErrors)+".txt")








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

print("Info files held in desex3/global/"+infoDump+"\n\n")
