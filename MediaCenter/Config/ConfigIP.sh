FILE=$1 #/etc/network/interfaces
IP=$2 #"192.168.11.198"
echo "# This file describes the network interfaces available on your system" > $FILE
echo "# and how to activate them. For more information, see interfaces(5)." >> $FILE
echo  >> $FILE
echo source /etc/network/interfaces.d/* >> $FILE
echo  >> $FILE
echo "# The loopback network interface" >> $FILE
echo auto lo >> $FILE
echo iface lo inet loopback >> $FILE
echo  >> $FILE
echo "# The primary network interface" >> $FILE
echo auto enp0s3 >> $FILE
echo "#iface enp0s3 inet dhcp" >> $FILE
echo iface enp0s3 inet static >> $FILE
echo address $IP >> $FILE
echo netmask 255.255.255.0 >> $FILE
echo "#network 192.168.11.0" >> $FILE
echo "#broadcast 192.168.11.255" >> $FILE
echo gateway 192.168.11.1 >> $FILE
echo dns-nameservers 190.55.60.129 181.47.248.145 >> $FILE

/etc/init.d/networking restart
