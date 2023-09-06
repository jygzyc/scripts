# Windows Subsystem Linux v2 scripts

## Usage

```bash
. ./proxy.sh set
```

## Automate Control

```bash
# Use Zsh as an example
echo 'alias proxy="source /path/to/proxy.sh"' >> ~/.zshrc
echo '. /path/to/proxy.sh set' >> ~/.zshrc
```

Then you can use `proxy` command to set and unset proxy