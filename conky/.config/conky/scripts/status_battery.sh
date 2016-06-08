#!/usr/bin/env sh 

BAT=`acpi -b | awk '{gsub(/%,/,""); print $4}' | sed 's/%//g'`
STATUS=`acpi -b | awk '{gsub(/,/,""); print $3}'`

# Set Icon
icon=""
label=""

if [[ $STATUS != "Discharging" ]]; then
	icon=""
	label=$STATUS
elif [[ $BAT -lt 10 ]]; then
	icon=""
	label="$BAT%"
elif [[ $BAT -lt 40 ]]; then
	icon=""
	label="$BAT%"
elif [[ $BAT -lt 70 ]]; then
	icon=""
	label="$BAT%"
elif [[ $BAT -lt 90 ]]; then
	icon=""
	label="$BAT%"
else
	icon=""
	label="$BAT%"
fi

echo "$icon $label"

