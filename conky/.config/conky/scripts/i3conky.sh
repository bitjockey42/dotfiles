#!/usr/bin/env sh

echo "{ \"version\": 1, \"stop_signal\": 10, \"cont_signal\": 12, \"click_events\": true }"
echo "[[],"
conky -d -c ~/.config/conky/conky.conf
