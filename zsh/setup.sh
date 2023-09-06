#!/usr/bin/env bash

# Check whether zsh is installed or not
command -v zsh > /dev/null || {
    echo "Please install zsh yourself before running this script!"
    exit 1
}

# Install oh-my-zsh in unattended mode - no prompts to change shell, or open a zsh prompt after it completes
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Change oh-my-zsh theme to ys
echo "Changing default theme from 'robbyrussell' to 'ys'"
sed -i -e 's|ZSH_THEME="robbyrussell"|ZSH_THEME="ys"|' "$HOME"/.zshrc

# Install zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zsh-syntax-highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Change Plugin
echo "Install Plugin"
sed -i -e 's|plugins=(git)|plugins=(git zsh-autosuggestions zsh-syntax-highlighting)|' "$HOME"/.zshrc