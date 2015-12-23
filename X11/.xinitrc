cat ~/.colors/base16-chalk.dark.xresources ~/.Xresources|xrdb -merge
xmodmap ~/.Xmodmap
exec dbus-launch --exit-with-session --sh-syntax i3
