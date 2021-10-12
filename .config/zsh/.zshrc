p10k_ipr="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[ -r "$p10k_ipr" ] && source "$p10k_ipr"

antigen="${XDG_DATA_HOME:-$HOME/.local/share}/antigen/antigen.zsh"
[ -f $antigen ] || curl -fLo $antigen --create-dirs "git.io/antigen"

source $antigen

antigen use oh-my-zsh

antigen bundle colored-man-pages
antigen bundle vi-mode

fzf="$(command -v fzf)"
[ -x "$fzf" ] && antigen bundle junegunn/fzf shell
[ -x "$fzf" ] && antigen bundle Aloxaf/fzf-tab

antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle rupa/z

antigen theme romkatv/powerlevel10k

antigen apply

HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zsh_history"
[ -f "$HISTFILE" ] || mkdir -p "$(dirname "$HISTFILE")"
HISTSIZE=10000
SAVEHIST=10000

_Z_DATA="${XDG_CACHE_HOME:-$HOME/.cache}/z/cache"
[ -f "$_Z_DATA" ] || mkdir -p "$(dirname "$_Z_DATA")" && touch "$_Z_DATA"

bindkey ^b backward-char
bindkey ^f forward-char
KEYTIMEOUT=1

aliasrc="${XDG_CONFIG_HOME:-$HOME/.config}/aliases/aliasrc"
[ -f "$aliasrc" ] && source "$aliasrc"

p10k_conf="${XDG_CONFIG_HOME:-$HOME/.config}/powerlevel10k/config.zsh"
[ ! -f "$p10k_conf" ] && [ -f "$HOME/.p10k.zsh" ] && p10k_conf="$HOME/.p10k.zsh"
[ -f "$p10k_conf" ] && source "$p10k_conf"
