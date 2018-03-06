# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

################################
# prompt
################################
PS1="[\w]\n\u@\h$ "

################################
# options
################################
shopt -s autocd
shopt -s globstar

################################
# aliases
################################
#alias -g ...='../..'
#alias -g ....='../../..'
#alias -g L='| less -XF'
#alias -g G='| grep --with-filename --line-number --color=always'

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'
alias lla='ls -la --color=auto'
alias lal='ls -la --color=auto'
alias grep='grep --with-filename --line-number --color=always'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias less='less -XF'
alias cls='clear'
