#!/usr/bin/bash
set -e
wget "https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh" -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda3
$HOME/miniconda3/bin/conda init $(echo $SHELL | awk -F '/' '{print $NF}')
echo 'Successfully installed miniconda...'
echo -n 'Conda version: '
$HOME/miniconda3/bin/conda --version
echo -e '\n'
exec bash
