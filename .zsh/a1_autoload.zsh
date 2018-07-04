autoload -U colors; colors
autoload -U compinit; compinit
autoload -Uz zmv
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
