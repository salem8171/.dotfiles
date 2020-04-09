source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle colored-man-pages
antigen bundle vi-mode
antigen bundle Aloxaf/fzf-tab
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
# antigen theme bhilburn/powerlevel9k powerlevel9k
antigen theme caiogondim/bullet-train-oh-my-zsh-theme bullet-train

antigen apply

[[ -f $HOME/.aliasrc ]] && source $HOME/.aliasrc

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history

### bullet-train ###
BULLETTRAIN_DIR_FG=black
BULLETTRAIN_DIR_EXTENDED=0
BULLETTRAIN_PROMPT_ORDER=(
  time
  status
  context
  dir
  virtualenv
  aws
  git
  cmd_exec_time
)
### end of bullet-train ###

# fuzzy history - repeat history
fhistory () {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf --layout=reverse --height=15 +s --tac | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
}

bindkey -s '^R' 'fhistory\n'
if [ -z $TMUX ]; then tmux && exit; fi
