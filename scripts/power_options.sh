#!/bin/sh
lock() {
  if [ -d "$HOME/myawesomeconfig/scripts" ]
  then
    i3lock -i ~/myawesomeconfig/scripts/naomi_solarsys-dracula_i3lock.png
  else
    i3lock -c "#282a36"
  fi
}

case "$1" in
  lock)
    lock
    ;;
  suspend)
    systemctl suspend
    ;;
  reboot)
    systemctl reboot
    ;;
  shutdown)
    systemctl poweroff
    ;;
  *)
    echo "Invalid option!"
    exit 2
esac

exit 0

