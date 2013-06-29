#!/bin/bash

MM=`~/MyScripts/memory.py | awk '/Inactive/ {print $3}'`

echo "Testing status of inactive free memory..."

if [ "$MM" -gt "500" ]; then
    echo "You have too much inactive free memory." $MM"MB Releasing now..."
    purge
    exit 0
else
    echo "Memory ammount" $MM"MB does not meet purge threshold."
    exit 0
fi