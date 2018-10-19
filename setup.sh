#!/bin/bash

DOT_FILES=( .bashrc .zsh .gitconfig .gitignore .inputrc .vim .vimrc .gnuplot .jupyter .sqliterc )

for file in ${DOT_FILES[@]}
do
    if [ ! -e $HOME/$file ]; then
        ln -s $HOME/.dotfiles/$file $HOME/$file
    fi
done

# [ -d ~/.pyenv ] && jupyter notebook --generate-config

