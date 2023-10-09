#!/bin/sh
brightness=$(cat /tmp/brightness)
sudo tee /sys/class/backlight/amdgpu_bl1/brightness <<< $brightness