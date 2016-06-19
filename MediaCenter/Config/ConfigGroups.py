import os
import sys


FILE=sys.argv[1]    #"./group"
USER=sys.argv[2]    #"npersia"


a = os.popen("grep vboxsf "+FILE).read().split(":")

print a

if a[-1] == "\n":
	a[-1] = USER
elif USER not in a[-1]:
	a[-1] = a[-1].replace("\n",","+USER)
b=""
for x in a[:-1]:
	b+=x+":"

b+=a[-1]

os.system("sed 's/^.*vboxsf.*$/"+b+"/g' -i "+FILE)
