#!/bin/bash

# Paths
DOLPHIN_EXEC="flatpak run org.DolphinEmu.dolphin-emu"

# Steam Deck Dock IDs
VENDOR_ID="28de"
PRODUCT_ID="2001"

DOCKED=false

# Check if docked
if lsusb | grep -q "$VENDOR_ID:$PRODUCT_ID"; then
    DOCKED=true
fi

if [ "$1" == "dolphin" ]; then
    if [ "$DOCKED" = true ]; then
		$DOLPHIN_EXEC $2 --config Graphics.Settings.InternalResolution=3
	else
		$DOLPHIN_EXEC $2 --config Graphics.Settings.InternalResolution=2
	fi
fi