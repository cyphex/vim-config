#!/bin/bash

if [[ ! -d "~/.vim/bundles" ]]; then
    git clone git://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim -u ~/.vim/bundles.vim +PluginInstall +qall
else
    echo "Vundle appears to be already initialized, stopping."
fi
