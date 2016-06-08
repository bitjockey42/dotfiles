#!/usr/bin/env zsh

LEVEL_FILE=~/.dunst_backlight
TEXT=""

touch $LEVEL_FILE

steps=10

bar() {
	for i in `seq 1 $steps`;
	do
		if [[ $i -lt $current ]]; then
			bar="$bar▪"
		else
			bar_bg="$bar_bg▫"
		fi
	done
	echo "$bar$bar_bg"
}

increase() {
	xbacklight -inc 10
	level=`xbacklight -get|xargs printf "%.0f"`
	current=$(echo "$level/$steps" | bc)
	TEXT=`bar`
	notify
}

decrease() {
	xbacklight -dec 10 
	level=`xbacklight -get|xargs printf "%.0f"`
	current=$(echo "$level/$steps" | bc)
	TEXT=`bar`
	notify
}

notify() {
	ID=$(cat $LEVEL_FILE)
	if [[ $ID -gt "0" ]]; then
		dunstify -p -r $ID "   ◑     $TEXT" >$LEVEL_FILE
	else
		dunstify -p "   ◐      $TEXT" >$LEVEL_FILE
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


