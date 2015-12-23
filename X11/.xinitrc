cat ~/.colors/base16-chalk.dark.xresources ~/.Xresources|xrdb -merge

xmodmap ~/.Xmodmap

feh --randomize --bg-scale ~/Pictures/Wallpapers/*

exec dbus-launch --exit-with-session --sh-syntax i3
