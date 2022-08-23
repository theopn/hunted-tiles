#!/usr/bin/env bash

lock() {
  if [ -d "$HOME/hunted-tiles/scripts" ]
  then
    i3lock -i ~/hunted-tiles/scripts/naomi_solarsys-dracula_i3lock.png
  else
    i3lock -c "#282a36"
  fi
}

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi"

# Options
shutdown="shutdown"
reboot="reboot"
lock="lock"
suspend="suspend"
logout="logout"

# Confirmation
confirm_exit() {
  rofi -dmenu -i -no-fixed-num-lines -p "Really?"
}

# Message
msg() {
  rofi -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"

case $chosen in
  $shutdown)
    ans=$(confirm_exit &)
    if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
      systemctl poweroff
    elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
      exit 0
    else
      msg
    fi
  ;;

  $reboot)
  ans=$(confirm_exit &)
    if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
      systemctl reboot
    elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
      exit 0
    else
      msg
    fi
  ;;

  $lock)
    lock
  ;;

  $suspend)
    amixer set Master mute
    systemctl suspend
  ;;

  $logout)
    ans=$(confirm_exit &)
    if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
      lua "awesome.quit()"
    elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
      exit 0
    else
      msg
    fi
  ;;
esac

