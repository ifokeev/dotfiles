export EDITOR='vim'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

export PATH="$HOME/neovim/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

export VIMRUNTIME="$HOME/neovim/share/nvim/runtime"

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# node env
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# java env
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


# python env
# set where virutal environments will live
export WORKON_HOME=$HOME/.virtualenvs
# ensure all new environments are isolated from the site-packages directory
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# use the same directory for virtualenvs as virtualenvwrapper
export PIP_VIRTUALENV_BASE=$WORKON_HOME
# makes pip detect an active virtualenv and install to it
export PIP_RESPECT_VIRTUALENV=true
export VIRTUALENVWRAPPER_PYTHON="$(command \which python3)"
export PROJECT_HOME=~/Code

if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi
