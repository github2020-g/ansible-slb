#!/bin/bash


/opt/MegaRAID/MegaCli/MegaCli64 -PDlist -aALL -NoLog | grep Slot | awk 'BEGIN{printf "{\"data\":[\n\n"} {printf ",\n{ \"{#SLOT_NUM}\":\"%s\"}", $NF, $1;} END{ printf "\n\t]\n}\n";}' | sed '/^,$/d' > /opt/disk_monitor/megacli_lld.list

