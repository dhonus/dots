#!/bin/sh

sudo cat /sys/class/backlight/amdgpu_bl1/brightness > /tmp/brightness

# get the smaller of 50 and the current brightness
brightness=$(awk 'BEGIN {print int(50 < '$(cat /tmp/brightness)') ? 50 : '$(cat /tmp/brightness)'}')
sudo tee /sys/class/backlight/amdgpu_bl1/brightness <<< $brightness
