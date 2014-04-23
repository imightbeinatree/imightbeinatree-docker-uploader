#!/bin/bash
if [ ! -f /.user_created ]; then
  /create_user.sh
fi
