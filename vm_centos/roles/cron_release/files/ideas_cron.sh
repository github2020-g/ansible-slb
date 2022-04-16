#!/usr/bin/env bash

/usr/bin/rsync -avP --delete --bwlimit=10000 lbjfs:/backup/ideas2_intel/ /data/bjsmith/ideas2_intel/ &> /dev/null
