#!/usr/bin/bash

#
# ~/.xinitrc
#

# keyboard layout
# toggle dvorak <-> qwerty with alt+shift
# caps lock -> escape
setxkbmap -layout us,us -variant dvorak, -option caps:escape,grp:alt_shift_toggle

# keyboard repeat rate; mouse accel; bell off; blanking off
xset r rate 375 30 mouse 5/3 0 b off s off

# hide idle cursor
unclutter -idle 4 -jitter 1 -root &


# host-specific
case `hostname` in
  affinity)
    fontsize='9.5'
    xset dpms 180
    redshift &> /dev/null &
    numlockx on
  ;;

  ice9)
    fontsize='11.5'
    xset dpms 180
    redshift &> /dev/null &
    touchpad on
  ;;

  serenity)
    fontsize='13'
    xset -dpms
    xrandr --output HDMI2 --set 'Broadcast RGB' 'Full'
    numlockx on
  ;;
esac


# Xresources
xrdb -merge ~/.Xresources
xrdb -merge <<< "urxvt.font: xft:monospace:size=$fontsize"


# start window manager
exec i3
