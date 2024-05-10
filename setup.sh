#!/bin/sh
mkdir -p $HOME/.config

for folder in kitty zsh tmux
do
  [ -d $HOME/.config/${folder} ] && mv $HOME/.config/${folder} $HOME/.config/${folder}.bak
  ln -s ${PWD}/${folder} $HOME/.config/
done

[ -f $HOME/.zshenv ] && mv $HOME/.zshenv $HOME/.zshenv.bak
ln -s ${PWD}/zsh/.zshenv $HOME/
