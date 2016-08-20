USER="npersia"
SHARE_FOLDER="/media/sf_share/"
TV_SHOWS="series/"
MOVIES="peliculas/"
FINISH="completados/"








#./Config/ConfigVBoxLinuxAdditions.sh "/dev/sr0"

./Config/ConfigGroups.sh $USER "/etc/group"

#./Config/ConfigMkvMerge.sh

#./Config/ConfigCronetab.sh "/home/$USER/MediaCenter/subMerge.py" $SHARE_FOLDER $TV_SHOWS $MOVIES $FINISH "/etc/crontab"

#./Config/ConfigIP.sh "/etc/network/interfaces" "192.168.11.198"

./ConfigDocker.sh

#halt --reboot
