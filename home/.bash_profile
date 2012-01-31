# Identify OS and Machine -----------------------------------------
export OS=`uname -s | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export OSVERSION=`uname -r`; OSVERSION=`expr "$OSVERSION" : '[^0-9]*\([0-9]*\.[0-9]*\)'`
export MACHINE=`uname -m | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export PLATFORM="$MACHINE-$OS-$OSVERSION"

# Path ------------------------------------------------------------
if [ "$OS" = "darwin" ] ; then
  
  export PATH="/usr/local/Cellar/python/2.7.1/bin:/usr/local/bin:/usr/local/sbin:$PATH"
  export PATH="$PATH:/usr/local/mysql/bin:/Users/therabidbanana/.gem/ruby/1.8/bin"
  # export PATH=/opt/local/bin:/opt/local/sbin:$PATH  # OS-X Specific, with MacPorts and MySQL installed
  #export PATH=/opt/local/bin:/opt/local/sbin:$PATH  # OS-X Specific, with MacPorts installed
fi

if [ -d ~/bin ]; then
  export PATH=~/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
fi

if [ -d ~/cl/bin ]; then
  export PATH=~/cl/bin:$PATH  # add your bin folder to the path, if you have it
fi


# Load in .bashrc -------------------------------------------------
source ~/.bashrc



# Startup Greeting ------------------------------------------------
if [ -x /opt/local/bin/fortune ]; then
    echo -e "$COLOR_CYAN`/opt/local/bin/fortune -sae`$COLOR_NC\n"  
fi
    echo -ne "${COLOR_GREEN}Time is: "; date
    echo -e "${COLOR_LIGHT_GREEN}(`ddate`)"
    echo -ne "${COLOR_NC}"


# Notes: ----------------------------------------------------------
# When you start an interactive shell (log in, open terminal or iTerm in OS X, 
# or create a new tab in iTerm) the following files are read and run, in this order:
#     profile
#     bashrc
#     .bash_profile
#     .bashrc (only because this file is run (sourced) in .bash_profile)
#
# When an interactive shell, that is not a login shell, is started 
# (when you run "bash" from inside a shell, or when you start a shell in 
# xwindows [xterm/gnome-terminal/etc] ) the following files are read and executed, 
# in this order:
#     bashrc
#     .bashrc
