#!/bin/sh

# /usr/local/bin/backlight.sh
# script to change my backlight brightness since xbacklight doesnt work on my laptop

BACKLIGHT_DIR=/sys/class/backlight/acpi_video0

test -d $BACKLIGHT_DIR || exit 1

MIN=0
MAX=$(cat $BACKLIGHT_DIR/max_brightness)
VAL=$(cat $BACKLIGHT_DIR/brightness)

if [ "$1" = down ]; then
    VAL=$((VAL-1))
elif [ "$1" = up ]; then
    VAL=$((VAL+1))
else
    echo $VAL
    exit 0
fi

if [ "$VAL" -lt $MIN ]; then
    VAL=$MIN
elif [ "$VAL" -gt $MAX ]; then
    VAL=$MAX
fi

echo $VAL > $BACKLIGHT_DIR/brightness

