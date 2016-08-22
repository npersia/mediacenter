FOLDER=$1

docker pull linuxserver/transmission

mkdir $FOLDER/transmission
mkdir $FOLDER/transmission/config $FOLDER/transmission/downloads $FOLDER/transmission/watch

docker create --name=transmission \
-v $FOLDER/transmission/config:/config \
-v $FOLDER/transmission/downloads:/downloads \
-v $FOLDER/transmission/watch:/watch \
-e PGID=0 -e PUID=0 \
-e TZ=London \
-p 9091:9091 -p 51413:51413 \
-p 51413:51413/udp \
linuxserver/transmission


docker start transmission
