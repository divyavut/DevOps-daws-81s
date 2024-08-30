#!/bin/bash

DISKUSAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5

echo "$DISKUSAGE" | while IFS= read -r lile
do
    echo "$line"
done
