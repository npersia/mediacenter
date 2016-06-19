

USUBMERGE=$1 #"/home/npersia/mediacenter/Desarrollo/prog/SubMerge/subMerge.py"
WORK_FOLDER=$2 #"/media/sf_share/"
TV_SHOWS=$3 #"series/"
MOVIES=$4 #"peliculas/"
FINISH=$5 #"completados/"


CRONETAB=$6 #"pruebaCronetab"

echo "*/20 *    * * *   root     /usr/bin/python2.7 $USUBMERGE $WORK_FOLDER $TV_SHOWS $FINISH" >> CRONETAB
echo "*/20 *    * * *   root     /usr/bin/python2.7 $USUBMERGE $WORK_FOLDER $MOVIES $FINISH" >> CRONETAB
