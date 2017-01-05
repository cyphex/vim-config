#!/usr/bin/env bash

if [[ ! -d "~/.vim/bundle" ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim -u ~/.vim/plugins.vim +PlugInstall +qall
else
    echo "vim-plug appears to be already initialized, stopping."
fi
