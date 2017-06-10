
dotfilesource=~/git/dotfiles/testvm
dotfileorig=~/dotfiles_orig
homedirdotfiles=".bashrc .bash_profile .gitconfig .tmux.conf .xinitrc .Xresources"

echo "Creating backup of original dotfiles in $dotfileorig"
mkdir -p $dotfileorig

for file in $homedirdotfiles; do
    
    # backup file if an original exists
    if [ -f ~/$file ]
	then
	echo "Creating backup of original $file in $dotfileorig"
	mv ~/$file $dotfileorig
	
    fi

echo "Creating symlink to $file in ~"
ln -s $dotfilesource/$file ~/$file


done
