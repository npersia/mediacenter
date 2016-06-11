import os

def toUtf8(FILE): 
	if "8859" in os.popen("file "+FILE).read():
		os.system("iconv -f ISO-8859-1 -t UTF-8 "+FILE+" -o "+FILE+".utf8")
		os.system("rm "+FILE)
		os.system("mv "+FILE+".utf8 "+FILE)
		

FILE_IN="./pruebas/Fringe.srt"
toUtf8(FILE_IN)
