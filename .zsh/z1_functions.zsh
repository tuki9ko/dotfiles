function history-all { history -E 1 }

function wincmd(){
	CMD=$1
	shift
	$CMD $* 2>&1 | iconv -f CP932 -t UTF-8
}


function sqlext(){
	cout | sed -e 's/[^"]*"\([^"]*\)".*/\1/' | cin && cout;
}

function show_256_colors(){
	for c in {000..255};
	do
		echo -n "\e[38;5;${c}m $c";
		[ $(($c%16)) -eq 15 ] && echo;
	done;
	echo
}
