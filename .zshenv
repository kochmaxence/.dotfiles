export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# export GVM_DIR="$HOME/.g"
# [ -s "$GVM_DIR/env" ] && \. "$GVM_DIR/env"

export CARGO_DIR="$HOME/.cargo"
[ -s "$CARGO_DIR/env" ] && \. "$CARGO_DIR/env"

export GOUP_DIR="$HOME/.go"
[ -s "$GOUP_DIR/env" ] && \. "$GOUP_DIR/env"
. "$HOME/.cargo/env"

export PYENV_DIR="$HOME/.pyenv"
[[ -d $PYENV_DIR/bin ]] && export PATH="$PYENV_DIR/bin:$PATH"
eval "$(pyenv init -)"
