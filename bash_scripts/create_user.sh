#!/bin/bash

if [ -f /.user_created ]; then
	echo "User already created!"
	exit 0
fi

if [[ $# -eq 3 ]]; then
	echo "Usage: $0 <new_username> <new_public_key> <new_user_pass>"
	exit 1
fi

echo "=> Creating user $1"
useradd -m -d/home/$1 $1
echo "=> Creating password $3"
echo "$1:$3" | chpasswd
echo "=> Setting Authorized Key $2"
su  $1 <<'EOF'
  mkdir -p ~/.ssh
  echo $2 >> ~/.ssh/authorized_keys
EOF
echo "=> Done!"
touch /.user_created