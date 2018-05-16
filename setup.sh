#!/bin/bash

DOT_FILES=( .bashrc .zsh .zshrc .gitconfig .gitignore .inputrc .vim .vimrc .xvimrc .gemrc .uncrc .gdbinit .gnuplot .jupyter )

for file in ${DOT_FILES[@]}
do
    if [ ! -e $HOME/$file ]; then
        ln -s $HOME/.dotfiles/$file $HOME/$file
    fi
done

# [ -d ~/.pyenv ] && jupyter notebook --generate-config

