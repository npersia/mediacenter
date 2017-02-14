echo "# This file describes the network interfaces available on your system" > $NETWORK_FILE
echo "# and how to activate them. For more information, see interfaces(5)." >> $NETWORK_FILE
echo  >> $NETWORK_FILE
echo source /etc/network/interfaces.d/* >> $NETWORK_FILE
echo  >> $NETWORK_FILE
echo "# The loopback network interface" >> $NETWORK_FILE
echo auto lo >> $NETWORK_FILE
echo iface lo inet loopback >> $NETWORK_FILE
echo  >> $NETWORK_FILE
echo "# The primary network interface" >> $NETWORK_FILE
echo auto enp0s3 >> $NETWORK_FILE
echo "#iface enp0s3 inet dhcp" >> $NETWORK_FILE
echo iface enp0s3 inet static >> $NETWORK_FILE
echo address $SERVER_IP >> $NETWORK_FILE
echo netmask 255.255.255.0 >> $NETWORK_FILE
echo "#network 192.168.11.0" >> $NETWORK_FILE
echo "#broadcast 192.168.11.255" >> $NETWORK_FILE
echo gateway 192.168.11.1 >> $NETWORK_FILE
echo dns-nameservers 190.55.60.129 181.47.248.145 >> $NETWORK_FILE

/etc/init.d/networking restart
