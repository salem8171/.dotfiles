export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

[ -x "$(command -v vi)" ] && export EDITOR=vi
[ -x "$(command -v nano)" ] && export EDITOR=nano
[ -x "$(command -v vim)" ] && export EDITOR=vim
[ -x "$(command -v nvim)" ] && export EDITOR=nvim

export VISUAL=$EDITOR

export PAGER=less
export BAT_PAGER=less
[ -x "$(command -v bat)" ] && export PAGER="bat --paging=always --style=plain"

export TERMINAL="terminal-adapter"

# export QT_QPA_PLATFORMTHEME="gtk2"
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0

export XENVIRONMENT="${XDG_CONFIG_HOME:-$HOME/.config}/urxvt/resources"
export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd"

[ -x "$(command -v dircolors)" ] &&
  eval "$(dircolors "${XDG_CONFIG_HOME:-$HOME/.config}/dircolors/config")"

export ADOTDIR="${XDG_DATA_HOME:-$HOME/.local/share}/antigen"

export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export ANDROID_AVD_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/android"
export ANDROID_EMULATOR_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/android"
export ADB_VENDOR_KEY="${XDG_CONFIG_HOME:-$HOME/.config}/android"

export LESSHISTFILE=/dev/null

export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export ICEAUTHORITY="${XDG_CACHE_HOME:-$HOME/.cache}/ICEauthority"

export FZF_DEFAULT_OPTS=""
FZF_DEFAULT_OPTS+=" --color='bg+:-1,border:#1f201a'"
FZF_DEFAULT_OPTS+=" --reverse"
FZF_DEFAULT_OPTS+=" --padding 1,2"
FZF_DEFAULT_OPTS+=" --preview-window=60%"
FZF_DEFAULT_OPTS+=" --cycle"
FZF_DEFAULT_OPTS+=" --ansi"
FZF_DEFAULT_OPTS+=" --pointer=❯"
FZF_DEFAULT_OPTS+=" --prompt='❯ '"
FZF_DEFAULT_OPTS+=" --info=inline"
FZF_DEFAULT_OPTS+=" --bind change:top"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0" ] &&
  export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"

export PATH="$PATH:$HOME/.local/bin"

export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export XSERVERRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xserverrc"

[ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] &&
  [ -x "$(command -v xinit)" ] && exec xinit &> /dev/null
