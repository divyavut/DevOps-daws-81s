#!/bin/bash

DISKUSAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5

# echo "$DISKUSAGE" | while IFS= read -r line
# do
#     echo "$line"
# done

while IFS= read -r line
do
    DISKUSAGE_PER=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    if [ "$DISKUSAGE_PER" -ge "$DISK_THRESHOLD" ]
    then    
        echo "$PARTITION is using more Disk usage than $DISK_THRESHOLD, curent usage: $DISKUSAGE_PER. please check it"
    fi
done <<< $DISKUSAGE
