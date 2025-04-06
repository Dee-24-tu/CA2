#! /bin/bash

cd /var/www/html/bin/scripts/ # Scripts location

./backup-intranet.sh
./transfer-intranet-to-live.sh
./audit-report.sh