# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi


# Python Configuration so Variables Set for virtualenvwrapper plugin
if [[ `uname` == Darwin ]]; then
	source ~/.homebrewconfig
fi
source ~/.pipconfig

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

[[ -s $HOME.autojump/etc/profile.d/autojump.sh ]] && source $HOME.autojump/etc/profile.d/autojump.sh

if [[ `uname` == "Darwin" ]]; then
  source $(brew --prefix)/share/antigen/antigen.zsh
fi


if [[ `uname` == "Linux" ]]; then
  source ~/.antigen/antigen.zsh
fi

# Load the oh-my-zsh's library.
antigen use oh-my-zsh


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
antigen bundle dotenv

# Load OS specific bundles
if [[ `uname` == "Darwin" ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle osx
    antigen bundle zsh-brew-services
fi

# TODO: Syntax highlighting bundle.
#antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme robbyrussell
antigen theme romkatv/powerlevel10k

# Tell antigen that you're done.
antigen apply


source ~/.alias
#source ~/.nvmconfig
source ~/.otherconfig
[[ ! -f ~/Projects/litellm-proxy-prod/.gpt-alias ]] || source ~/Projects/litellm-proxy-prod/.gpt-alias

#

yes | homeshick --quiet refresh 2

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ "$TERMINAL_EMULATOR" == "JetBrains-JediTerm" ]]; then
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
  POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
  ZSH_THEME="simple"
else
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi
export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"
[[ ! -f ~/.brazil_completion/zsh_completion ]] || source $HOME/.brazil_completion/zsh_completion

# if you wish to use IMDS set AWS_EC2_METADATA_DISABLED=false
export AWS_EC2_METADATA_DISABLED=true
PATH=$PATH:/apollo/env/CodeSearchCLI/bin/
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
