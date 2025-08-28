eval "$(~/.local/bin/mise activate bash)"

if [[ -d "$CODESPACES_VSCODE_FOLDER" ]]; then
    mise trust "$CODESPACES_VSCODE_FOLDER"
fi

eval "$(starship init bash)"
