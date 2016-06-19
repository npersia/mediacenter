MOUNT_TARGET=$1 #/dev/sr0



apt-get update
apt-get install build-essential linux-headers-generic -y
mount $MOUNT_TARGET /media/cdrom/
sh /media/cdrom/VBoxLinuxAdditions.run
