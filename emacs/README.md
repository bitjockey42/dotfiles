# Emacs

This is a homegrown `emacs` config that I have more or less had for the past 2 years.

Works best if your capslock is mapped to esc.

I use [cask](https://github.com/cask/cask) to manage packages. 

I also start up `emacs` in daemon-mode. 

Now with `evil-mode`!

## Usage

<kbd>C-[</kbd> is how you get out of `insert` mode.

<kbd>M-{h,j,k,l}</kbd> can be used to navigate between split panes.

The `<leader>` key is <kbd>'</kbd>.

<kbd><leader>n</kbd> invokes the `neotree` pane.
<kbd><leader>b</kbd> brings up the buffer switching modeline thingy.
<kbd><leader>k</kbd> kills a buffer.

<kbd>M-t</kbd> brings up the fuzzy file switching thing provided by `fiplr`.

## Installation

### On OS X

Install `cask` with `homebrew`:

	brew install cask

Then create a symlink from the `brew`-installed `cask` directory containing `cask.el` to `~/.cask`:

    ln -s /usr/local/cask/something/something ~/.cask

### On Arch Linux

Install `cask` from the [AUR](https://aur.archlinux.org/packages/cask/).

Then create a symlink from the `brew`-installed `cask` directory containing `cask.el` to `~/.cask`:

    ln -s /usr/share/cask ~/.cask

### General Installation

Once that's done, use `stow` to create symlinks from `~/.dotfiles/emacs` to `~/.emacs.d`:

	cd ~/.dotfiles && stow emacs

Then install the packages specified in the `Cask` file:

	cd ~/.emacs.d && cask install

## Installation (Arch Linux)

Create `~/.config/systemd/user/emacs.service`:

``` cfg
[Unit]
Description=Emacs: the extensible, self-documenting text editor

[Service]
Type=forking
ExecStart=/usr/bin/emacs --daemon
ExecStop=/usr/bin/emacsclient --eval "(kill-emacs)"
Restart=always

[Install]
WantedBy=default.target
```

Then enable it:

	systemctl --user enable emacs

## Note

I use the [Essential PragmataPro](http://www.fsd.it/fonts/pragmatapro.htm) font. 

