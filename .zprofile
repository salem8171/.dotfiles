export EDITOR=/usr/bin/nvim
export TERMINAL=xfce4-terminal
export QT_QPA_PLATFORMTHEME="gtk2"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export FZF_DEFAULT_OPTS='--layout=reverse --height=24'
# export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"

PATH=$PATH:/home/salem/.local/bin

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
