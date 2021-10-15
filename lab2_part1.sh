#!/bin/sh

find /usr/src/kernels/3.10.0-1160.42.2.el7.x86_64/ -name *.h -exec grep -i "magic" {} \+ | wc -l
