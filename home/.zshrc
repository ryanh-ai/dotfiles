
#export PATH="/usr/local/bin/:$PATH"
#export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

source $(brew --prefix)/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

#plugins=(git dircycle colored-man colorize github virtualenv zsh-syntax-highlighting git-extras history osx pip python screen sudo virtualenvwrapper aws brew)
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle python
antigen bundle history
antigen bundle screen
antigen bundle sudo
antigen bundle virtualenv
antigen bundle virtualenvwrapper
antigen bundle aws
antigen bundle command-not-found
antigen bundle autojump
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle HeroCC/LS_COLORS
antigen bundle common-aliases
antigen bundle zsh-dircolors-solarized
antigen bundle zsh-pip-completion


# Load OS specific bundles
if [[ `uname` == "Darwin" ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle osx
    antigen bundle zsh-brew-services
fi

# Syntax highlighting bundle.
#antigen bundle zsh-users/zsh-syntax-highlighting


# Load the theme.
antigen theme robbyrussell

# Play with virtualenv mod
#function virtenv_indicator {
#	if [[ -z $VIRTUAL_ENV ]] then
#		psvar[1]=''
#	else
#		psvar[1]=${VIRTUAL_ENV##*/}
#	fi
#}
#
#add-zsh-hook precmd virtenv_indicator
#PROMPT='%(1V.(%1v).)$PROMPT'

# Tell antigen that you're done.
antigen apply

function virtualenv_info {
	    [ $VIRTUAL_ENV ] && echo '['$fg[blue]`basename $VIRTUAL_ENV`%{$reset_color%}'] '
}
PROMPT='%{$fg_bold[white]%}%M $(virtualenv_info)${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)
'


source ~/.alias
source ~/.pipconfig
source ~/.homebrewconfig
source ~/.otherconfig

homeshick --quiet refresh
