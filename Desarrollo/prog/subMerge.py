import os

#p = os.popen("comando")
#p.readline();p.read()

_FOLDER_WORK_ = "/home/npersia/prog/pruebas/"
_FOLDER_ = "series/"
_TMP_FOLDER_ = "tmp/" #se creara en el mismo directorio que esta _FOLDER_

class Movie:
	def __init__(self,mov=None,sub=None):
		self.mov = mov
		self.sub = sub
		ext = self.mov.split(".")[-1]
		self.tmp_mov = self.mov.replace(_FOLDER_,_TMP_FOLDER_+_FOLDER_).replace(ext,"mkv")

	def merge(self):
		print "MEZCLANDO ",self.mov," Y ",self.sub," EN >> ",self.tmp_mov
		os.system("touch "+ self.tmp_mov)

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
