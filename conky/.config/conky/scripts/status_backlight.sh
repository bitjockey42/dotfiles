#!/usr/bin/env sh
LEVEL=`xbacklight -get|xargs printf "%.0f"`

echo " $LEVEL%"
