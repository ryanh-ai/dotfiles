export PATH=/usr/local/bin/:$PATH
source ~/.zshrc
vdir=${PWD##*/}
source ~/.virtualenvs/$vdir/bin/activate
