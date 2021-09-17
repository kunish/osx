export VISUAL=vim
export EDITOR=$VISUAL
export NVM_DIR=$HOME/.nvm
export GOPROXY=https://goproxy.io,direct
export GOPATH=$HOME/.go
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PEPPA_OUTPUT=$HOME/work/peppa-output

export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/.krew/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$GOPATH/bin"

source /usr/local/opt/nvm/nvm.sh
source $HOME/.cargo/env
eval $(pyenv init --path)

alias k=kubectl
alias n=nvim
alias v=vim
alias ls=exa
alias la='exa -al'
alias ld=lazydocker
alias lg=lazygit
alias s='kitty +kitten ssh'
alias d='kitty +kitten diff'
alias icat='kitty +kitten icat'
