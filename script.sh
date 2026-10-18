#!/bin/bash

LOGFILE="/var/log/syslog"

if [[ -n "$1" ]]; then
    LOGFILE="$1"
fi

if [[ ! -f "$LOGFILE" ]]; then
    echo "Fatal: file $LOGFILE not found" >&2
    exit 1
fi

grep -aiE "error|fail" "$LOGFILE" > report.txt

if [[ $? -eq 0 ]]; then
    echo "Success: report.txt contains $(wc -l < report.txt) lines"
else
    echo "Fatal: cannot collect logs to report.txt"
    exit $?
fi

