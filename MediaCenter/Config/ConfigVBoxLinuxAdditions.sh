apt-get update
apt-get install build-essential linux-headers-generic -y
mount $MOUNT_FOLDER /media/cdrom/
sh /media/cdrom/VBoxLinuxAdditions.run --nox11
