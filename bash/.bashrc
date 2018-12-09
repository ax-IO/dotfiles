# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

#test -s ~/.alias && . ~/.alias || true


# added by Anaconda3 installer
export NOCONDA_PATH=/home/axiom/bin:/usr/local/bin:/usr/bin:/bin:/usr/lib/mit/bin:/usr/lib/mit/sbin

# Cabal
export NOCABAL_PATH=/home/axiom/bin:/usr/local/bin:/usr/bin:/bin:/usr/lib/mit/bin:/usr/lib/mit/sbin
export PATH="/home/axiom/.local/bin:/home/axiom/.cabal/bin:/home/axiom/anaconda3/bin:$PATH"

export EDITOR=vim

#GCC
export LD_LIBRARY_PATH= #/home/axiom/anaconda3/include/
export CPATH= #/home/axiom/anaconda3/include/

# Haskell : Stack
export XDG_DATA_DIRS="/home/axiom/anaconda3/share:$XDG_DATA_DIRS"

# https://www.alionet.org/content.php?812-D%E9couvrir-Powerline-et-l-installer-sous-openSUSE
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi

# Screenfetch
# if [ -f /usr/bin/screenfetch ]; then screenfetch -A openSUSE; fi

# NIX
source $HOME/.nix-profile/etc/profile.d/nix.sh
export NIX_PATH="nixpkgs=$HOME/.nix-defexpr/channels/"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Activate Vi-mode with <Escape>
# set -o vi

# Bash Aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
