docker pull linuxserver/couchpotato

docker create \
	--name=couchpotato \
	-v $COUCHPOTATO_CONFIG:/config \
	-v $DOWNLOAD_FOLDER:/downloads \
	-v $COUCHPOTATO_MOVIES:/movies \
	-e PGID=0 -e PUID=0 \
	-e TZ=London \
	-p 5050:5050 \
	linuxserver/couchpotato

docker start couchpotato
