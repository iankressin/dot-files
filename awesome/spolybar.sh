#!/bin/sh

killall -q polybar

polybar left &
polybar right &
polybar middle &
polybar tray &
polybar xwindow &
