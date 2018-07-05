alias -g ...='../..'
alias -g ....='../../..'
alias -g L='| less -XF'
alias -g G='| grep'

alias rename='noglob zmv -W'

case "${OSTYPE}" in
darwin*)
	alias ls='gls --color=auto'
	alias ll='gls -l --color=auto'
	alias la='gls -a --color=auto'
	alias lla='gls -al --color=auto'
	alias lal='gls -al --color=auto'
	;;
linux*)
	alias ls='ls --color=auto'
	alias ll='ls -l --color=auto'
	alias la='ls -a --color=auto'
	alias lla='ls -la --color=auto'
	alias lal='ls -la --color=auto'
	;;
esac

alias grep='grep --with-filename --line-number --color=always'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias less='less -XF'

alias cmd='cmd.exe'
alias psh='powershell.exe'
alias path='echo -e ${PATH//:/\\n}'
alias cls='clear'
alias cin='win32yank.exe -i'
alias cout='win32yank.exe -o'
alias vim='nvim'
alias vi='nvim'
