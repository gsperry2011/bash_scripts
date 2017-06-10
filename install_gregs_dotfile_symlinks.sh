
dotfilesource=~/git/dotfiles/testvm
dotfileorig=~/dotfiles_orig
homedirdotfiles=".gitconfig" #".bashrc .bash_profile .gitconfig .tmux.conf .xinitrc .Xresources"

echo "Creating backup of original dotfiles in $dotfileorig"
mkdir -p $dotfileorig

for file in $homedirdotfiles; do
    echo "Moving $file to $dotfileorig if it exists"
    mv ~/$homedirdotfiles $dotfileorig
    echo "Creating symlink to $file in ~"
    ln -s $dotfilesource/$homedirdotfiles ~/$homedirdotfiles
done
