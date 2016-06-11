import os
import sys
#p = os.popen("comando")
#p.readline();p.read()


_FOLDER_WORK_ = sys.argv[1] #"/home/npersia/prog/pruebas/"
_FOLDER_ = sys.argv[2] #"series/"
_TMP_FOLDER_ = sys.argv[3] #"tmp/" #se creara en el mismo directorio que esta _FOLDER_

class Movie:
	def __init__(self,mov=None,sub=None):
		self.mov = mov
		self.sub = sub
		ext = self.mov.split(".")[-1]
		self.tmp_mov = self.mov.replace(_FOLDER_,_TMP_FOLDER_+_FOLDER_).replace(ext,"mkv")

	def merge(self):
		toUtf8(self.sub)
		os.system("mkvmerge -o " + self.tmp_mov +" "+ self.mov +" "+ self.sub)


	def deleteOriginalFiles(self):
		os.system("rm '"+ self.mov+"'")
		os.system("rm '"+ self.sub+"'")
	
	def moveTmpFiles(self):
		folN = ""
		for f in self.mov.split("/")[:-1]:
			folN += f + "/"
		os.system("mv '"+ self.tmp_mov + "' " +folN)

	def proc(self):
		self.merge()
		self.deleteOriginalFiles()
		self.moveTmpFiles()



def toUtf8(FILE):
	if "8859" in os.popen("file "+FILE).read():
		os.system("iconv -f ISO-8859-1 -t UTF-8 "+FILE+" -o "+FILE+".utf8")
		os.system("rm "+FILE)
		os.system("mv "+FILE+".utf8 "+FILE)

def generateFolderTree():
	os.system("mkdir "+_FOLDER_WORK_+_TMP_FOLDER_)
	os.system("mkdir "+_FOLDER_WORK_+_TMP_FOLDER_+_FOLDER_)
	folders = os.popen("ls " + _FOLDER_WORK_ + _FOLDER_ + " -R | grep /|cut -d ':' -f 1").read().split("\n")[:-1]
	for f in folders:
		os.system("mkdir " + f.replace(_FOLDER_,_TMP_FOLDER_+_FOLDER_))

def findFilesType(root,form):
	names = ""
	if len(form) > 1:
		for f in form[:-1]:
			names +=  "-name *" + f + " -o "
		names += "-name *" + form[-1]
	else:
		names += "-name *" + form[0]
	return os.popen("find " + root +" "+ names).read().split("\n")[:-1]

def deleteFolderTree():
	os.system("rm -fr "+_FOLDER_WORK_+_TMP_FOLDER_)

def getFileName(f):
	return f.split("/")[-1]

def getFileNameWithoutFormat(f):
	fileN = getFileName(f).split(".")[:-1]
	fNstring = ""
	if len(fileN) > 1:
		for fN in fileN[:-1]:
			fNstring += fN+"."
		fNstring += fileN[-1]
	return fNstring


generateFolderTree()
#print findFilesType(_FOLDER_WORK_+_FOLDER_,["mp4","srt"])

moviesList = findFilesType(_FOLDER_WORK_+_FOLDER_,["mp4"])
subtitlesList = findFilesType(_FOLDER_WORK_+_FOLDER_,["srt"])

moviesHash = {}
for m in moviesList:
	moviesHash[getFileNameWithoutFormat(m)]=m

subtitlesHash={}
for s in subtitlesList:
	subtitlesHash[getFileNameWithoutFormat(s)]=s

msHash = {}
def processHash():
	subHList = subtitlesHash.keys()
	for m in moviesHash:
		for s in subHList:
			if (m in s) or (s in m):
				msHash[m] = Movie(moviesHash[m],subtitlesHash[s])
				break
			
processHash()

for ms in msHash:
	msHash[ms].proc()

deleteFolderTree()
