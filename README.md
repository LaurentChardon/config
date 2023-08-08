# Quick and easy CLI config

These config files are custom made or tuned (I've taken some ideas here and there) to my own liking. This repository can be a good starting point to create your own config. It is specifically about my command line tools, currently kitty, zsh, tmux and neovim.

## To set up:
Install the packages for the kitty, zsh, tmux and nvim (neovim). Then copy the config files at the right location. One way to do this is the following, to be typed where this README.md file is located:

	for folder in kitty zsh tmux nvim
	do
		[ -d $HOME/.config/${folder} ] && mv $HOME/.config/${folder} $HOME/.config/${folder}.bak
		ln -s ${PWD}/${folder} $HOME/.config/
	done
	[ -f $HOME/.zshenv ] && mv $HOME/.zshenv $HOME/.zshenv.bak
	ln -s ${PWD}/zsh/.zshenv $HOME/

This will create the right structure on most new installs, and will attempt to save your old settings if you have some. Be careful not to run the command more than once, as then you will overwrite your old settings.
