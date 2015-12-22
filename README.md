# dotfiles

I use [`stow`](http://www.gnu.org/software/stow/manual/stow.html) to manage these dotfiles, which is a GNU tool that manages symlinks.

## Information

These are dotfiles on my Macbook Pro.

## Installation

Use `hg` (mercurial) to clone, locally:

	hg clone ssh://hg@bitbucket.org/astrohckr/dotfiles ~/.dotfiles

## Usage

Go to the `~/.dotfiles` directory you cloned above:

	cd ~/.dotfiles

Then use `stow` to set up the links.

### Automated Setup

You just need to run `setup.sh` to install all the symlinks:

	./setup.sh install

If you want to undo that:

	./setup.sh uninstall

### Manual Setup

You will want to symlink the `.stow-global-ignore` to `$HOME/.stow-global-ignore` first so that the `README.md` files here are ignored in the symlinking process:

	stow stow

e.g. Setup the symlinks for the emacs configuration.

	stow emacs
