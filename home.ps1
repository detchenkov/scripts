#Killing onedrive & SP lists
pskill -t -nobanner OneDrive.exe
pskill -t -nobanner Microsoft.SharePoint.exe

#Killing teams
pskill -t -nobanner ms-teams.exe

#Killing new outlook
pskill -t -nobanner olk.exe

#Switching to first desktop
Switch-Desktop 0
