#!/bin/bash 
echo Current directory: $PWD
echo Home directory: $HOME

##### EMACS #####
mkdir $HOME/.emacs.d
ln -s $HOME/.emacs.d/init.el $HOME/.emacs
ln -s $PWD/emacs/.emacs.d/init.el $HOME/.emacs.d/init.el
ln -s $PWD/emacs/.emacs.d/config.org $HOME/.emacs.d/config.org

##### i3 #####
ln -s $PWD/i3/.config/i3/config $HOME/.config/i3/config
ln -s $PWD/i3/.config/i3/i3blocks.conf $HOME/.config/i3/i3blocks.conf

##### NVIM #####
ln -s $PWD/nvim/.config/nvim $HOME/.config/nvim

##### SCRIPTS #####
ln -s $PWD/scripts $HOME/scripts
