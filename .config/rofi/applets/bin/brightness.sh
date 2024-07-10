#!/usr/bin/env bash

rofi_cmd() {
  message="Current brightness: $(brightnessctl -l | grep -oP '\d+%' | head -n 1)"
  rofi -dmenu -p "shiny" \
    -theme "$HOME/Dotfiles/.config/rofi/applets/applet.rasi" \
    -mesg "$message"
}

decrease=""
increase=""

run() {
  chosen="$(echo -e "$decrease\n$increase" | rofi_cmd)"
  case $chosen in
    $decrease) brightnessctl set 10%- && run;;
    $increase) brightnessctl set +10% && run;;
    *)         exit 0;;
  esac
}

run
