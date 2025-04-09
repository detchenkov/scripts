#Switching to second desktop
Switch-Desktop 1

# Start OneDrive + Sharepoint lists sync
Start-Process 'C:\Program Files\Microsoft OneDrive\OneDrive.exe' /background

Start-Process 'C:\Program Files\Microsoft OneDrive\24.128.0625.0001\Microsoft.SharePoint.exe'

#Launching teams
Start-Process $env:LOCALAPPDATA\Microsoft\WindowsApps\ms-teams.exe

#Launching new outlook
Start-Process $env:LOCALAPPDATA\Microsoft\WindowsApps\olk.exe

#Changing awake settings
$awakeSettings = Get-Content $env:LOCALAPPDATA\Microsoft\PowerToys\Awake\settings.json -Raw | ConvertFrom-Json
$awakeSettings.properties.mode = 3
$awakeSettings.properties.expirationDateTime = (Get-Date -Hour 16 -Minute 45 -Second 0 -Millisecond 0)
($awakeSettings | ConvertTo-Json) | Set-Content $env:LOCALAPPDATA\Microsoft\PowerToys\Awake\settings.json

#Starting tailscale
tailscale up
$currentNet = (Get-NetIPConfiguration | Select-Object -ExpandProperty NetProfile | Where-Object InterfaceAlias -eq "WiFi").Name
if ($currentNet -like "CTC_*") {
  tailscale set --exit-node $Env:EXIT_NODE
}
