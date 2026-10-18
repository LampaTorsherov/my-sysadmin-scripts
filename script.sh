#!/bin/bash

LOGFILE="/var/log/syslog"

if [[ -n "$1" ]]; then
    LOGFILE="$1"
fi

grep -aiE "error|fail" "$LOGFILE" > report.txt

