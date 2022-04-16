#!/bin/bash

/opt/MegaRAID/MegaCli/MegaCli64 -Pdlist -aALL -NoLog | grep -Ei '(Slot Number|Media Error Count|Other Error Count|Predictive Failure Count|Raw Size|Firmware state|Inquiry Data)' | sed -e "s:\[0x.*Sectors\]::g" > /opt/disk_monitor/pdinfo.txt

/usr/bin/split -l 7 -d /opt/disk_monitor/pdinfo.txt /opt/disk_monitor/pdinfo

if /opt/MegaRAID/MegaCli/MegaCli64  -LDInfo -Lall -aALL -NoLog | grep Degraded &> /dev/null 
then
	echo 1 > /opt/disk_monitor/checkraidlevel
else
	echo 0 > /opt/disk_monitor/checkraidlevel
fi
