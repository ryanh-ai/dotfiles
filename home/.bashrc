
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
gpip(){
       PIP_REQUIRE_VIRTUALENV="" pip "$@"
   }
export WORKON_HOME=~/.virtualenvs
# AWS CLI Completer
complete -C aws_completer aws
export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"
. "$HOME/.cargo/env"
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
