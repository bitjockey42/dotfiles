#!/usr/bin/env sh

LEVEL_FILE=~/.dunst_backlight
TEXT=""

touch $LEVEL_FILE

steps=10
current=$(echo "`xbacklight -get|xargs printf "%.0f"`/$steps" | bc)
bar=""

bar() {
	for i in `seq 1 $current`;
	do
		bar="$bar|"
	done
	echo $bar 
}

increase() {
	xbacklight -inc 10
	TEXT=`bar`
	notify
}

decrease() {
	xbacklight -dec 10 
	TEXT=`bar`
	notify
}

notify() {
	ID=$(cat $LEVEL_FILE)
	if [[ $ID -gt "0" ]]; then
		dunstify -p -r $ID "$TEXT" >$LEVEL_FILE
	else
		dunstify -p "$TEXT" >$LEVEL_FILE
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


