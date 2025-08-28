#!/usr/bin/env bash

if [[ ! -f ~/.local/bin/mise ]]; then
    curl https://mise.run | sh
fi

if [[ ":$PATH:" != *":HOME/.local/bin:"* ]]; then
    export PATH="$PATH:$HOME/.local/bin"
fi

mise --version
mise trust .

if [[ -d "$CODESPACES_VSCODE_FOLDER" ]]; then
    mise trust "$CODESPACES_VSCODE_FOLDER"
fi

mise install

eval "$(~/.local/bin/mise activate bash)"

mise dr

eval "$(starship init bash)"

