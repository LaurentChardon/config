Quick and easy CLI config

To set up:

for folder in zsh tmux nvim
do
	[ -d $HOME/.config/${folder} ] && mv $HOME/.config/${folder} $HOME/.config/${folder}.bak
	ln -s ${PWD}/${folder} $HOME/.config/
done
[ -f $HOME/.zshenv ] && mv $HOME/.zshenv $HOME/.zshenv.bak
ln -s ${PWD}/zsh/.zshenv $HOME/
