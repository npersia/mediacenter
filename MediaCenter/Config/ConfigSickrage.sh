docker pull linuxserver/sickrage

docker create --name=sickrage \
	-v $SICKRAGE_CONFIG:/config \
	-v $DOWNLOAD_FOLDER:/downloads \
	-v $SICKRAGE_TV:/tv \
	-e PGID=0 -e PUID=0  \
	-e TZ=London \
	-p 8081:8081 \
	linuxserver/sickrage



docker start sickrage
