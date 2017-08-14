#!/bin/bash

scrot /tmp/i3lock.png
IMAGE=/tmp/i3lock.png

BLURTYPE="8x9"

dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop

convert $IMAGE -level 0%,100%,0.6 -blur $BLURTYPE - $IMAGE
i3lock -i $IMAGE
