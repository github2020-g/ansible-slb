#!/bin/bash

yum -y remove git git-*
rpm -U http://opensource.wandisco.com/rhel/7Workstation/git/x86_64/wandisco-git-release-7-2.noarch.rpm
yum install -y git

exit
