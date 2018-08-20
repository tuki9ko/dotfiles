export XDG_CACHE_DIR=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

export DISPLAY=localhost:0.0

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export DefaultIMModule=fcitx
xset -r 49

if type g++-7 >/dev/null 2>&1; then
	export CXX='g++-7'
	export CC='gcc-7'
fi

if [ -d $HOME/.anyenv ]
then
	export PATH="$HOME/.anyenv/bin:$PATH"
	eval "$(anyenv init - zsh)"
fi

WORDCHARS='?_-.[]~=&;!#$%^(){}<>'

LESS=' -R '

