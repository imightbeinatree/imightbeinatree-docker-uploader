#!/bin/bash
if [ ! -f /.user_created ]; then
  /create_user.sh "$new_username" "$new_public_key" "$new_user_pass" "$upload_uuid"
fi

/usr/sbin/sshd -D
