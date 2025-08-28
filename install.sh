#!/usr/bin/env bash

if [[ ! -f ~/.local/bin/mise ]]; then
    curl https://mise.run | sh
fi

if [[ ":$PATH:" != *":HOME/.local/bin:"* ]]; then
    export PATH="$PATH:$HOME/.local/bin"
fi

mise --version
mise trust .

mise install

mise dr

BASHRC="$(pwd)/.bashrc"
echo 'source "$BASHRC"' >> ~/.bashrc
