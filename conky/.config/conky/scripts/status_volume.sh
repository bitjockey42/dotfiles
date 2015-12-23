#!/bin/sh
muted() {
	amixer get Master -M|grep -oE -m1 "\[on\]"
}

level() {
	amixer get Master -M | grep -oE -m1 "[[:digit:]]*%" | tr -dc '0-9'
}

if [[ `muted` != "[on]" ]]; then
	icon=""
elif [[ `level` -lt 30 ]]; then
	icon=""
else
	icon=""
fi

echo "$icon $(level)%"
