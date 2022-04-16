#!/bin/bash


cat >> /etc/bashrc <<EOF

#Add manually
export PATH=.:/bj_data11/bjsmith/smtool/ideas2_rh7:/opt/intel/impi_latest/intel64/bin:/opt/intel/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
export LD_LIBRARY_PATH=.:/bj_data11/bjsmith/smtool/ideas2_rh7
export QMAKESPEC=linux-icc-64


EOF

exit
