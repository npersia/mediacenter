import os

FILE="./pruebas/Fringe.srt"
if "8859" in os.popen("file "+FILE).read():
	os.system("iconv -f ISO-8859-1 -t UTF-8 "+FILE+" -o "+FILE+".utf8")
	os.system("rm "+FILE)
	os.system("mv "+FILE+".utf8 "+FILE)
	print 'Done'
