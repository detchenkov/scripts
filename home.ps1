#Switching to first desktop
Switch-Desktop 0

#Killing onedrive & SP lists
taskkill /im  OneDrive.exe /T /F
taskkill /im  Microsoft.SharePoint.exe /T /F

#Killing teams
taskkill /im  ms-teams.exe /T /F

#Killing new outlook
taskkill /im  olk.exe /T /F

#Killing forticlient
taskkill /im  FortiClient.exe /T /F

#Switch-off tailscale
tailscale set --exit-node ""
tailscale switch 2b56
tailscale down

#Changing awake settings
$awakeSettings = Get-Content $env:LOCALAPPDATA\Microsoft\PowerToys\Awake\settings.json -Raw | ConvertFrom-Json
$awakeSettings.properties.mode = 0
($awakeSettings | ConvertTo-Json) | Set-Content $env:LOCALAPPDATA\Microsoft\PowerToys\Awake\settings.json
