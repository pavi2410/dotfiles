Remove-Item alias:curl

Import-Module posh-git

Invoke-Expression (&starship init powershell)

# https://github.com/PowerShell-Completion/npm-completion
Import-Module npm-completion

# https://github.com/matt9ucci/DockerCompletion
Import-Module DockerCompletion

# https://github.com/microsoft/winget-cli/blob/master/doc/Completion.md
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

# https://cli.github.com/manual/gh_completion
Invoke-Expression -Command $(gh completion -s powershell | Out-String)
