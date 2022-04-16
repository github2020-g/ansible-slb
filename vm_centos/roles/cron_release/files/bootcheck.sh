#!/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# wait 20 minutes
sleep 1200

# if network is failed, do nothing
/bin/ping -c 1 163.184.167.1 | /bin/grep Unreachable &> /dev/null  && exit 0

# if samba service start failed, restart
/sbin/service smb status | /bin/grep stop &>/dev/null && /sbin/service smb restart
/sbin/service nmb status | /bin/grep stop &>/dev/null && /sbin/service nmb restart

# if ypbind service start failed, restart
/sbin/service ypbind status | /bin/grep stop &>/dev/null && /sbin/service ypbind restart

# restart rgs 
sleep 20 && init 3 && sleep 10 && init 5

exit 0
