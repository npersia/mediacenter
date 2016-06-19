wget -q -O - https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | sudo apt-key add -

echo "deb http://mkvtoolnix.download/ubuntu/xenial/ ./" >> /etc/apt/sources.list
echo "deb-src http://mkvtoolnix.download/ubuntu/xenial/ ./" >> /etc/apt/sources.list
apt-get update
apt-get install mkvtoolnix -y
