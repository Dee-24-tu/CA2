#! /bin/bash

create_user(){
    read -p "Enter new username: " username

    # Checks if the name already exist within files
    id "$username" &>/dev/null
    USER_CHECK_RESULT=$?
    if [ $USER_CHECK_RESULT -ep 0 ]; then
        echo "User '$username' already exists. ****"
    else
        sudo useradd -m -s /bin/bash "$username"
        # Password is required to enter twice as is rejected for the first time
        sudo passwd $username
        echo "New user '$username' created and added."
    fi
}

cd /var/bin/scripts/

run_backup(){
    ./backups-intranet.sh
}

transfer_changes(){
    # Sync changes made in each file into Live folder
    ./transfer-intranet-to-live.sh
}

user_activity(){
    ./audit-report.sh
}


