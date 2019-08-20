#!/bin/bash

# ファイル,ディレクトリ,コマンドなどの存在チェック
function exists(){
	return `type $1 > /dev/null 2>&1`
}

# 2択(デフォルトYes)
function get-bool-y(){
	read -p "$1 [Y/n] >" answer
	answer=$(printf $answer | grep -iE '^(yes|y|no|n)$' | tr "[:lower:]" "[:upper:]")

	case "$answer" in
		"Y" | "YES" ) return 0;;
		"N" | "NO" ) return 1;;
		"*" ) return 0;;
	esac
}

# 2択(デフォルトNo)
function get-bool-n(){
	read -p "$1 [y/N] >" answer
	answer=$(printf $answer | grep -iE '^(yes|y|no|n)$' | tr "[:lower:]" "[:upper:]")

	case "$answer" in
		"Y" | "YES" ) return 0;;
		"N" | "NO" ) return 1;;
		"*" ) return 1;;
	esac
}

alias get-bool="get-bool-y"
