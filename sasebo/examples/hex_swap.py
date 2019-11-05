#!/usr/bin/python2._

import sys

fn1=sys.argv[1]
#fn2=sys.argv[2]

#get file content line by line

#outfile = open(fn2, 'w')
newlines =[]

with open(fn1, 'r') as infile:
  oldlines = infile.readlines()

for i in range(0,len(oldlines),2):
  newlines.append(oldlines[i+1]) 
  newlines.append(oldlines[i]) 

#with open(fn2, 'w') as outfile:
  #for line in newlines:
    #outfile.write(line)

with open(fn1, 'w') as outfile:
  for line in newlines:
    outfile.write(line)
