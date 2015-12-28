#!/usr/bin/env sh

increase_volume() {
	amixer -q sset Master,0 10+ unmute
	TEXT=$(amixer sget Master | tail -1 | cut -d' ' -f6 | sed 's/\(\[\|\]\)//g')
	ID=$(cat ~/.dunst_volume)
	notify
}

decrease_volume() {
	amixer -q sset Master,0 10- unmute
	TEXT=$(amixer sget Master | tail -1 | cut -d' ' -f6 | sed 's/\(\[\|\]\)//g')
	notify
}

mute_volume() {
	amixer -q sset Master,0 toggle
	TEXT=$(amixer sget Master | tail -1 | cut -d' ' -f8 | sed 's/\(\[\|\]\)//g')
	notify
}

notify() {
	ID=$(cat ~/.dunst_volume)
	if [[ $ID -gt "0" ]]
	then
	dunstify -p -r $ID "Volume: $TEXT" >~/.dunst_volume
	else
	dunstify -p "Volume: $TEXT" >~/.dunst_volume
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





