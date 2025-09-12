#!/bin/sh

# Update icon based on selection state
if [ "$SELECTED" = "true" ]; then
    sketchybar --set "$NAME" icon="" icon.color=0xff88c0d0
else
    sketchybar --set "$NAME" icon="" icon.color=0xff4c566a
fi
