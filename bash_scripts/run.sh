#!/bin/bash
if [ ! -f /.user_created ]; then
  /create_user.sh "$new_username" "$new_public_key"
fi

echo "=> Starting Supervisor - exec supervisord -n"
exec supervisord -n

