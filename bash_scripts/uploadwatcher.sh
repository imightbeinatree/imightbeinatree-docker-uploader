#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 </path/to/directory/to/watch>"
  echo "You supplied $# arguments: $0 $1"
  exit 1
fi

FILE_STARTED=""
FILE_FINISHED="no"

while :
do
  # check folder for finished file
  if [$FILE_STARTED == ""]; then
    echo "File started returned blank value: $FILE_STARTED"
    FILE_STARTED=$(ls /$1)
    echo "new value: $FILE_STARTED"
  else
    echo "File being Uploaded!"
    FILE_FINISHED=$(lsof|grep "/$1/$FILE_FOUND")
    if [$FILE_FINISHED == ""]; then
      echo "File Finished Uploading!"
      touch /$1/.file_finished_uploading
    fi
  fi

  if [ -f /$1/.file_finished_uploading ]; then
    echo "File Recorded as Uploaded!"
    exit 0
  fi

  sleep 30s
done

