#!/usr/bin/env bash

# Currently experimental, use with proper caution

RESTORE_ME=$(readlink -f $1)
RESTORE_ME2=$(echo $RESTORE_ME | awk '{print substr($1,2)}')
RESTORE_BASE=$(echo $RESTORE_ME | awk -F "/" '{print $NF}')

DUPLICITY_BACK="file:///media/Backup/Data/"
DIROUT=$2/$RESTORE_BASE

duplicity --no-encryption \
	  --file-to-restore $RESTORE_ME2 \
	  $DUPLICITY_BACK $DIROUT

