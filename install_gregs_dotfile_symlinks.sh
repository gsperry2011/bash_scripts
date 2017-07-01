#!/bin/sh

dotfilesource=~/git/dotfiles/testvm
dotfileorig=~/dotfiles_orig
homedirdotfiles=".bashrc .bash_profile .gitconfig .tmux.conf .xinitrc .Xresources"
emacsinit="init.el"

echo "Backups of original dotfiles will be created in $dotfileorig"
mkdir -p $dotfileorig

# Backup and symlink of .dotfiles in ~
for file in $homedirdotfiles; do
    
    # backup file if an original exists
    if [ -f ~/$file ]
	then
	echo "Creating backup of original $file in $dotfileorig"
	mv -n ~/$file $dotfileorig
	
    fi

echo "Creating symlink to $file in ~"
ln -s $dotfilesource/$file ~/$file


done

# Backup and symlink of emacs init.el
for file in $emacsinit; do
    
    # backup file if an original exists
    if [ -f ~/.emacs.d/$file ]
	then
	echo "Creating backup of original $file in $dotfileorig"
	mv -n ~/.emacs.d/$file $dotfileorig
	
    fi

echo "Creating symlink to $file in ~/.emacs.d/"
ln -s $dotfilesource/$file ~/.emacs.d/$file


done
