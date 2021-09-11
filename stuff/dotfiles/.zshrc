plugins=(git z)

export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh
source $HOME/.p10k.zsh
source $HOME/.profile
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh
source /usr/local/opt/zinit/zinit.zsh

zinit light-mode for \
  zinit-zsh/z-a-rust \
  zinit-zsh/z-a-as-monitor \
  zinit-zsh/z-a-patch-dl \
  zinit-zsh/z-a-bin-gem-node \
  Aloxaf/fzf-tab \
  zdharma/fast-syntax-highlighting \
  zsh-users/zsh-autosuggestions \
  romkatv/powerlevel10k

zstyle ':bracketed-paste-magic' active-widgets '.self-*'
bindkey \^U backward-kill-line
