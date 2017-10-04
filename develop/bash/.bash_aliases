#!/bin/bash --
#
# "$HOME"/.bash_aliases by milsen
#

# cd aliases
alias cda='cd ~/art'
alias cdb='cd ~/bin'
alias cdd='cd ~/doc'
alias cde='cd ~/etc'
alias cdm='cd ~/media'
alias cdo='cd ~/other'
alias cdp='cd ~/pkg'
alias cds='cd ~/src'
alias cdt='cd ~/tmp'
alias cdw='cd ~/wall'

alias cdB1='cd ~/doc/Studium/B1/'
alias cdB2='cd ~/doc/Studium/B2/'
alias cdB3='cd ~/doc/Studium/B3/'
alias cdB4='cd ~/doc/Studium/B4/'
alias cdB5='cd ~/doc/Studium/B5/'
alias cdB6='cd ~/doc/Studium/B6/'
alias cdB7='cd ~/doc/Studium/B7/'
alias cdM1='cd ~/doc/Studium/M1/'
alias cdM2='cd ~/doc/Studium/M2/'
alias cdM3='cd ~/doc/Studium/M3/'
alias cdM4='cd ~/doc/Studium/M4/'
alias cdM5='cd ~/doc/Studium/M5/'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# ls aliases
alias ll='ls -alFh'   # list all files in list format with classifer
alias la='ls -A'      # list all files and dirs  except .- and ..-dir
alias l='ls -CF'      # list entries in columns with classifier

# tree aliases
alias treea="tree -a -I '.git' --dirsfirst" # tree of all files except .git-dirs

# apt aliases
if [ -n "$(command -v apt-get)" ]; then
  alias apts="pretty_apt_search"
  alias aptS="apt-cache show"
  alias apti="sudo apt-get install"
  alias aptc="sudo apt-get autoclean"
  alias aptU="sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoclean"
fi

# set color usage of ls, dir and grep
if [ -x /usr/bin/dircolors ]; then
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# do not remove files by accident - prompt before each use of cp, mv and rm
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# remove all temporary files
alias rm~="find . -type f -name '*~' -not -iwholename '*Trash*' -exec rm -i {} \;"

# default options for programming langaguages/environments
alias ipyno='ipython notebook --pylab=inline --ip=localhost'
alias octavep='octave --persist'

# other aliases
alias gallery='feh -F -d -S filename'
alias powertab='~/pkg/powertabeditor/build/bin/powertabeditor'
alias qutebrowser='qutebrowser --backend=webengine'