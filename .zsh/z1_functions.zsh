function history-all { history -E 1 }

function wincmd(){
	CMD=$1
	shift
	$CMD $* 2>&1 | iconv -f CP932 -t UTF-8
}


function sqlext(){
	cout | sed -e 's/[^"]*"\([^"]*\)".*/\1/' | cin && cout;
}

function lscd(){
	if [ `which peco` ] ; then
		local dir="$( find . -maxdepth 1 -type d | sed -e 's;\./;;' | peco )"
		if [ ! -z "$dir" ] ; then
			cd "$dir"
			lscd
		fi
	fi
}
