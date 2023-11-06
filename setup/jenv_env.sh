#!/usr/bin/bash
set -e
git clone https://github.com/jenv/jenv.git ~/.jenv

# Check whether zsh is installed or not
command -v zsh > /dev/null || {
    echo "Please install zsh yourself before running this script!"
    exit 1
}
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(jenv init -)"' >> ~/.zshrc


