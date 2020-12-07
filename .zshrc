p10k_path="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[ -r "$p10k_path" ] && source "$p10k_path"

antigen="$HOME/.local/share/antigen/antigen.zsh"
[ -f $antigen ] || curl -fLo $antigen --create-dirs git.io/antigen

source $antigen

antigen use oh-my-zsh

antigen bundle colored-man-pages
antigen bundle vi-mode

fzf="$(command -v fzf)"
[ -x "$fzf" ] && antigen bundle junegunn/fzf shell/key-bindings.zsh
[ -x "$fzf" ] && antigen bundle Aloxaf/fzf-tab

antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle rupa/z

antigen theme romkatv/powerlevel10k

antigen apply

HISTFILE=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zsh_history
mkdir -p "$(dirname "$HISTFILE")"
HISTSIZE=10000
SAVEHIST=10000

_Z_DATA=${XDG_CACHE_HOME:-$HOME/.cache}/z
[ -f "$_Z_DATA" ] || touch "$_Z_DATA"

bindkey ^b backward-char
bindkey ^f forward-char

aliasrc="${XDG_CONFIG_HOME:-$HOME/.config}/aliases/aliasrc"
[ -f "$aliasrc" ] && source "$aliasrc" 

[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
