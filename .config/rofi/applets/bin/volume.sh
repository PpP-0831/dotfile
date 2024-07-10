#!/usr/bin/env bash

sleep 0.1

rofi_cmd() {
  mute_status=""
  unmute_status=""
  if [[ "$(pactl get-source-mute @DEFAULT_SOURCE@)" =~ "yes" ]]; then
    mute_status="-u 3"
  else
    unmute_status="-a 3"
  fi
  if [[ "$(pactl get-sink-mute @DEFAULT_SINK@)" =~ "yes" ]]; then
    [ -n "$mute_status" ] && mute_status+=",2" || mute_status="-u 2"
  else
    [ -n "$unmute_status" ] && unmute_status+=",2" || unmute_status="-a 2"
  fi

  mic=$(pactl get-source-volume @DEFAULT_SOURCE@ | grep -oP '\d+%' | head -n 1)
  speaker=$(pamixer --get-volume-human)
  message="Pipewire - Speaker: $speaker, Mic: $mic"
  rofi -dmenu -p "set your volume" \
    -theme "$HOME/Dotfiles/.config/rofi/applets/applet.rasi" \
    -mesg "$message" $mute_status $unmute_status
}

increase=" "
decrease=" "
mute=" "
mute_mic=""
settings=" "

run() {
  chosen="$(echo -e "$increase\n$decrease\n$mute\n$mute_mic\n$settings" | rofi_cmd)"
  case $chosen in
    $increase) pamixer --increase 5 && run;;
    $decrease) pamixer --decrease 5 && run;;
    $mute)     pamixer --toggle-mute && run;;
    $mute_mic) pactl set-source-mute @DEFAULT_SOURCE@ toggle && run;;
    $settings) pavucontrol;;
    *)         exit 0;;
  esac
}

run
