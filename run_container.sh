#!/usr/bin/env bash


if ! ./first_run.sh; then
    echo "Error with startup script"
    exit 1
fi

echo "Starting apache.."
/usr/sbin/apache2ctl -D FOREGROUND
