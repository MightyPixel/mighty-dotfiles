#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
pushd `dirname $0` > /dev/null                  # dotfiles directory
dir=`pwd -P`
popd > /dev/null
olddir=~/dotfiles_old                           # old dotfiles backup directory

files="zshrc vimrc ctags"                                  # list of files/folders to symlink in homedir
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
rm -r -f $olddir
mkdir -p $olddir
echo "-> OK"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "-> OK"

mv ~/.vim $olddir/vim

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/$file
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

mkdir -p ~/.config/fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/tools/install.fish | fish
rm ~/.config/fish/config.fish
ln -s $dir/config.fish ~/.config/fish/config.fish

source ~/.config/fish/config.fish
omf install
