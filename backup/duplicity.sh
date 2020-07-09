#!/bin/sh

##########################################################################
## duplicity backup (Ali Altintas - 09.07.2020)
##########################################################################

## Example script from: https://wiki.archlinux.org/index.php/Duplicity

## Remote backup script. Requires duplicity and gpg-agent with the keys and passphrases loaded as root.
## Uses separate encryption and signing keys
## Usage:  'duplicity.sh'

src="/"
dest="file:///media/Backup/Data/"

archdir="/home/ali/.cache/duplicity"
logfile="/var/log/duplicity.log"

duplicity --no-encryption \
	 --verbosity info \
         --full-if-older-than 30D \
         --num-retries 3 \
         --asynchronous-upload \
         --volsize 100 \
         --log-file $logfile \
	 --archive-dir=$archdir \
	 --include '/Data/**' \
	 --include '/home/**' \
	 --include '/etc/**' \
	 --include '/usr/**' \
	 --include '/var/**' \
	 --include '/root/**' \
	 --exclude '**' \
         "$src" "$dest"

## Crontab automation as follows
## 	sudo crontab -e
##  	59 0 * * * /Backup/bin/duplicity.sh # Back-up every day at 00:59
