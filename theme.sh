#!/bin/sh
 
function load_wp() { 
  swww img ~/Downloads/wallapper.jpg -t wipe --transition-duration .8 
}

killall waybar

if ! swww query; then
  swww init
fi
wal -i ~/Downloads/wallapper.jpg
load_wp
waybar
