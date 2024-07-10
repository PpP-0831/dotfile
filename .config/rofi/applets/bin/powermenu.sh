#!/usr/bin/env bash

sleep 0.1

rofi_cmd() {
  message="Uptime: $(uptime -p | sed -e 's/up //g')"
  rofi -dmenu -p "so you are leaving..." \
    -theme "$HOME/Dotfiles/.config/rofi/applets/applet.rasi" \
    -mesg "$message"
}

lock=" "
suspend=""
logout=" "
reboot=" "
shutdown=" "

run() {
  chosen="$(echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd)"
  case $chosen in
    $lock)     hyprlock;;
    $suspend)  (sleep 1; systemctl suspend) & hyprlock;;
    $logout)   hyprctl dispatch exit;;
    $reboot)   systemctl poweroff;;
    $shutdown) systemctl reboot;;
    *)         exit 0;;
  esac
}

run
