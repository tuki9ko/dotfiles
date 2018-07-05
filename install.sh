#!/bin/bash

cd $HOME

while read -d $'\0' file;
do
	if ! echo $file | grep \.git$;
	then
		ln -s $file -b -S .bak
	fi
done < <(find dotfiles -mindepth 1 -maxdepth 1 -print0)

unlink install.sh

Please set name and email to .gitconfig!

enjoy!

