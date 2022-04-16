#!/bin/bash


grep srv004bgc /etc/fstab

if [  $? -ne 0  ] ;then 
cat >>  /etc/fstab  <<EOF
srv004bgc:/IDEAS_LBJFS01 /ideas nfs nfsvers=3 0 0
bgc-nas002:/IDEAS_LBJFS02 /lbjfs2 nfs nfsvers=3 0 0
EOF

    [  -d /ideas   ] || mkdir /ideas
    [  -d /lbjfs2  ] || mkdir /lbjfs2
    mount -a
fi

exit
