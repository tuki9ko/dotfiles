# ヒストリ表示
function history-all {
	history -E 1
}

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
	if exists peco ; then
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
