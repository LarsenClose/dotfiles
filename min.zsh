# Git status symbols
# I added functionality to show virtual enviornments
#
#
ZSH_THEME_GIT_PROMPT_PREFIX="%F{242}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
ZSH_THEME_GIT_PROMPT_DIRTY="±"

# Python and Conda venv
function virtenv_indicator {
    if [[ -z $VIRTUAL_ENV ]] && [[ -z $CONDA_DEFAULT_ENV ]]; then
        psvar[1]=''
    elif [[ -z $VIRTUAL_ENV ]]; then
        psvar[1]=${CONDA_DEFAULT_ENV##*/}
    elif [[ -z $CONDA_DEFAULT_ENV ]]; then
        psvar[1]=${VIRTUAL_ENV##*/}
    fi
}

add-zsh-hook precmd virtenv_indicator

# venv
venv_env() {
  echo -n "%(1V.%{$fs_bold[yellow]%}(%1v)%{$reset_color%}.)"
}

# Prompt symbol
min_status() {
  echo -n "%(?.%F{green}.%F{red})➜%f  "
}

# Username
min_user() {
  if [[ $USER == 'root' ]]; then
    echo -n "%F{red}"
  else
    echo -n "%F{yellow}"
  fi
  echo -n "%n"
}

# Username and ssh host
min_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo -n "$(min_user)@%m%f "
  elif [[ $LOGNAME != $USER ]] || [[ $USER == 'root' ]]; then
    echo -n "$(min_user)%f "
  fi
}

# Current directory
min_current_dir() {
  echo -n "%B%F{grey}%.%f%b "
}

# Git status
min_git_status() {
  echo -n "$(git_prompt_status)$(git_prompt_info)"
}

# Compose prompt
PROMPT='$(venv_env)$(min_status)$(min_host)$(min_current_dir)$(min_git_status)'
