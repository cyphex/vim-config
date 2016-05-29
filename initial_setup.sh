#!/bin/bash

if [[ ! -d "./bundles" ]]; then
    git clone git://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim
    vim -u bundles.vim +PluginInstall +qall
else
    echo "Vundle appears to be already initialized, stopping."
fi
