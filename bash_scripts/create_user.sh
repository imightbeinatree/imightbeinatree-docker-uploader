#!/bin/bash

if [ -f /.user_created ]; then
	echo "User already created!"
	exit 0
fi

if [[ $# -eq 2 ]]; then
	echo "Usage: $0 <new_username> <new_public_key>"
	exit 1
fi

echo "=> Creating user"
useradd -m -d/home/$1 $1
su  $1 <<'EOF'
  mkdir -p ~/.ssh
  cat $2 >> ~/.ssh/authorized_keys
EOF
echo "=> Done!"
touch /.user_created