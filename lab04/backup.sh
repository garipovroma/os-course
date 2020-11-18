#!/bin/bash


current_date=$(date +"%Y-%m-%d")
backup_directory_name=~/backup-$current_date
#ls $backup_directory_name

found=0
for i in $(ls -d ~/*/); do
	dir_name=$(echo $i | cut -d"/" -f 4- | rev | cut -c 2- | rev)
	if [[ $dir_name =~ ^backup-[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
		dir_date=$(echo $dir_name |  cut -c 8-)
		date1_in_seconds=$(date -d $dir_date +%s)
		date2_in_seconds=$(date +%s)
		upper_seconds_limit=$(echo 604800 + $date1_in_seconds | bc)
		if [[ $upper_seconds_limit -ge $date2_in_second ]]; then
			found=$i
			break;
		fi
	fi
done

date_message="["$(date +"%Y-%m-%d-%H-%M-%S")"]"

if [[ $found == "0" ]]; then
	found=$backup_directory_name
	mkdir $found

	cp ~/source/* $found

	files_list=$(ls $found -1 | awk '{printf("%s;", $1)}')
	
	echo $date_message "$found $current_date $files_list" >> ~/backup-report

else
	backup_printed_to_report="0"
	for i in $(ls -d ~/source/*); do
		file_name=$(echo $i | cut -d"/" -f 5-)
		backup_folder=$(echo $found | cut -d"/" -f 4- | rev | cut -c 2- | rev)
		file_to_check=~/$backup_folder/$file_name
		check_file_status=$(test -e $file_to_check && echo 1)
		if [[ $check_file_status == "1" ]]; then
			size1=$(wc -c $file_to_check | awk '{print $1}')
			size2=$(wc -c $i | awk '{print $1}')
			if [[ ! $size1 == $size2 ]]; then
				new_name_for_old_file=$file_to_check.$current_date
				mv $file_to_check $new_name_for_old_file
				cp $i $file_to_check
				if [[ $backup_printed_to_report == "0" ]]; then
					backup_printed_to_report=1
					echo /################################################################################################################## >> ~/backup-report
					echo $date_message backuped to ~/$backup_folder, date: $current_date : >> ~/backup-report			
				fi
				echo $i -\> $date_message $file_to_check >> ~/backup-report
				echo $date_message $file_to_check -\> $new_name_for_old_file >> ~/backup-report
			fi
		fi
	done	
fi

