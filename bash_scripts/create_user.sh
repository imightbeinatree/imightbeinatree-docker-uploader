#!/bin/bash

if [ -f /.user_created ]; then
	echo "User already created!"
	exit 0
fi

if [[ $# -ne 3 ]]; then
	echo "Usage: $0 <new_username> <new_public_key> <new_user_pass>"
	echo "You supplied $# arguments: $0 $1 $2 $3"
	exit 1
fi

echo "=> Creating user $1"
useradd -m -d/home/$1 $1
echo "=> Creating password $3"
echo "$1:$3" | chpasswd
echo "=> Setting Authorized Key $2"
mkdir -p /home/$1/.ssh
echo "$2" > /home/$1/.ssh/authorized_keys
chown -R $1:$1 /home/$1/.ssh
echo "=> Done!"
touch /.user_created