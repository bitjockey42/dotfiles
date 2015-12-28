#!/usr/bin/env sh

LEVEL_FILE=~/.dunst_backlight

touch $LEVEL_FILE

get_level=`xbacklight -get|xargs printf "%.0f"`

increase() {
	xbacklight -inc 10
	TEXT=$get_level
	notify
}

decrease() {
	xbacklight -dec 10 
	TEXT=$get_level
	notify
}

notify() {
	ID=$(cat $LEVEL_FILE)
	if [[ $ID -gt "0" ]]
	then
	dunstify -p -r $ID "Backlight: $TEXT" >$LEVEL_FILE
	else
	dunstify -p "Backlight: $TEXT" >$LEVEL_FILE
	fi
}

case "$1" in
	inc)
		increase
		;;
	dec)
		decrease
		;;
	*)
		echo $"Usage: $0 {inc|dec|mute}"
		exit 1
esac




