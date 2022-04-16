#!/bin/bash

rpm -q qt-creator &> /dev/null
if [  $? -ne 0  ] ;then 
    yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    yum --disablerepo="*" --enablerepo="epel" list available
	
    yum clean all
	yum makecache fast
	#qt-creator tools
    yum  -y install qt qt-creator  qt5-qtxmlpatterns-devel qt5-qtbase-devel valgrind  kdbg ddd qt5-qtbase-mysql

fi

exit
