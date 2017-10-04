#!/bin/bash --
#
# "XDG_CONFIG_HOME"/bash/bash_functions.sh by milsen
#

# alert after command execution with terminal or error icon and command name
# example usage: sleep 10; alert
alert() {
  notify-send --urgency=low \
    -i "$([ $? = 0 ] && echo terminal || echo error)" \
    "$(history|tail -n1|sed -e 's/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//')"
}


# backup data on external hard drive using rsync
backup_rsync() {
  if [ ! -d /media/sdb1-usb-Intenso_External/ ]; then
    echo "No dir /media/sdb1-usb-Intenso_External/ found."
    return
  fi

  sudo rsync -aAX \
    --info=progress2,symsafe,stats3 \
    --delete \
    --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} \
    --temp-dir="$HOME"/.cache/rsync/tmp/ \
    / /media/sdb1-usb-Intenso_External
}


# fuzzy directory-change
cdf() {
  cd *"$1"*/
}


# most frequently used commands
mfu() {
  history | \
    awk '{CMD[$2]++;count++;}END {for (a in CMD)print CMD[a] " "  CMD[a]/count*100 "% " a;}' | \
    grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head "-n${1:-10}"
}

# general function for system commands
q() {
  case "$1" in
    k|killx)    killall xmonad ;;
    l|lock)     slock; exit ;;
    p|poweroff) systemctl poweroff ;;
    r|reboot)   systemctl reboot ;;
    s|suspend)  systemctl suspend; exit ;;
    *)          return ;;
  esac
}

weather() {
  curl -s wttr.in/"$1"?"${2:-0}"
}

webcopy() {
  wget --mirror --convert-links --adjust-extension --page-requisites --no-parent "$1"
}