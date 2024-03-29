#!/bin/bash
      
# Turn off screen blanking and power saving
export DISPLAY=:0.0
   
# Hide the mouse cursor
unclutter -idle 0.01 -root &

xset s off
xset -dpms
xset s noblank

/usr/bin/chromium-browser --incognito --start-fullscreen --noerrdialogs --disable-infobars --kiosk https://www.youtube.com/watch?v=Xrgk023l4lI &
