ANTIGEN_MUTEX=false

# Load Antigen
[[ -s "$HOME/antigen.zsh" ]] && source $HOME/antigen.zsh

#Load Antigen configurations
antigen init ~/.antigenrc

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lclose/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lclose/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lclose/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lclose/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



# Loads history based auto jump
[[ -s /home/lclose/.autojump/etc/profile.d/autojump.sh ]] && source /home/lclose/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# Load custom aliases
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


 # Rbenv init for command version if note init already
if [ -x "$(command -v rbenv)" ]
then
    eval "$(rbenv init -)"
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -d "$HOME/.local/bin/adb-fastboot" ] ; then
 export PATH="$HOME/.local/bin/adb-fastboot:$PATH"
fi



