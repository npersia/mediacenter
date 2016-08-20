USER='npersia'
FILE='/etc/group'


USER=$1
FILE=$2

sed 's/^.*vboxsf.*$/&'$USER'/g' -i $FILE
