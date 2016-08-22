USER="npersia"
SHARE_FOLDER="/media/sf_pruebas_mediacenter"
TV_SHOWS="series/"
MOVIES="peliculas/"
FINISH="completados/"








#./Config/ConfigVBoxLinuxAdditions.sh "/dev/sr0"

#./Config/ConfigGroups.sh $USER "/etc/group"

#./Config/ConfigMkvMerge.sh

#./Config/ConfigCronetab.sh "/home/$USER/MediaCenter/subMerge.py" $SHARE_FOLDER $TV_SHOWS $MOVIES $FINISH "/etc/crontab"

#./Config/ConfigIP.sh "/etc/network/interfaces" "192.168.11.198"

#./Config/ConfigDocker.sh

#./Config/ConfigCouchpotato.sh $SHARE_FOLDER

./Config/ConfigTransmission.sh $SHARE_FOLDER

#halt --reboot
