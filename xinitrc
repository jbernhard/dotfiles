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

# Xresources
xrdb -merge ~/.Xresources

# hide idle cursor
unclutter -idle 4 -jitter 1 -root &

# wallpaper
[[ -x ~/.fehbg ]] && ~/.fehbg

# qt5 style
export QT_QPA_PLATFORMTHEME=qt5ct


# host-specific
case $(hostname) in
  affinity)
    xset dpms 180
    redshift &> /dev/null &
    numlockx on
  ;;

  ice9)
    xset dpms 180
    redshift &> /dev/null &
  ;;

  serenity)
    xset -dpms
    xrandr --output HDMI2 --set 'Broadcast RGB' 'Full'
    numlockx on
  ;;
esac


# start window manager
exec i3
