# HAZESOFT-T3

#Usage

For making executable

-chmod +x script_name/filename

In my case the command was chmod +x backup.sh.

Running the script

./filename /path of directory to make the archive

In my case the command was ./backup.sh $HOME/Desktop/HAZESOFT-T3.

#Prerequisites
-Bash shell

#Notes
-The backup archive will be saved on your Desktop.
-The archive filename includes a timestamp for uniqueness.
-Check the script for success or failure messages.

#Steps

#!/usr/bin/bash
-specifies that the script should be executed using the Bash shell.

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory_to_backup>"
    exit 1
fi

-This checks if the number of arguments passed to the script is not equal to 1.
-If the condition is true, it prints a usage message, including the script name ($0), and exits.
-This exits the script with a status code of 1, indicating an error.

directory_to_backup="$1"
-This assigns the value of the first argument passed to the script ($1) to the variable directory_to_backup.

backup_directory="$HOME/Desktop"
-This sets the variable backup_directory to the path where you want to store your backup archives. In this case, it's the "Desktop" directory for the current user.

timestamp=$(date +"%Y%m%d_%H%M%S")
-This uses the date command to create a timestamp in the format YYYYMMDD_HHMMSS and assigns it to the variable timestamp.

backup_filename="${timestamp}.tar.gz"
-This constructs the backup filename by combining the timestamp and the file extension ".tar.gz".

tar -czvf "${backup_directory}/${backup_filename}" "${directory_to_backup}"
-This creates a compressed tar archive of the specified directory (${directory_to_backup}) and saves it with the constructed filename in the specified backup directory (${backup_directory}).

if [ $? -eq 0 ]; then
    echo "Backup successful. Archive saved as ${backup_filename} on the Desktop."
else
    echo "Backup failed."
fi

-This checks if the exit status of the last command (tar in this case) is 0, indicating success.
-If the backup was successful, it prints a success message.
-If the exit status was not 0 (indicating failure),
-It prints a failure message.