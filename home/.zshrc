# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bananacopter"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git gem heroku lol rvm redis-cli vi-mode)

source $ZSH/oh-my-zsh.sh
if [[ -f "$HOME/.amazon_keys" ]]; then
  source "$HOME/.amazon_keys";
fi

# Customize to your needs...
export PATH=$HOME/.rvm/bin:$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.5.3

# Set stuff for colors
export TERM=xterm-256color
export CLICOLOR=1
alias ttytter="ttytter -verify -ansi -urlopen='echo %U'"  # ttytter in color
# For mutt
export COLORFGBG="default;default"

alias ls='ls -G --color'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups
alias ghi='ghi --no-pager'
alias finch='TERM=screen finch'
alias tmux='TERM=screen-256color tmux -2 -u'
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export LS_COLORS='di=32:fi=34:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rb=90'

alias ll='ls -hl'
alias la='ls -a'
alias lla='ls -lah'
alias clr='clear; echo -ne "$fg[cyan]"; fortune; echo -ne "$reset_color"'
# alias g='grep -i'  #case insensitive grep
# alias f='find . -iname'
alias ducks='du -cks * | sort -rn|head -11' # Lists the size of all the folders and files
alias df='df -h' # Show disk usage
alias m='more'
alias t='python ~/.bin/t.py --task-dir ~/Desktop/Dropbox --list todo.txt --delete-if-empty'
alias w='python ~/.bin/t.py --task-dir ~/Desktop/Dropbox --list to-watch.txt --delete-if-empty'
alias d='python ~/.bin/t.py --task-dir ~/Desktop/Dropbox --list dtime-todo.txt --delete-if-empty'
alias untar="tar xvzf"
alias bi="bundle install"

alias x="Xvfb :99 -ac &"
export DISPLAY=":99"

# Safer
alias mv="mv -i"

alias h=history
alias ...="cd ..; cd .."

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

# -----------------------
# RVM Support
# -----------------------
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

# Startup Greeting ------------------------------------------------
if [ -x /usr/local/bin/fortune ]; then
    echo -e "$fg[cyan]`/usr/local/bin/fortune -sae`$reset_color\n"
fi
if [ -x /usr/bin/fortune ]; then
    echo -e "$fg[cyan]`/usr/bin/fortune -sae`$reset_color\n"
fi
    echo -ne "$fg[green]"; ddate
    echo -ne "$reset_color"
