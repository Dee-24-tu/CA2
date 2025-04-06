#! /bin/bash

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

LOG_DIR=/var/www/html/logs/logs_2025

sudo mkdir $LOG_DIR &>/dev/null # Create the logs dir if it doesn't exist
sudo chmod -R 777 $LOG_DIR # Give permission to create dir and append the file

healthfile="$LOG_DIR/system-health-$timestamp.log"

echo "Adding date"
sudo date >> $healthfile
echo "" >> $healthfile
echo "" >> $healthfile

echo "Appending VM stats"
sudo vmstat 3 5 >> $healthfile
echo "" >> $healthfile
echo "" >> $healthfile

echo "Appending memory stats"
sudo free -h >> $healthfile
echo "" >> $healthfile
echo "" >> $healthfile

echo "Appending io stats"
sudo iostat >> $healthfile
echo "" >> $healthfile
echo "" >> $healthfile

echo "Appending network connection stats"
sudo netstat -a >> $healthfile
echo "" >> $healthfile
echo "" >> $healthfile

sudo chmod -R 744 $LOG_DIR