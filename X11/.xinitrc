cat ~/.colors/base16-ocean.light.xresources ~/.Xresources|xrdb -merge
xmodmap ~/.Xmodmap
compton -c -t-5 -l-5 -r3 -o.48 --inactive-dim 0.05 &
exec dbus-launch --exit-with-session --sh-syntax i3
