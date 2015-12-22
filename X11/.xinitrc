cat ~/.colors/base16-chalk.dark.xresources ~/.Xresources|xrdb -merge

xmodmap ~/.Xmodmap

feh --bg-scale ~/Pictures/Walls/glider.png

exec dbus-launch --exit-with-session --sh-syntax i3
