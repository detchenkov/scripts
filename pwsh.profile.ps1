oh-my-posh --init --shell pwsh --config 'd:\Code\Scripts\posh-mytheme.omp.json' | Invoke-Expression

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
