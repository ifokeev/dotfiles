# Path to your oh-my-zsh installation.
ZSH_THEME="robbyrussell"
plugins=(git fasd)

source $HOME/.bashrc

export OCI_LIB_DIR=/opt/oracle/instantclient
export OCI_INC_DIR=/opt/oracle/instantclient/sdk/include

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
