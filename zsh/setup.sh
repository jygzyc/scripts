#!/bin/sh

# Check whether zsh is installed or not
command -v zsh > /dev/null || {
    echo "Please install zsh yourself before running this script!"
    exit 1
}

echo "Trying to install Oh My Zsh from GitHub..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Check if installation succeeded
if [ ! -d ~/.oh-my-zsh ]; then
  echo "Failed to install Oh My Zsh from GitHub."
  echo "Trying to install Oh My Zsh from Gitee..."
  
  # do second installation
  sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)"
  if [ ! -d ~/.oh-my-zsh ]; then
    echo "Failed to install Oh My Zsh from Gitee."
    exit 1
  else
    echo "Successfully installed Oh My Zsh from Gitee."
  fi
else
  echo "Successfully installed Oh My Zsh from GitHub."
fi

# Change oh-my-zsh theme to ys
echo "Changing default theme from 'robbyrussell' to 'ys'"
sed -i -e 's|ZSH_THEME="robbyrussell"|ZSH_THEME="ys"|' "$HOME"/.zshrc

# Download and install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo "zsh-autosuggestions plugin has been installed!"

# Download and install zsh-syntax-highlighting 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "zsh-syntax-highlighting plugin has been installed!"

# 更新 zsh 配置文件，启用这些插件
sed -i -e 's|plugins=(git)|plugins=(git zsh-autosuggestions zsh-syntax-highlighting)|' "$HOME"/.zshrc
echo "Configuration for these plugins has been added to your .zshrc file."

# 重新载入 zsh 配置
source ~/.zshrc
echo "Zsh configuration has been reloaded!"




