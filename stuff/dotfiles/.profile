export fish_greeting=
export EDITOR=nvim
export VISUAL=$EDITOR
export PEPPA_OUTPUT=$HOME/work/peppa-output
export GOPATH="$HOME/work/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
. "/Users/shikun/.acme.sh/acme.sh.env"
