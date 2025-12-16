#!/bin/sh

# This script is used to install packages and link dotfiles
# Run this script from the root of the repository

export XDG_CONFIG_HOME="${HOME}/.config"

if ! command -v paru &> /dev/null
then
    echo "Paru could not be found"
    read -p "Continue without installing packages? [y/N] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 1
    fi
    echo "Read packages.txt for a list of packages to install"
else
    echo "Installing packages..."
    paru -S --needed - < packages.txt
    echo "Done"
fi

echo "Linking dotfiles..."
ln -sf $PWD/hypr/hyprland.conf $HOME/.config/hypr/hyprland.conf
ln -sf $PWD/hypr/hyprpaper.conf $HOME/.config/hypr/hyprpaper.conf

ln -sf $PWD/.zshrc $HOME/.zshrc

ln -sf $PWD/vim/.vimrc $HOME/.vimrc

ln -sf $PWD/.wezterm.lua $HOME/.wezterm.lua

mkdir $HOME/.config/dunst
ln -sf $PWD/dunstrc $HOME/.config/dunst/dunstrc

ln -sf $PWD/rofi/config.rasi $HOME/.config/rofi/config.rasi

read -p "Install vim-plug? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "Done"
fi

read -p "Install nvim? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ln -sf $PWD/nvim $XDG_CONFIG_HOME/nvim
    echo "Installing packer..."
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	~/.local/share/nvim/site/pack/packer/start/packer.nvim
    echo "Done"
fi

ln -sf $PWD/waybar/config $HOME/.config/waybar/config
ln -sf $PWD/waybar/style.css $HOME/.config/waybar/style.css
