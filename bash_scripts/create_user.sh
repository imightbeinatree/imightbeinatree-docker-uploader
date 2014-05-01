#!/bin/bash

# run example:
# docker run -d -p 22 -v /dumpfiles/uuid:/uploads -e "new_username=michael" -e "new_public_key=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKNA+Sc+teVb3477RBYJlPmNfm5R30pYD6zsDnLWS1vD40Mnq+/333dR8gtuJcRTrttX5uvtZj4t0rFgwosgbqD0+qrXJojguqKzX6bLckezRcugnC9VnnaxMSun022FsXiWwwBKz6yffoGVSro9L1mq1fhiHaf8NtAJpk7QyLBI/Fqym5BkDHUTLHoZzw7b7EMs9te0Kq9qKQ6jVCu/y874OqkR+467adogW18WIalSUnxMtNiJasGFKuLjTM8+n6AyTjOK+HMndFCmh19uSxJQvUDWpL6h2w2X5+iaUBz39sR/EoEkAgzfnMFQDMDfX6o1jlpIfqv/MjsAlk4gTB michael@cloudspace.com"  imightbeinatree/uploader


if [ -f /.user_created ]; then
	echo "User already created!"
	exit 0
fi

if [[ $# -ne 2 ]]; then
	echo "Usage: $0 <new_username> <new_public_key>"
	echo "You supplied $# arguments: $0 $1 $2"
	exit 1
fi

echo "=> Creating user $1"
useradd -m -d/home/$1 $1

# user must have a password for ssh login via key to work with this configuration
echo "=> Setting Random Password for $1"
RUN echo "$1:$(pwgen -s 12 1)"|chpasswd

echo "=> Setting Authorized Key $2"
mkdir -p /home/$1/.ssh
echo "$2" > /home/$1/.ssh/authorized_keys
chown -R $1:$1 /home/$1/.ssh
chown -R $1:$1 /uploads
echo "=> Done!"
touch /.user_created