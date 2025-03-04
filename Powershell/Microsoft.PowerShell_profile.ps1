#Alias
Set-Alias vim nvim
Set-Alias Ax arch.exe

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\powerposh.omp.json" | Invoke-Expression

#PSREAD
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle none
Set-PSReadLineKeyHandler -Chord "Ctrl+d" -Function Deletechar
Set-PSReadLineOption -PredictionSource History

#FZF
Import-Module PSFzf
Set-PSFzfOption -PSReadlineChordProvider "Ctrl+f" -Set-PSReadlineChordReverseHistory "Ctrl+r"

#FUNC
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
      Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
  }

Import-Module Terminal-Icons
