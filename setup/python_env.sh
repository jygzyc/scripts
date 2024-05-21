#!/bin/sh
set -e

# Check if the Linux distribution is a Debian series
if [ ! -f /etc/debian_version ]; then
    echo "The current Linux distribution is not a Debian series."
    exit 1
fi

# Use virtualenv and virtualenvwrapper
sudo apt update
sudo apt install python3-virtualenv python3-virtualenvwrapper

while true; do
    if [ "$SHELL" = "/bin/bash" ]; then
        if grep -q "# >>> python virtualenv config start >>>" ~/.bashrc; then
            echo "Already written to config"
            break
        fi
        echo '# >>> python virtualenv config start >>>' >> ~/.bashrc
        echo 'export WORKON_HOME=$HOME/.virtualenvs' >> ~/.bashrc
        # Prevent Error: /usr/bin/python3: Error while finding spec for 'virtualenvwrapper\
        # .hook_loader' (<class 'ImportError'>: No module named 'virtualenvwrapper')
        echo 'export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python' >> ~/.bashrc 
        echo '# <<< python virtualenv config end <<<' >> ~/.bashrc
    elif [ "$SHELL" = "/bin/zsh" ]; then
        if grep -q "# >>> python virtualenv config start >>>" ~/.zshrc; then
            echo "Already written to config"
            break
        fi
        echo '# >>> python virtualenv config start >>>' >> ~/.zshrc
        echo 'export WORKON_HOME=$HOME/.virtualenvs' >> ~/.zshrc
        # Prevent Error: /usr/bin/python3: Error while finding spec for 'virtualenvwrapper\
        # .hook_loader' (<class 'ImportError'>: No module named 'virtualenvwrapper')
        echo 'export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python' >> ~/.zshrc 
        echo 'source /usr/share/virtualenvwrapper/virtualenvwrapper.sh' >> ~/.zshrc
        echo '# <<< python virtualenv config end <<<' >> ~/.zshrc
    else
        echo "Not support shell"
        exit 1
    fi
done

echo "Please reopen shell!"


# wget "https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh" -O ~/miniconda.sh
# bash ~/miniconda.sh -b -p $HOME/miniconda3
# $HOME/miniconda3/bin/conda init $(echo $SHELL | awk -F '/' '{print $NF}')
# echo 'Successfully installed miniconda...'
# echo -n 'Conda version: '
# $HOME/miniconda3/bin/conda --version
# echo -e '\n'
# exec bash
