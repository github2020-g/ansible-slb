#!/bin/bash


rpm -q realvnc-vnc-server &> /dev/null
if [  $? -ne 0  ] ;then 

  #yum -y localinstall /root/ansible/script/VNC-Server-6.6.0-Linux-x64.rpm
  
  #License expiry: Expires on 2022-03-20
  #vnclicense -add 6FADB-6HDBW-X5DRH-2BEUG-SUY73
  
  #License expiry: Expires on 2023-03-20
   vnclicense -add 8BA2H-N4NTS-2GEQ4-6BENU-74Y73
  
  #After install realvnc , we need to install xorg package
  yum groupinstall "X Window System" "GNOME Desktop" -y
  
fi

exit
