#!/usr/bin/env sh

INTERFACE="wlp4s0"

QUAL=`iwconfig $INTERFACE | grep 'Link Quality=' | awk '{gsub(/[=/]/," "); print $3}'`
ESSID=`iwconfig $INTERFACE|grep 'ESSID'|awk '{gsub(/[:/"]/," "); print $5}'`

LABEL=""

echo "$LABEL $QUAL $ESSID"
