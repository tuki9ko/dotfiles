#!/bin/bash


echo -n "installing git..."
if exists "git"; then
	echo-green "already installed!"
else
	sudo apt install -y git
fi
echo "done."
echo ""

echo -n "installing anyenv..."
if exists "anyenv"; then
	echo-green "already installed!"
else
	if get-bool-y "Do you want to install anyenv?"; then
		git clone https://github.com/anyenv/anyenv $HOME/.anyenv
	else
		echo-red "Skipping install anyenv."
	fi
fi
echo "done."
echo ""

echo -n "installing zsh..."
if exists "zsh"; then
	echo-green "already installed!"
else
	if get-bool-y "Do you want to install zsh?"; then
		sudo apt install -y zsh
	else
		echo-red "Skipping install zsh."
	fi
fi
echo "done."
echo ""

echo -n "installing htop..."
if exists "htop"; then
	echo-green "already installed!"
else
	if get-bool-y "Do you want to install htop?"; then
		sudo apt install -y htop
	else
		echo-red "Skipping install htop."
	fi
fi
echo "done."
echo ""

