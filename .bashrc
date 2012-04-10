# .bashrc
cd /Applications/LEX/app;

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ty='ttytter.pl -vcheck'
alias tys='ttytter.pl -status'
alias srup='svn status --show-updates'

# grep colors
export GREP_OPTIONS='--color=auto' 

#what is my ip
alias wimp='curl http://automation.whatismyip.com/n09230945.asp ; echo'
#define words
function def () { curl dict://dict.org/d:"$1" ; }
#colors (may not be complete)
alias clrs='n=$(tput colors) sgr0=$(tput sgr0); for ((i=0;i<n;i++)); do c=$(tput setab $i); printf '\''%3d: %s%20s %s %q\n'\'' "$i" "$c" "" "$sgr0" "$c"; done'

# Source my FTWin stuff
. ~/FTWin/FTWin.sh

#for hastebin:
haste() { curl -sd "$(cat $1)" http://hastebin.com/documents | sed -e 's/{"key":"/http:\/\/hastebin.com\//' -e "s/\"}/\.$(echo $1 | sed -e 's/.*\.//')\n/"; }

export PATH=/home/sequoia/bin/node_modules:/usr/local/zend/bin:$PATH:/var/www/html/cake/cake/console
export EDITOR=`which vim`

# git config
git config --global user.name "Sequoia McDowell"
git config --global user.email sequoia.mcdowell@gmail.com
export GIT_SSL_NO_VERIFY=true

#misc
function jpgto(){
	local jptkeyword=$1;
	local jptpath=$2;
	curl -silent -F keyword=$jptkeyword -F file="@$jptpath" jpg.to/finish.php >> /dev/null;
	echo "http://jpg.to/$jptkeyword";
}
