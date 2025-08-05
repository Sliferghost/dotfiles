#!/bin/sh

battery=(
  script="$PLUGIN_DIR/battery.sh"
  background.color="$PURE_BLACK"
  background.drawing=off
  icon.font="$FONT:Regular:19.0"
  icon.font.size=19
  padding_right=0
  padding_left=0
  update_freq=120
  updates=on
)
sketchybar --add item battery right \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke
