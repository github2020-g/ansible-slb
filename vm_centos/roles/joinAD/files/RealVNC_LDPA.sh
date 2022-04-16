#!/bin/bash
#Function：install packages needed for joining domain
#Author：
#Date：


#Setting up domain accounts under Linux for RealVNC
RealVNC_LDPA(){
cat >  /etc/pam.d/vncserver.custom  << EOF
auth include password-auth
account include password-auth
session include password-auth
EOF

cat > /etc/vnc/config.d/common.custom  << EOF
PamApplicationName=vncserver.custom
EOF

systemctl restart vncserver-x11-serviced.service

pmt_user=$(grep -c "Permissions" /root/.vnc/config.d/vncserver-x11)
vnc_cfg="/root/.vnc/config.d/vncserver-x11"
  #Add user group to vnc configure file so that users can login vnc
  if [ -f ${vnc_cfg} -a ${pmt_user} -ne '0' ];then
      sed -i.ori.$(date +%F_%H%M%S) 's/%sudo:f/yguo22:d,adm-bgcit:d,%bgc_ideas_engine_kits_contributtor:d,%Other_IAR_Service_Contributors:d,%sudo:f/g' ${vnc_cfg}
  fi
  if [ -f ${vnc_cfg} -a ${pmt_user} -eq '0' ];then
     echo "Permissions=adm-bgcit:d,:f,yguo22:d,%bgc_ideas_engine_kits_contributtor:d,%Other_IAR_Service_Contributors:d,%admin:f,%sudo:f,%wheel:f" >> ${vnc_cfg}
  fi

systemctl restart vncserver-x11-serviced.service
}

RealVNC_LDPA

authconfig --enablemkhomedir --update

#  --enablemkhomedir       create home directories for users on their first login
#  --update参数的话，就必须是root权限用户，配置会被保存，仅仅修改的文件会被重新写入

dbus-daemon --system

