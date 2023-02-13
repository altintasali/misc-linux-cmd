#!/usr/bin/env bash

##########################################################################
## Project    : Download file from Google Drive
## Author     : Ali Altintas 
## Date       : 13.02.2023
##########################################################################

## Inspired from:
## https://stackoverflow.com/a/49444877/1488825

## Example file from: 
## https://drive.google.com/file/d/1ReTOuHsBHyW0TZ2D9mVdTzxAV0npyV7G/view
fileid="1ReTOuHsBHyW0TZ2D9mVdTzxAV0npyV7G"
filename="human_all.rds"

try=0
COMPLETE_CONDITION=0

echo "START"

until [ "$lastresult" = "$COMPLETE_CONDITION" ]; do
  let "try+=1"
  echo "Try ${try}..."
  curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
  wait
  curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename} -C -
  let "lastresult=$?"
  echo "Last Resultcode: $lastresult"
  wait
  rm ./cookie 
done

echo "UPLOAD COMPLETED AFTER $try TRY(S)"

exit 0
