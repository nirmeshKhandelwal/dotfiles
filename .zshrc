#more extensive tab completion.
autoload -U compinit
compinit

autoload -U colors && colors

#Changes the definition of "word", e.g. with ^W
autoload select-word-style
select-word-style shell

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# User specific aliases and functions
##################################
#  //_\\| | |/ _` / __|/ _ | __|
# /  _  \ | | (_| \__ \  __|__ \
# \_/ \_/_|_|\__,_|___/\___|___/


alias la='ls -A'
alias l='ls -CF'
alias ll='ls -alF'
alias ..='cd ..'
alias ...='cd ../..'

# Git aliases
alias s='git status'
alias pull='git pull'
alias ci='git ci'
alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'     --abbrev-commit"
alias add='git add'
alias st='git stash'
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\] \[\033[33;1m\]\w\[\033[m\] (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$ "

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

#  / _\ | | | | '_ \ / __| __| |/ _ \| '_ \/ __|
# / /   | |_| | | | | (__| |_| | (_) | | | \__ \
# \/     \__,_|_| |_|\___|\__|_|\___/|_| |_|___/

# Makes extraction easier
function extract() {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# set path in prompt
setopt PROMPT_SUBST
PROMPT='%n@%m:%~$'
#source ~/.git-completion.bash
