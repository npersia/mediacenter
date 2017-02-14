source ./conf.sh

if [ "$1" = "1" ];then
	dpkg --configure -a

	source ./Config/ConfigVBoxLinuxAdditions.sh

	source ./Config/ConfigIP.sh
	
	halt --reboot
fi
if [ "$1" = "2" ];then
	source ./Config/ConfigDocker.sh

	source ./Config/ConfigGroups.sh

	source ./Config/ConfigFolders.sh

	source ./Config/ConfigContainers.sh
	
	docker-compose  up -d
	
fi
