#!/bin/bash

# run example:
# docker run -d -p 22 -v /dumpfiles:/uploads -e "new_username=michael" -e "new_user_pass=updog" -e "upload_uuid=6b40fddd-c173-43c7-844d-33d8862b71c3" -e "new_public_key=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKNA+Sc+teVb3477RBYJlPmNfm5R30pYD6zsDnLWS1vD40Mnq+/333dR8gtuJcRTrttX5uvtZj4t0rFgwosgbqD0+qrXJojguqKzX6bLckezRcugnC9VnnaxMSun022FsXiWwwBKz6yffoGVSro9L1mq1fhiHaf8NtAJpk7QyLBI/Fqym5BkDHUTLHoZzw7b7EMs9te0Kq9qKQ6jVCu/y874OqkR+467adogW18WIalSUnxMtNiJasGFKuLjTM8+n6AyTjOK+HMndFCmh19uSxJQvUDWpL6h2w2X5+iaUBz39sR/EoEkAgzfnMFQDMDfX6o1jlpIfqv/MjsAlk4gTB michael@cloudspace.com"  imightbeinatree/uploader


if [ -f /.user_created ]; then
	echo "User already created!"
	exit 0
fi

if [[ $# -ne 4 ]]; then
	echo "Usage: $0 <new_username> <new_public_key> <new_user_pass> <upload_uuid>"
	echo "You supplied $# arguments: $0 $1 $2 $3 $4"
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
mkdir -p /uploads/$4
chown $1:$1 /uploads/$4
echo "=> Done!"
touch /.user_created