autoload -U colors; colors
autoload -U compinit; compinit
autoload -Uz zmv
autoload -U url-quote-magic

if [ -d $HOME/.anyenv ]
then
	export PATH="$HOME/.anyenv/bin:$PATH"
	eval "$(anyenv init - zsh)"
fi

export XDG_CACHE_DIR=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config

export CXX='g++-7'
export CC='gcc-7'

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

local p_cdir="%B%F{blue}[%~]%f%b"$'\n'
local p_info="%n@%m"
local p_mark="%(?,%F{green},%F{red})%#%f"

PROMPT=" $p_cdir$p_info $p_mark "
SPROMPT="%r is correct? [n,y,a,e]: "
RPROMPT='`rprompt-st`%{$fg_bold[cyan]%}%{$reset_color%}'

bindkey -v

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt extended_history
setopt extended_glob
setopt print_eight_bit
setopt ignore_eof
setopt interactive_comments
setopt prompt_subst

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

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zle -N self-insert url-quote-magic

WORDCHARS='?_-.[]~=&;!#$%^(){}<>'

LESS=' -R '

function history-all { history -E 1 }

function wincmd(){
	CMD=$1
	shift
	$CMD $* 2>&1 | iconv -f CP932 -t UTF-8
}

function rprompt-git(){
	local name st color
	name=`git symbolic-ref HEAD 2> /dev/null | sed -e "s/refs\/heads\///g" `
	if [[ -z $name ]]; then
		return
	fi

	st=`git status 2> /dev/null`
	if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
		color=${fg[green]}
	elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
		color=${fg[yellow]}
	elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
		color=${fg_bold[red]}
	else
		color=${fg[red]}
	fi
	echo "(%{$color%}$name%{$reset_color%}) "
}

function rprompt-svn(){
	local name st color stt
	st=`LANG=C svn status --depth immediates 2>&1`
	if [[ $st =~ "is not" ]]; then
		return 
	fi
	stt=""
	if [[ -n `echo $st | grep "^\s\?[CADM]"` ]]; then
		color=${fg_bold[red]}
		if [[ -n `echo $st | grep "^C"` ]]; then
			stt="${stt}C"
		fi
		if [[ -n `echo $st | grep "^A"` ]]; then
			stt="${stt}A"
		fi
		if [[ -n `echo $st | grep "^D"` ]]; then
			stt="${stt}D"
		fi
		if [[ -n `echo $st | grep "^M"` ]]; then
			stt="${stt}M"
		fi
	elif [[ -n `echo $st | grep "^\?"` ]]; then
		color=${fg[yellow]}
		stt="?"
	else
		color=${fg[green]}
		stt="N"
	fi
	echo "(%{$color%}$stt%{$reset_color%})"
}

function rprompt-st(){
	if [[ ! `git status 2>&1` =~ "Not a git" ]]; then
		rprompt-git
#    elif [[ ! `LANG=C svn status --depth immediates 2>&1` =~ "is not" ]]; then
#        rprompt-svn
	fi
}

function sqlext(){
	cout | sed -e 's/[^"]*"\([^"]*\)".*/\1/' | cin && cout;
}
