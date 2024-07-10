#Switching to second desktop
Switch-Desktop 1

# Start OneDrive + Sharepoint lists sync
Start-Process 'C:\Program Files\Microsoft OneDrive\OneDrive.exe' /background

Start-Process 'C:\Program Files\Microsoft OneDrive\24.128.0625.0001\Microsoft.SharePoint.exe'

#Launching teams
Start-Process $env:LOCALAPPDATA\Microsoft\WindowsApps\ms-teams.exe

#Launching new outlook
Start-Process $env:LOCALAPPDATA\Microsoft\WindowsApps\olk.exe
