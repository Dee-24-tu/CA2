#! /bin/bash

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

LOG_DIR=/var/www/html/logs/logs_2025

sudo mkdir $LOG_DIR &>/dev/null # Create the logs dir if it doesn't exist
sudo chmod -R 777 $LOG_DIR # Give permission to create dir and append the file

healthfile="$LOG_DIR/system-health-$timestamp.log"