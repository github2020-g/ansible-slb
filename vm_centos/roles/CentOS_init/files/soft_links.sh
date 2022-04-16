#!/bin/bash


#softlink for project team after mount NFS

[ -f "/usr/lib64/libgif.so" ] || ln -s /usr/lib64/libgif.so.4  /usr/lib64/libgif.so
if [ -d /ideas -a -d /lbjfs2 ];then
    ln -s /ideas/IAR_IAP_Backup/apps/intel_ver2017 /opt/intel
    mkdir /apps
    ln -s /lbjfs2/iar/apps/common_sub /apps/common
    ln -s /ideas/transfer/ /transfer
    ln -s /ideas/bj_data11/ /bj_data11
    ln -s /ideas/bj_data11/bjsmith/smtool/data58/ /data58
    ln -s /ideas/IAR_IAP_Backup /IAR_IAP_Backup
    ln -s /ideas/IDEAS_Development_Backup /IDEAS_Development_Backup
fi

exit
