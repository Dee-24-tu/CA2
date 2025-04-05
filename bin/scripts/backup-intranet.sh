#! /bin/bash

# Create a variable to be the signiture stamp for filename purposes
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

BACKUP_SOURCE_PATH="/var/www/html/Intranet/"

sudo mkdir /var/www/html/ackups &>/dev/null # Create a backup directory if it does not exist
BACKUP_DESTINATION="/var/bin/Backups/Intranet-backup-$timestamp.zip"

# Change permissions so no one can edit the file
sudo chmod -R 000 $BACKUP_SOURCE_PATH

# Save backup into a compressed file with time stamp on it and move to another folder
echo "Backing up $BACKUP_DESTINATION $BACKUP_SOURCE_PATH

# Change permission back to normal
sudo chmod -R 744 $BACKUP_SOURCE_PATH

echo ""