echo Current directory: $PWD
echo Home directory: $HOME

##### EMACS #####
ln -s $PWD/emacs/.emacs $HOME/.emacs 

##### i3 #####
ln -s $PWD/i3/.config/i3/config $HOME/.config/i3/config
ln -s $PWD/i3/.config/i3/i3blocks.conf $HOME/.config/i3/i3blocks.conf  