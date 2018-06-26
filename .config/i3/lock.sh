#!/bin/bash

scrot /tmp/i3lock.png
IMAGE=/tmp/i3lock.png

BLURTYPE="8x9"

convert $IMAGE -level 0%,100%,0.6 -blur $BLURTYPE - $IMAGE
i3lock -i $IMAGE
