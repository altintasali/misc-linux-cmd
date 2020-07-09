#!/usr/bin/env bash

RESTORE_ME=$(readlink -f $1)
RESTORE_ME2=$(echo $RESTORE_ME | awk '{print substr($1,2)}')

DUPLICITY_BACK="file:///media/Backup/Data/"
DIROUT=$2

duplicity --no-encryption \
	  --file-to-restore $RESTORE_ME2 \
	  $DUPLICITY_BACK $DIROUT

