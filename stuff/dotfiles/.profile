plugins=(git z)

export ZSH="$HOME/.oh-my-zsh"
export fish_greeting=
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export VISUAL=vim
export EDITOR=$VISUAL
export NVM_DIR=$HOME/.nvm
export GOPROXY=https://goproxy.io,direct
export GOPATH=$HOME/work/go
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export FZF_DEFAULT_COMMAND="fd --hidden --follow"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export PEPPA_OUTPUT=$HOME/work/peppa-output

export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/Library/Python/3.9/bin"
export PATH="$PATH:$HOME/.krew/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$GOPATH/bin"

source $ZSH/oh-my-zsh.sh
source /usr/local/opt/zinit/zinit.zsh
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh
source /usr/local/opt/nvm/nvm.sh
source $HOME/.cargo/env

alias k=kubectl
alias m=mvim
alias n=nvim
alias v=vim
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
