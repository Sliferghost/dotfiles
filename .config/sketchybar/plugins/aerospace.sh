#!/usr/bin/env bash
# This script is called by Sketchybar for each space item when
# the 'aerospace_workspace_change' event is triggered.

# The name of the item that triggered this script (e.g., "space.B")
# is available in the $NAME environment variable.

# We extract the workspace name from the item name (e.g., "B" from "space.B")
CURRENT_WORKSPACE_NAME="${NAME#space.}"

# Get the name of the currently focused Aerospace workspace
ACTIVE_WORKSPACE=$(aerospace list-workspaces --focused)

if [ "$ACTIVE_WORKSPACE" = "$CURRENT_WORKSPACE_NAME" ]; then
  sketchybar --set $NAME background.drawing=on
else
  sketchybar --set $NAME background.drawing=off
fi
