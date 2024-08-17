#!/bin/sh
mkdir -p $HOME/.config
mkdir -p $HOME/bin

for folder in kitty zsh tmux
do
  [ -d $HOME/.config/${folder} ] && mv $HOME/.config/${folder} $HOME/.config/${folder}.bak
  ln -s ${PWD}/${folder} $HOME/.config/
done

HERE=$(pwd -P)
for i in scripts/*
do
	ln -s $HERE/$i $HOME/bin
done

[ -f $HOME/.zshenv ] && mv $HOME/.zshenv $HOME/.zshenv.bak
ln -s ${PWD}/zsh/.zshenv $HOME/
