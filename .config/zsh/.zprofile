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
export ADB_VENDOR_KEYS="${XDG_DATA_HOME:-$HOME/.local/share}/android"

export GOPATH="$XDG_DATA_HOME/go"

export CARGO_HOME="$XDG_DATA_HOME/cargo"

export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"

export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"

export NVM_DIR="$XDG_DATA_HOME/nvm"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
mkdir -p "$(dirname "$NPM_CONFIG_USERCONFIG")"

export GNUPGHOME="$XDG_DATA_HOME/gnupg"
mkdir -p "$GNUPGHOME"

export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME/vagrant/aliases"

export LESSHISTFILE=/dev/null

export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export ICEAUTHORITY="${XDG_CACHE_HOME:-$HOME/.cache}/ICEauthority"

export VAGRANT_DEFAULT_PROVIDER=libvirt

FZF_DEFAULT_OPTS_ARRAY=(
  "--color='bg+:-1,border:#1f201a'"
  "--reverse"
  "--padding 1,2"
  "--preview-window=60%"
  "--cycle"
  "--ansi"
  "--pointer=❯"
  "--prompt='❯ '"
  "--info=inline"
  "--bind change:top"
  "--scroll-off=5"
  "--bind ctrl-a:toggle-all"
)
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS_ARRAY[*]}"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0" ] &&
  export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"

export IPYTHONDIR="${XDG_CONFIG_HOME:-$HOME/.config}/ipython"

export HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/bash/history"
mkdir -p "$(dirname "$HISTFILE")"

export PATH="$PATH:$HOME/.local/bin"

export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export XSERVERRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xserverrc"

[ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] &&
  [ -x "$(command -v xinit)" ] && exec xinit &> /dev/null
