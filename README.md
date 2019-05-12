# mydump.sh
written by Marcel Stangenberger
based on John Donaths simple original .. :)

## Installation

 0. Place this script in /usr/local/sbin with execute rights
 1. Change the "CHANGEME!" part in the first line of the create_user.sql file
 2. Log in to MySQL as root and run source <pathto>/create_user.sql
 2. Change the PASS entry in mydump.sh to match what you entered in step 1
 3. Change the BASE entry to match to location of where you want to store the backups
 4. crontab this script to run once or multiple times a day
