plugins=(git z)

export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh
source /usr/local/opt/zinit/zinit.zsh
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh
source /usr/local/opt/nvm/nvm.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export VISUAL=nvim
export EDITOR=$VISUAL
export TERM=screen-256color
export GOPROXY=https://goproxy.io,direct

alias k=kubectl

zinit light Aloxaf/fzf-tab
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light romkatv/powerlevel10k

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
