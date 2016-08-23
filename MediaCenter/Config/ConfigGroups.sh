USER='npersia'

USER=$1

usermod -aG vboxsf $USER
usermod -aG docker $USER
