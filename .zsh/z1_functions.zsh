# ヒストリ表示
function history-all { history -E 1 }

# MSYS2 使ってた時の名残
function wincmd(){
	CMD=$1
	shift
	$CMD $* 2>&1 | iconv -f CP932 -t UTF-8
}

# ソースコード中に書かれたSQLを抽出する
# クリップボードで渡された文字列の中で '"' で囲まれた文字を抽出してクリップボードに上書きする
function sqlext(){
	cout | sed -e 's/[^"]*"\([^"]*\)".*/\1/' | cin && cout;
}

# peco でグラフィカルに cd 
function lscd(){
	if [ `which peco` ] ; then
		local dir="$( find . -maxdepth 1 -type d | sed -e 's;\./;;' | peco )"
		if [ ! -z "$dir" ] ; then
			cd "$dir"
			lscd
		fi
	fi
}

# cd file で file のあるディレクトリに移動
function cd(){
	if [[ -e $1 && ! -d $1 ]]; then
		builtin cd -- "$(dirname -- "$1")"
	else
		builtin cd "$@"
	fi

	local ret=$?
	if [[ ($ret -eq 0) && (${#FUNCNAME[*]} -eq 1) ]]; then
		history -s cd $(printf "%q" "$PWD")
	fi
	return $ret
}

# crontab -r を封印
function crontab(){
	local opt
	for opt in "$@"; do
		if [[ $opt == -r ]]; then
			echo 'crontab -r is sealed!'
			return 1
		fi
	done
	command crontab "$@"
}

# ファイル,ディレクトリ,コマンドなどの存在チェック
function exist(){
	return `type $1 > /dev/null 2>&1`
}

# プラべ用のアカウントで git init(グローバルは仕事用)
function git-formal-init(){
	git init
	git config --local user.name "tuki9ko"
	git config --local user.email "arkmisha@gmail.com"
}

# プラべ用のアカウントで過去改変
function fix-formal-committer(){
	echo '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
	echo '@    WARNING: THIS COMMAND REWRITES HISTORY!!    @'
	echo '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
	echo 'Are you sure you want to continue executing [y/N]? >'
	
	read answer
	answer=`printf $answer | grep -iE '^(yes|y|no|n)$' | tr "[:lower:]" "[:upper:]"`

	case "$answer" in
		"Y" | "YES" )
			git filter-branch -f --env-filter "GIT_AUTHOR_NAME='tuki9ko'; GIT_AUTHOR_EMAIL='arkmisha@gmail.com'; GIT_COMMITTER_NAME='tuki9ko'; GIT_COMMITTER_EMAIL='arkmisha@gmail.com';" HEAD
			echo 'Done. If you use remote branch, please execute `git push -f ...` .'
			;;
		"*" )
			echo 'Aborted'
			;;
	esac
}