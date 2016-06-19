USER="npersia"
SHARE_FOLDER="/media/sf_share/"
TV_SHOWS="series/"
MOVIES="peliculas/"
FINISH="completados/"








./Config/ConfigVBoxLinuxAdditions.sh "/dev/sr0"

/usr/bin/python2.7 ./Config/ConfigGroups.py "/etc/group" $USER

./Config/ConfigMkvMerge.sh

./Config/ConfigCronetab.sh "/home/$USER/MediaCenter/subMerge.py" $SHARE_FOLDER $TV_SHOWS $MOVIES $FINISH "/etc/crontab"

./Config/ConfigIP.sh "/etc/network/interfaces" "192.168.11.198"



halt --reboot
