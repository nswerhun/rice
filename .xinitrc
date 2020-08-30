#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Get rid of power settings
xset s off
xset -dpms

# Make keyboard actually usable
xset r rate 300 50

# Start compositor
picom &

# Start dwmblocks
dwmblocks &

# Set background
feh --bg-fill /home/noah/pics/old-town.png &

# See if there is any packages available to upgrade, to display in statusbar
updateupgr &

# Start puleeffects for decent audio
pulseeffects --gapplication-service &

# Start dwm
exec dwm
