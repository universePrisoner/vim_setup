#!/bin/bash

root="./test"

mkdir -p "$root"/.vim/autoload "$root"/.vim/pack "$root"/.vim/plugged

cp -R ./autoload "$root"/.vim/autoload
cp ./.vimrc "$root"/.vimrc

# CTRP https://github.com/ctrlpvim/ctrlp.vim
mkdir -p ~/.vim/pack/plugins/start
git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git "$root"/.vim/pack/plugins/start/ctrlp
