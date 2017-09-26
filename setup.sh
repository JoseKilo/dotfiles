#!/bin/bash

mkdir -p $HOME/workspace

if [ ! -d "$HOME/workspace/vim"  ] ; then
    git clone git@github.com:vim/vim.git "$HOME/workspace/vim"
fi

if [ ! -d "$HOME/workspace/dotfiles"  ] ; then
    git clone git@github.com:JoseKilo/dotfiles.git "$HOME/workspace/dotfiles"
fi

if [ ! -d "$HOME/workspace/vimrc"  ] ; then
    git clone git@github.com:JoseKilo/vimrc.git "$HOME/workspace/vimrc"
fi

ln -s "$HOME/workspace/vimrc/vimrc" "$HOME/.vimrc"
ln -s "$HOME/workspace/vimrc/compile.sh" "$HOME/workspace/vim/"
ln -s "$HOME/workspace/dotfiles/bashrc" "$HOME/.bashrc"
ln -s "$HOME/workspace/dotfiles/tmux.conf" "$HOME/.tmux.conf"
ln -s "$HOME/workspace/dotfiles/tint2/" "$HOME/.config/tint2"
ln -s "$HOME/workspace/dotfiles/terminator/" "$HOME/.config/terminator"
ln -s "$HOME/workspace/dotfiles/openbox/" "$HOME/.config/openbox"
ln -s "$HOME/workspace/vimrc/dictionaries/" "$HOME/.vim/dictionaries"
ln -s "$HOME/workspace/vimrc/spell/" "$HOME/.vim/spell"
ln -s "$HOME/workspace/vimrc/UltiSnips/" "$HOME/.vim/UltiSnips"
