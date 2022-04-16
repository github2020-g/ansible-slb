#!/bin/bash

grep "^%adm-bgcit" /etc/sudoers

if [  $? -ne 0  ] ;then  
cat >>  /etc/sudoers <<EOF
#Add manual
%adm-bgcit ALL=(ALL)  NOPASSWD: ALL
iar-analysis7  ALL=(ALL)  NOPASSWD: ALL

EOF

fi
exit
