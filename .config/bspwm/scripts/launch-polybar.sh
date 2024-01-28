#!/bin/bash

killall -q polybar

polybar primary 2>&1 | tee -a /tmp/polybar.log & disown
polybar secondary 2>&1 | tee -a /tmp/polybar.log & disown
