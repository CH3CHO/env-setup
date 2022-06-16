alias cls='clear'
alias rl='source ~/.bash_profile'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias docker='winpty docker'
alias mvn='mvn.cmd'

[ -n "$M2_HOME" ] && export M2_HOME=`(cd "$M2_HOME"; pwd)`
export MAVEN_HOME=$M2_HOME
[ -n "$JAVA_HOME" ] && export JAVA_HOME=`(cd "$JAVA_HOME"; pwd)`

source ~/.bash_git_aliases
