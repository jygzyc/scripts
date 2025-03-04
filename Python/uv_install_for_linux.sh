#!/usr/bin/bash
set -e

# Check whether zsh is installed or not
command -v curl > /dev/null || {
    echo "Please install curl yourself before running this script!"
    exit 1
}

curl -LsSf https://astral.sh/uv/install.sh | sh

if ! grep -q '# >>> python uv config start >>>' ~/.profile; then
    cat << 'EOF' >> ~/.profile

# >>> python uv config start >>>
export UV_PYTHON_BIN_DIR=$HOME/.uv/python/bin
export UV_PYTHON_INSTALL_DIR=$HOME/.uv/python
export UV_TOOL_BIN_DIR=$HOME/.uv/tool/bin
export UV_TOOL_DIR=$HOME/.uv/tool
export PATH=$UV_PYTHON_BIN_DIR:$UV_TOOL_BIN_DIR:$PATH
# <<< python uv config end <<<
EOF
fi
