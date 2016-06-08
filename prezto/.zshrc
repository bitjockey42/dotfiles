#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
source $HOME/.zsh.d/custom.zsh
source $HOME/.zsh.d/paths.zsh
source $HOME/.zsh.d/vcs_bookmarks.zsh

if [[ `uname` == 'Darwin' ]]; then
    source $HOME/.zsh.d/osx.zsh
fi


