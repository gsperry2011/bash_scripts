#!/bin/sh

# Dot files
dotfilesource=~/git/dotfiles/testvm
# Backup of originals
dotfileorig=~/dotfiles_orig
# Names of dot files for targeting. They are split into different
# variables based on the directory they are in
homedirdotfiles=".bashrc .bash_profile .gitconfig .tmux.conf .xinitrc .Xresources"
emacsinit="init.el"
i3config="config"

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

# Backup and symlink of i3 config file
for file in $i3config; do
    
    # backup file if an original exists
    if [ -f ~/.config/i3/$file ]
	then
	echo "Creating backup of original $file in $dotfileorig"
	mv -n ~/.config/i3/$file $dotfileorig
	
    fi

echo "Creating symlink to $file in ~/.config/i3/"
ln -s $dotfilesource/$file ~/.config/i3/$file

done

# Backup and symlink creation of public scripts dir
for file in $pubscripts; do
    
    # backup file if an original exists
    if [ -f ~/$file ]
	then
	echo "Creating backup of original $file in $dotfileorig"
	mv -n ~/$file $dotfileorig
	
    fi

echo "Creating symlink to $file in ~"
ln -sf ~/git/dotfiles/testvm/scripts ~/$file

done
