#!/bin/bash

# Paths
DOLPHIN_EXEC="flatpak run org.DolphinEmu.dolphin-emu"

# Steam Deck Dock IDs
VENDOR_ID="28de"
PRODUCT_ID="2001"

DOCKED=false

PRESET=$1

# Combine all parameters except for the first
if [ $# -ge 2 ]; then
    combined_params=""
    shift   # Move to the next parameter after $1

    for param in "$@"; do
        combined_params="$combined_params $param"
    done    
else
    combined_params=""
fi

# Check if docked
if lsusb | grep -q "$VENDOR_ID:$PRODUCT_ID"; then
    DOCKED=true
fi

if [ "$PRESET" == "dolphin" ]; then
    if [ "$DOCKED" = true ]; then
		$DOLPHIN_EXEC $combined_params --config Graphics.Settings.InternalResolution=3
	else
		$DOLPHIN_EXEC $combined_params --config Graphics.Settings.InternalResolution=2
	fi
fi