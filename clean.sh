#!/usr/bin/env bash

find /var/cache/apt/archives/ -name '*deb' |
perl -ne 'print "$1\n" if /([^\/_]+)_/'|
sort -u |
while read a; do
    find /var/cache/apt/archives/ -name "${a}_*" | 
    sort -r | tail -n+1 | xargs -rp rm -v;
done
