FOLDER=$1

docker pull linuxserver/transmission


docker create --name=transmission \
	-v $FOLDER/transmission/config:/config \
	-v $FOLDER/downloads:/downloads \
	-v $FOLDER/transmission/watch:/watch \
	-e PGID=0 -e PUID=0 \
	-e TZ=London \
	-p 9091:9091 -p 51413:51413 \
	-p 51413:51413/udp \
	linuxserver/transmission


docker start transmission
