# set keyboard mapping (ctrl and capslock swapped, AltGr becomes compose)
setxkbmap gb -option ctrl:swapcaps -option compose:ralt

# switch GTK and Qt to xim, so they pick up on my .XCompose sequences
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim

# setup trackstick tweaks and disable touchpad
synclient TouchpadOff=1
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Profile" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

# set background
fbsetbg -a ~/pictures/wallpaper/umbreon_minimalist_wallpaper_by_ecmc1093-d6l1a6e.jpg

# compositor, quick fades and a tiny inactive dim
compton -f -I 0.07 -O 0.08 -D 9 --inactive-dim 0.03 -b

# start redshift
redshift &

# run the wm
exec startfluxbox
