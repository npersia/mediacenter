import os

FILE="./pruebas/Fringe.srt"
print os.popen("file "+FILE)
if "8859" in os.popen("file "+FILE):
	os.system("iconv -f UTF-8859-1 -t UTF-8 "+FILE+" -o "+FILE+".utf8")
	os.system("rm "+FILE)
	os.system("mv "+FILE+".utf8 "+FILE)
