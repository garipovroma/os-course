#!/bin/bash

max_time=0
backup_folder=0

for i in $(ls -d ~/*/); do
        dir_name=$(echo $i | cut -d"/" -f 4- | rev | cut -c 2- | rev)
        if [[ $dir_name =~ ^backup-[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
                dir_date=$(echo $dir_name |  cut -c 8-)
                date_in_seconds=$(date -d $dir_date +%s)
		if [[ $date_in_seconds -ge $max_time ]]; then
			max_time=$date_in_seconds
			backup_folder=$i
		fi
        fi
done

restore_folder=~/restore/
check_restore_folder_existance=$(test -d $restore_folder && echo 1)

if [[ ! $check_restore_folder_existance == "1" ]]; then
	mkdir $restore_folder
	echo $restore_folder created
fi

if [[ $max_time == "0" ]]; then
	echo There is no backup folder found at /home directory
else

	for i in $(ls -d $backup_folder*); do
		if [[ ! $i =~ ^.*\.[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
			file_name=$(echo $i | cut -d"/" -f 5- | rev | cut -c 1- | rev)
			#echo $file_name
			cp $i $restore_folder$file_name
		fi
	done
fi

