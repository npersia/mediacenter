FOLDER=$1

docker pull linuxserver/couchpotato

docker create --name=couchpotato -v $FOLDER/couchpotato/config:/config -v $FOLDER/downloads:/downloads -v $FOLDER/couchpotato/movies:/movies -e PGID=0 -e PUID=0 -e TZ=London -p 5050:5050 linuxserver/couchpotato

docker start couchpotato
