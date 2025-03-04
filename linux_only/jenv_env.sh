#!/usr/bin/bash
set -e
git clone https://github.com/jenv/jenv.git ~/.jenv

echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.profile
echo 'eval "$(jenv init -)"' >> ~/.profile


