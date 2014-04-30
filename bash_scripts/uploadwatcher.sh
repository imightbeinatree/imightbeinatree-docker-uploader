#!/bin/bash

FOUND_FILE=""
FILE_FINISHED="no"

while :
do
  
  if [ -f /uploads/.file_finished_uploading ]; then
  	echo "File Uploaded!"
  	exit 0
  fi

  if [[ $# -ne 1 ]]; then
  	echo "Usage: $0 </path/to/directory/to/watch>"
  	echo "You supplied $# arguments: $0 $1"
  	exit 1
  fi
  
  # check folder for finished file
  if [$FILE_FOUND == ""]; then
    FILE_FOUND=$(ls /uploads)
  else
    FILE_FINISHED=$(lsof|grep "/uploads/$FILE_FOUND")
    if [$FILE_FINISHED == ""]; then
      touch /uploads/.file_finished_uploading
    fi
  fi

  sleep 30s
done

