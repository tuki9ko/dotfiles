dotfiles
====

dotfiles

## Description

新しい環境作ったらとりあえずクローンしておけば自分にとって最低限オッケーな環境を提供します。

## Install

1. ホームディレクトリでリポジトリをクローン `git clone https://github.com/tuki9ko/dotfiles.git`
2. インストーラ実行 `bash dotfiles/install.sh`
3. **.gitconfig** を書き換える `vim .gitconfig`

## Note

- .gitconfig
	- 仕事用とそうじゃない用のアカウントを使い分けるためにあえて不完全な設定にしてます。もっと良い方法があったら直す
- .vimrc
	- 普段 NeoVim を使ってるので不完全な設定になってます(怠慢)。NeoVim の設定は現状リポジトリを分けてます->[nvim_conf](https://github.com/tuki9ko/nvim_conf.git)。統合は考えてるけど気が向かない。
