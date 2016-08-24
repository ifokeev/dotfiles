export EDITOR='vim'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$HOME/neovim/bin:$PATH"

export VIMRUNTIME="$HOME/neovim/share/nvim/runtime"

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
