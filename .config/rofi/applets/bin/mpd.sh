#!/usr/bin/env bash

player_list=$(playerctl -l)
players=()
IFS=$'\n' read -d '' -r -a players <<< "$player_list"
player_count=${#players[@]}
player_index=0

rofi_cmd() {
  message="Controlling: ${players[$player_index]}"
  rofi -dmenu -p "music time~" \
    -theme "$HOME/Dotfiles/.config/rofi/applets/applet.rasi" \
    -mesg "$message"
}

previous=""
playpause=""
next=""
stop=""
switch=""

player_index_add() {
  player_index=$((player_index + 1))
  if [[ "$player_index" == "$player_count" ]]; then
    player_index=0
  fi
}

run() {
  sleep 0.0005
  if [[ "$(playerctl --player=${players[$player_index]} status)" =~ "Playing" ]]; then
    playpause=""
  elif [[ "$(playerctl --player=${players[$player_index]} status)" == "Paused" ]]; then
    playpause=""
  fi
  
  chosen="$(echo -e "$previous\n$playpause\n$next\n$stop\n$switch" | rofi_cmd)"
  case $chosen in
    $previous)  playerctl --player=${players[$player_index]} previous && run;;
    $playpause) playerctl --player=${players[$player_index]} play-pause && run;;
    $next)      playerctl --player=${players[$player_index]} next && run;;
    $stop)      playerctl --player=${players[$player_index]} stop && run;;
    $switch)    player_index_add && run;;
    *)          exit 0;;
  esac
}

run
