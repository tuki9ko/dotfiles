local p_cdir="%B%F{blue}[%~]%f%b"$'\n'
local p_info="%n@%m"
local p_mark="%(?,%F{green},%F{red})%#%f"

#PROMPT=" $p_cdir$p_info $p_mark "
PROMPT='`lprompt`'
SPROMPT="%r is correct? [n,y,a,e]: "
RPROMPT='`rprompt-st`%{$fg_bold[cyan]%}%{$reset_color%}'

function lprompt {
	FIRST='178m%}'
	FIRST_B='237m%}'
	SECOND='007m%}'
	SECOND_B='067m%}'

	sharp='\uE0B0'
	FG='%{[38;5;'
	BG='%{[30;48;5;'
	RESET='%{[0m%}'
	USER_AND_HOST="${BG}${FIRST_B}${FG}${FIRST}"
	DIR="${BG}${SECOND_B}${FG}${SECOND}"
	echo "${USER_AND_HOST}%n@%m${BG}${SECOND_B}${FG}${FIRST_B}${sharp} ${DIR}%~${RESET}${FG}${SECOND_B}${sharp} ${RESET}"
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
	echo "(%{$color%}\uE0A0$name%{$reset_color%})"
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
