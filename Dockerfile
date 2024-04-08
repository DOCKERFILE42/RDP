# Use the official Windows Server Core base image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Install RDP and configure user
RUN powershell -Command \
    $username = 'Albin'; \
    $password = 'Albin4242' | ConvertTo-SecureString -AsPlainText -Force; \
    New-LocalUser -Name $username -Password $password -FullName $username -Description "Local Administrator"; \
    Add-LocalGroupMember -Group administrators -Member $username; \
    Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0; \
    Enable-NetFirewallRule -DisplayGroup "Remote Desktop"; \
    Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 1

# Expose RDP port
EXPOSE 3389
