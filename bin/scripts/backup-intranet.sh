#! /bin/bash

# Create a variable to be the signiture stamp for filename purposes
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_SOURCE_PATH="/var/www/html/Intranet/"
sudo mkdir /var/bin/Backups &>/dev/null # Create a backup directory if it does not exist
BACKUP_DESTINATION="/var/bin/Backups/Intranet-backup-$timestamp.zip"


