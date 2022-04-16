#!/bin/bash

########## ulimit -a
##########core file size          (blocks, -c) 0
#echo '* hard core 0' >> /etc/security/limits.d/CIS.conf

cat >> /etc/sysctl.d/CIS.conf <<EOF
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1
net.ipv6.conf.all.accept_ra = 0
net.ipv6.conf.default.accept_ra = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0
fs.suid_dumpable = 0
EOF
 
ACCESS_ISSUE_MSG="
********************************************************
Welcome to the BGC IT system(s):
 
Use is restricted to Schlumberger authorized users who
must comply with the Information Security User Standard.
Usage is monitored; unauthorized use will be prosecuted.
 
If you proceed you are accepting the above.
********************************************************
"
 
if [ -f /etc/redhat-release ]; then
  echo "$ACCESS_ISSUE_MSG" > /etc/issue
  echo "$ACCESS_ISSUE_MSG" > /etc/issue.net
fi
 
if [ -f /etc/redhat-release ]; then
  chown root:root /boot/grub*/grub.c*
  chmod og-rwx /boot/grub*/grub.c*
fi

chown root:root /etc/crontab
chmod og-rwx /etc/crontab
chown root:root /etc/cron.daily
chmod og-rwx /etc/cron.daily
chown root:root /etc/cron.weekly
chmod og-rwx /etc/cron.weekly
chown root:root /etc/cron.monthly
chmod og-rwx /etc/cron.monthly
chown root:root /etc/cron.d
chmod og-rwx /etc/cron.d
chown root:root /etc/ssh/sshd_config
chmod og-rwx /etc/ssh/sshd_config
chmod -R g-wx,o-rwx /var/log/*

exit

