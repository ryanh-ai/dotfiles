source ~/.profile
source ~/.bash_prompt
source ~/.bashrc
source ~/.alias


#function gvim { /Applications/MacPorts/MacVim.app/Contents/MacOS/Vim -g $*;}
#function tabtitle{ /bin/echo -e "\033];$*\007";}
#function growl() { echo -e $'\e]9;'${1}'\007' ; return ; }

#Enable Bash Completion
if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/bash_completion
fi

#History
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export PATH=/opt/local/bin:/opt/local/sbin:$PATH

