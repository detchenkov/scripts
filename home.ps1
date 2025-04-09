#Switching to first desktop
Switch-Desktop 0

#Killing onedrive & SP lists
taskkill /im  OneDrive.exe /T /F
taskkill /im  Microsoft.SharePoint.exe /T /F

#Killing teams
taskkill /im  ms-teams.exe /T /F

#Killing new outlook
taskkill /im  olk.exe /T /F

#Switch-off tailscale
tailscale set --exit-node ""
tailscale down
