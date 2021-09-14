#!/bin/bash

if [ -n "$1" ] 2>/dev/null
then
    PROC_PID="$1"
else 
    PROC_PID='-'
fi

if [ "$2" -eq "$2" ] 2>/dev/null
then    
    STR_COUNT="$2"
else 
    STR_COUNT=10
fi

WHOLE_STAT=`netstat -tunapl`
PROCESS_STAT=`echo "$WHOLE_STAT" | grep "$PROC_PID" | awk '{print $5}'`
IPS=`echo "$PROCESS_STAT" | cut -d':' -f1`
SORTED_IPS=`echo "$IPS" | sort | uniq -c | sort`
CLEAR_IPS=`echo "$SORTED_IPS" | grep -oP '(\d+\.){3}\d+' | tail --lines="$STR_COUNT"`

echo "Output for $PROC_PID:"

echo "$CLEAR_IPS" | while read IP; do
    if [ -n "$IP" ] 2>/dev/null
    then    
        whois $IP | awk -v ip=$IP -F":" '/^Organization/ {print (ip, $2)}';
    else 
        echo 'Nothing was found'
    fi 
done