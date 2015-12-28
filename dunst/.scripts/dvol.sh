#!/usr/bin/env zsh

LEVEL_FILE=~/.dunst_volume
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

increase_volume() {
	amixer -q sset Master,0 5+ unmute
	level=$(amixer sget Master | tail -1 | cut -d' ' -f6 | sed 's/\(\[\|\]\)//g' | sed 's/%//')
	current=$(echo "$level/$steps" | bc)
	TEXT=`bar`
	notify
}

decrease_volume() {
	amixer -q sset Master,0 5- unmute
	level=$(amixer sget Master | tail -1 | cut -d' ' -f6 | sed 's/\(\[\|\]\)//g' | sed 's/%//')
	current=$(echo "$level/$steps" | bc)
	TEXT=`bar`
	notify
}

mute_volume() {
	amixer -q sset Master,0 toggle
	TEXT="muted"
	notify
}

notify() {
	ID=$(cat $LEVEL_FILE)
	if [[ $ID -gt "0" ]]
	then
	dunstify -p -r $ID "VOL       $TEXT" >$LEVEL_FILE
	else
	dunstify -p "VOL       $TEXT" >$LEVEL_FILE
	fi
}

case "$1" in
	inc)
		increase_volume
		;;
	dec)
		decrease_volume
		;;
	mute)
		mute_volume
		;;
	*)
		echo $"Usage: $0 {inc|dec|mute}"
		exit 1
esac


