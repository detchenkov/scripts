# Start OneDrive + Sharepoint lists sync
& 'C:\Program Files\Microsoft OneDrive\OneDrive.exe' /background

& 'C:\Program Files\Microsoft OneDrive\24.128.0625.0001\Microsoft.SharePoint.exe'

#Launching teams
& $env:LOCALAPPDATA\Microsoft\WindowsApps\ms-teams.exe

#Launching new outlook
& $env:LOCALAPPDATA\Microsoft\WindowsApps\olk.exe

#Switching to second desktop
Switch-Desktop 1
