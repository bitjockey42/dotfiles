#!/usr/bin/env sh
if [ "$1" == "low" ]
then
 amixer -q set Master 3%- unmute
 ICON="/usr/share/icons/Adwaita/16x16/status/audio-volume-low.png"
 TEXT=$(amixer sget Master | tail -1 | cut -d' ' -f6 | sed 's/\(\[\|\]\)//g')
elif [ "$1" == "high" ]
then
 amixer -q set Master 3%+ unmute
 ICON="/usr/share/icons/Adwaita/16x16/status/audio-volume-high.png"
 TEXT=$(amixer sget Master | tail -1 | cut -d' ' -f6 | sed 's/\(\[\|\]\)//g')
elif [ "$1" == "mute" ]
then
 amixer -q set Master toggle
 ICON="/usr/share/icons/Adwaita/16x16/status/audio-volume-muted.png"
 TEXT=$(amixer sget Master | tail -1 | cut -d' ' -f8 | sed 's/\(\[\|\]\)//g')
else
 echo "Usage volume [low | high | mute]\n"
fi

ID=$(cat ~/.dunst_volume)
if [ $ID -gt "0" ]
then
 dunstify -p -r $ID -i $ICON "Volume: $TEXT" >~/.dunst_volume
else
 dunstify -p -i $ICON "Volume: $TEXT" >~/.dunst_volume
fi
