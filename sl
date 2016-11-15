#!/bin/sh
trap '' TERM INT
export SL_IMAGE="${1-$SL_IMAGE}"
./sl_on_touchbar.app/Contents/MacOS/sl_on_touchbar
