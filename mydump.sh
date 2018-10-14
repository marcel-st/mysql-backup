#!/bin/bash

USER=bckp
PASS=CHANGEME!
COPIES=2
BASE=$HOME

if [ $# -gt 0 ]; then
        DBLIST="$*"
else
        DBLIST=`mysql -u $USER --password=$PASS -s -e 'show databases'`
fi

for N in $DBLIST;
do
        case $N in
                "Database")
                                echo "ignoring Database"
                ;;
                "information_schema")
                                echo "ignoring Information_Schema"
                ;;
                "performance_schema")
                                echo "ignoring Performance_schema"
                ;;
                *)
                                echo "dumping $N"
                                i=$(($COPIES - 1))
                                while [ $i -ge 0 ];
                                do
                                        [ -s $BASE/$N.sql.$i.gz ] && mv $BASE/$N.sql.$i.gz $BASE/$N.sql.$(($i+1)).gz
                                        i=$(($i-1))
                                done
                                mysqldump -u $USER --opt --password=$PASS $N | gzip >$BASE/$N.sql.0.gz
                ;;
        esac
done
