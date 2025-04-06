#! /bin/bash

RULE_PRESENT=$(sudo auditctl -l | grep -c -F "/var/www/html/Intranet") # Saves "1" if audit rule is already set up

if [$RULE_PRESENT -ne 1] # If the rule does not exist then create the rule
then
    sudo auditctl -w /var/www/html/Intranet/ -k intranet-change
fi 

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

LOG_DIR=/var/www/html/logs/logs_2025/

sudo mkdir $LOG_DIR &>/dev/null # Create the logs dir if it doesn't exist
sudo chmod -R 777 $LOG_DIR # Give permission to create dir and append the file

auditlogfile="$LOG_DIR/audit-$timestamp.log" # Save file name with time stamp into a variable

echo "Extract audit logs into $auditlogfile"
sudo ausearch -l -k intranet-change | sudo aureport -f -i >>$auditlogfile

sudo chmod -R 400 $LOG_DIR