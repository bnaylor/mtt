#!/usr/bin/env bash

webdir=/var/www/html
datadir="${webdir}/db"
db="${datadir}/todolist.db"

mounted=$(mount | grep "${datadir}")
if [ -z "${mounted}" ] ; then
    echo "No data mount (${datadir}), this isn't what you want"
    sleep 5
    exit 1
fi

cd "${webdir}"

dbsz=$(stat -c "%s" "${db}")
if [ -z "$dbsz" ] || [ "${dbsz}" = "0" ] ; then
    echo "Looks like a first-time install, initializing db.."
    cp db_template/* db/
else
    echo "DB already has data, skipping init."    
    rm -f setup.php
fi

exit 0
