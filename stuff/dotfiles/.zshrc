plugins=(git z)

export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh
source /usr/local/opt/zinit/zinit.zsh
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh
source /usr/local/opt/nvm/nvm.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export VISUAL=vim
export EDITOR=$VISUAL
export GOPROXY=https://goproxy.io,direct
export PATH="${PATH}:${HOME}/.krew/bin"

export PATH="$PATH:$HOME/.krew/bin"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:$HOME/.local/bin"

alias k=kubectl
alias lg=lazygit

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

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
