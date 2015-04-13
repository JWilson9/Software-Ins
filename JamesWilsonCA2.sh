#!/bin/bash

ROOT="/home/$USER/Desktop/"

ROOT_EXCLUDE="--exclude=/backup.tar.gz --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/run/* --exclude=/mnt/* --exclude=/media/* --exclude=/lost+found/* --one-file-system / "

# this directory is going to my folder called back up
DESTIN="/home/$USER/backup"
# name of the file
BACKUP="backup.tar.gz"
#CREATE="/dev /proc /sys /temp /run /mnt /media "

echo "************************************************"
echo "********* James Wilson's ***********************
      ********* Backup Menu     **********************"
echo "************************************************"
echo $DESTIN
OPTIONS="BACKUP RESTORE DESTINATION EXIT"
LIST="1)BACKUP 2)RESTORE 3)DESTINATION 4)EXIT"



# iterate through the loop looking for the keyword
select opt in $OPTIONS; do
# if the users hits exit, exit the program
if [ "$opt" = "EXIT" ]; then
    echo "GOODBYE!"
    sleep 1
    clear
    exit
# else if the user hits backup, execute this elif
elif [ "$opt" = "BACKUP" ]; then

    echo "BACKING UP FILES..."
    sleep 2
    #backing uo the files using the tar command
    # c creates a new backup archive, v will print what the tar is doing
    # p preserves the permissions of the files put in the archive
    # the z compresses the backup file with 'gzip' to make it smaller
    sudo tar -cvpzf $DESTIN/backup.tar.gz --exclude=/backup.tar.gz --exclude=/dev --eclude=/proc  --exclude=/sys --exclude=/tmp --exclude=/run --exclude=/mnt --exclude=/media --exclude=/lost+found --one-file-system /
    echo "BACKUP COMPLETE"
    sleep 2
    exit

elif [ "$opt" = "RESTORE" ]; then
    echo "RESTORING FILES..."
    sleep 2
    echo $BACKUP
    # restoring using tar 
    sudo tar xvzf $DESTIN/backup.tar.gz
    sleep 2

    #if [[ -e "/proc" ]]; then
    #        echo "$CREATE already exists! "
    #else
       #     mkdir $CREATE
        #    echo "$CREATE are created! "
    #fi
    echo "RESTORE COMPLETE..."
    exit
elif [ "$opt" = "DESTINATION" ]; then
    
    echo "CURRENT DESTINATION: $DESTIN/backup.tar.gz "
    echo "TO CHANGE ENTER THE NEW DESTINATION..."
    echo "TO LEAVE IT AS IS JUST PRESS ENTER..."
    read NEW_DESTIN
   
    clear

    # when you change the destionation it automatically backs it up
    # to this destination 
    sudo tar -cvpzf $NEW_DESTIN/backup.tar.gz --exclude=/backup.tar.gz --exclude=/dev --exclude=/proc  --exclude=/sys -- exclude=/tmp --exclude=/run --exclude=/mnt --exclude=/media --exclude=/lost+found --one-file-system /

    # it also restores the backup from the new destiation
    sudo tar xvzf $NEW_DESTIN/backup.tar.gz

else
    clear
    echo "ENTER 1 , 2, 3 or 4.."
    echo $LIST


fi
done
