# X11 stuff

The `~/.colors` are cloned from `base16-xresources`:

``` sh
$ git clone https://github.com/chriskempson/base16-xresources.git ~/.colors
```

My `~/.xinitrc` concatenates the basic `~/.Xresources` that I have with one of `~/.colors`, and then that output is piped into `xrdb -merge`.

This way, `urxvt`'s color scheme is separate from its other configuration.

