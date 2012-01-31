# -----------------------------------------------------------------
#  OMG! Colors! ---------------------------------------------------
# -----------------------------------------------------------------
  export TERM=xterm-color
  export CLICOLOR=1
  # Linux only:
  # export LS_COLORS='di=32:fi=34:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rb=90'
  export COLOR_NC='\033[0m' # No Color
  export COLOR_WHITE='\033[1;37m'
  export COLOR_BLACK='\033[0;30m'
  export COLOR_BLUE='\033[0;34m'
  export COLOR_LIGHT_BLUE='\033[1;34m'
  export COLOR_GREEN='\033[0;32m'
  export COLOR_LIGHT_GREEN='\033[1;32m'
  export COLOR_CYAN='\033[0;36m'
  export COLOR_LIGHT_CYAN='\033[1;36m'
  export COLOR_RED='\033[0;31m'
  export COLOR_LIGHT_RED='\033[1;31m'
  export COLOR_PURPLE='\033[0;35m'
  export COLOR_LIGHT_PURPLE='\033[1;35m'
  export COLOR_BROWN='\033[0;33m'
  export COLOR_YELLOW='\033[1;33m'
  export COLOR_GRAY='\033[0;30m'
  export COLOR_DARK_GRAY='\033[1;30m'
  export COLOR_LIGHT_GRAY='\033[0;37m'
  alias colorslist="set | egrep 'COLOR_\w*'"  # lists all the colors
  
  alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups
  export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

# -----------------------------------------------------------------
# Command Prompt --------------------------------------------------
# -----------------------------------------------------------------
export PS1="\[${COLOR_BLUE}\]\u@\h \[${COLOR_GREEN}\]\w > \[${COLOR_NC}\]"  # Primary prompt with user, host, and path 
__git_ps1(){ echo ""; }
__task_count(){ 
  TASKS=$(t | wc -l | sed -e's/ *//')
  if [[ $TASKS -eq "0" ]]; then
    echo "" 
  else
    echo "[$TASKS] "
  fi
}
# Allow git bash completion
if [ -f ~/.bin/git-completion.sh ]; then
  . ~/.bin/git-completion.sh
fi

git_dirty_flag() {
  if [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]]; then 
    echo -e "${COLOR_RED}"
  else
    echo -e "${COLOR_DARK_GRAY}"
  fi
}

prompt_func() {
    previous_return_value=$?;
    prompt="\[${COLOR_RED}\]$(__task_count)\[${COLOR_CYAN}\]\$(~/.rvm/bin/rvm-prompt u g) \[${COLOR_GREEN}\]\w\[$(git_dirty_flag)\]$(__git_ps1) \[${COLOR_NC}\]"
    #prompt="\033]0;${PWD}\007\[${COLOR_GREEN}\]\w\[${COLOR_GRAY}\]$(__git_ps1)\[${COLOR_NC}\] "
    #prompt="\[${COLOR_GREEN}\]\$(rvm-prompt u g)\[${COLOR_GREEN}\]\w\[${COLOR_GRAY}\]$(__git_ps1)\[${COLOR_YELLOW}\]$(git_dirty_flag)\[${COLOR_NC}\] "

    if test $previous_return_value -eq 0
    then
        PS1="${prompt}> "
    else
        PS1="${prompt}\[${COLOR_RED}\]> \[${COLOR_NC}\]"
    fi
}
PROMPT_COMMAND=prompt_func

export PS2='> '    # Secondary prompt
export PS3='#? '   # Prompt 3
export PS4='+'     # Prompt 4
  
go_superuser(){
  export PS1="\[${COLOR_RED}\]\u:\w\[${COLOR_GRAY}\] > \[${COLOR_NC}\]"
}
  
# -----------------------------------------------------------------
# Useful Aliases --------------------------------------------------
# -----------------------------------------------------------------
  
  alias su="go_superuser; su"
  alias sudo="go_superuser; sudo"
  alias ..='cd ..'
  alias ...='cd .. ; cd ..'
  alias ll='ls -hl'
  alias la='ls -a'
  alias lla='ls -lah'
  # alias fortune='echo -ne "${COLOR_CYAN}"; fortune; echo -ne "${COLOR_NC}"'
  alias clr='clear; echo -ne "${COLOR_CYAN}"; fortune; echo -ne "${COLOR_NC}"'
  
  alias g='grep -i'  #case insensitive grep
  alias f='find . -iname'
  alias ducks='du -cks * | sort -rn|head -11' # Lists the size of all the folders and files
  alias top='top -o cpu'
  alias systail='tail -f /var/log/system.log'
  alias df='df -h' # Show disk usage
  alias m='more'

  alias t='python ~/.bin/t.py --task-dir ~/Desktop --list todo.txt --delete-if-empty'
  alias d='python ~/.bin/t.py --task-dir ~ --list to-watch.txt --delete-if-empty'
  
  cl() { cd $1; ls -la; }
  
  # Shows most used commands, cool script I got this from:
  # http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
  alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

  alias untar="tar xvzf"

  alias cp_folder="cp -Rpv" #copies folder and all sub files and folders

  killhard() {
      kill -9 "$1"
  }
  
  
# -----------------------------------------------------------------
# Settings --------------------------------------------------------
# -----------------------------------------------------------------
  shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns
  if [[ -s $HOME/.exports ]] ; then source $HOME/.exports ; fi

  export EDITOR='mvim -f'
  # export AUTOFEATURE=true

# -----------------------------------------------------------------
# Bash Options ----------------------------------------------------
# -----------------------------------------------------------------
  export HISTCONTROL=ignoredups
  #export HISTCONTROL=erasedups
  export HISTFILESIZE=3000
  export HISTIGNORE="ls:cd:[bf]g:exit:..:...:ll:lla"
  alias h=history
  hf(){ 
    grep "$@" ~/.bash_history
  }
  
  # bash completion settings (actually, these are readline settings)
  bind "set completion-ignore-case on" # This ignores case in bash completion
  bind "set bell-style none" # No bell, because it's damn annoying
  bind "set show-all-if-ambiguous On" # this allows you to automatically show completion 


  if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
  fi

# -----------------------------------------------------------------
# Github Stuff ----------------------------------------------------
# -----------------------------------------------------------------

github_issues_list(){
  if [ $# -gt 0 ]; then
    gh issues open | g issue | g "#$@ "
  else
    gh issues open | g issue
  fi
}

  alias ghi=github_issues_list

# -----------------------------------------------------------------
# Nifty "bookmark directory" commands: save <bookmark name>, later, cd <bookmark name>
# -----------------------------------------------------------------

  if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
    touch ~/.dirs
  fi

  alias show='cat ~/.dirs'
  save (){
    command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ; 
  }
  source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file
  shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility

export CDPATH=.:~/Desktop

# -----------------------
# RVM Support
# -----------------------
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

