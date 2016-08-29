for L in $(/usr/bin/transmission-remote  127.0.0.1:9091 -l |grep 100%|awk '{print $1}')
do
        #LL=$(echo $L | cut -d "*" -f 2)
        LL=$(echo $L| cut -d "*" -f 1)
        /usr/bin/transmission-remote   127.0.0.1:9091 --torrent $LL --remove
done

