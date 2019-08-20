#!/bin/bash

# 色付きecho
function __colorecho(){
	echo -e "\e[$2m$1\e[0m"
}

# 赤
function echo-red(){
	echo $(__colorecho "$1" "31")
}

# 緑
function echo-green(){
	echo $(__colorecho "$1" "32")
}

# 黄
function echo-yellow(){
	echo $(__colorecho "$1" "33")
}

# 青
function echo-blue(){
	echo $(__colorecho "$1" "34")
}

# 紫
function echo-purple(){
	echo $(__colorecho "$1" "35")
}

# 水
function echo-cyan(){
	echo $(__colorecho "$1" "36")
}

