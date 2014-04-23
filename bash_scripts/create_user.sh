#!/bin/bash

if [ -f /.user_created ]; then
	echo "User already created!"
	exit 0
fi

if [[ $# -eq 3 ]]; then
	echo "Usage: $0 <new_username> <new_public_key> <new_user_pass>"
	exit 1
fi

echo "=> Creating user"
useradd -m -d/home/$1 $1
echo "$3" | passwd $1 --stdin
su  $1 <<'EOF'
  mkdir -p ~/.ssh
  cat $2 >> ~/.ssh/authorized_keys
EOF
echo "=> Done!"
touch /.user_created