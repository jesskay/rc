# set keyboard mapping
setxkbmap gb -option ctrl:swapcaps -option compose:ralt

# switch GTK and Qt to xim, so they inherit my .XCompose sequences
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim

# setup trackstick and disable touchpad
synclient TouchpadOff=1 \
          TrackstickSpeed=60
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

# compositor
compton -f -I 0.07 -O 0.08 -D 9 --inactive-dim 0.03 -b

# run the wm
exec startfluxbox
