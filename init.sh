#!/bin/sh

# This script is used to install packages and link dotfiles
# Run this script from the root of the repository

if ! command -v paru &> /dev/null
then
    echo "paru could not be found"
    read -p "Continue without installing packages? [y/N] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 1
    fi
    echo "Read packages.txt for a list of packages to install"
fi

echo "Installing packages..."
paru -S --needed - < packages.txt
echo "Done"

echo "Linking dotfiles..."
ln -sf $PWD/hypr/hyprland.conf $HOME/.config/hypr/hyprland.conf
ln -sf $PWD/hypr/hyprpaper.conf $HOME/.config/hypr/hyprpaper.conf

ln -sf $PWD/.zshrc $HOME/.zshrc

ln -sf $PWD/.vimrc $HOME/.vimrc

ln -sf $PWD/waybar/config $HOME/.config/waybar/config
ln -sf $PWD/waybar/style.css $HOME/.config/waybar/style.css