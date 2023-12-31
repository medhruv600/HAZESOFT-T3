#!/usr/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory_to_backup>"
    exit 1
fi

directory_to_backup="$1"

backup_directory="$HOME/Desktop"

timestamp=$(date +"%Y%m%d_%H%M%S")

backup_filename="${timestamp}.tar.gz"
tar -czvf "${backup_directory}/${backup_filename}" "${directory_to_backup}"

if [ $? -eq 0 ]; then
    echo "Backup successful. Archive saved as ${backup_filename} on the Desktop."
else
    echo "Backup failed."
fi
