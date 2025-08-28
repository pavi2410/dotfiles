#!/usr/bin/env bash

if [[ ! -f ~/.local/bin/mise ]]; then
    curl https://mise.run | sh
fi

if [[ ":$PATH:" != *":HOME/.local/bin:"* ]]; then
    export PATH="$PATH:$HOME/.local/bin"
fi

mise --version

MISE_TOML="$(pwd)/mise.toml"
ln -s "$MISE_TOML" ~
pushd ~
mise install
popd

BASHRC="$(pwd)/.bashrc"
echo "source \"$BASHRC\"" >> ~/.bashrc
