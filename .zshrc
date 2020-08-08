[[ -f .antigen/antigen.zsh ]] || curl -L git.io/antigen > .antigen/antigen.zsh
[[ -x "$(command -v fzf)" ]] || [[ -x "$(command -v .fzf/bin/fzf)" ]] &&
  export PATH=$PATH:.fzf/bin || {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --bin
  export PATH=$PATH:.fzf/bin
}

source .antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle colored-man-pages
antigen bundle vi-mode
antigen bundle junegunn/fzf shell/key-bindings.zsh
antigen bundle Aloxaf/fzf-tab
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

# POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
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

# if [ -z $TMUX ]; then tmux && exit; fi
