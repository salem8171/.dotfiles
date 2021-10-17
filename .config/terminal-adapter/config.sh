#!/usr/bash

# Configuration variables:
#   $TERM_CMD: An array containing the final terminal command to be executed.
#
# Read only variables:
#   $CMD: Contains the command passed as argument to the terminal.
#   $TITLE: Contains a string that should be set as the terminal title.
#   $POPUP: Indicate that a terminal should be a popup, empty otherwise.

# xfce4-terminal
# TERM_CMD=(xfce4-terminal)
# [ -n "$TITLE" ] && TERM_CMD+=(-T "$TITLE")
# [ -z "$POPUP" ] && TERM_CMD+=(--maximize)
# [ -n "$CMD" ] && TERM_CMD+=(-e "sh -c \"$CMD\"")

# urxvt
TERM_CMD=(urxvtc)
TERM_CMD+=(-icon "$HOME/.local/share/icons/oomox-Monokaish/64x64/apps/terminal.svg")
[ -n "$TITLE" ] && TERM_CMD+=(-title "$TITLE")
[ -n "$CMD" ] && TERM_CMD+=(-e sh -c "$CMD")
