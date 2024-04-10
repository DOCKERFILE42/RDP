FROM dorowu/ubuntu-desktop-lxde-vnc

# Install wget and gdebi
RUN apt-get update && apt-get install -y wget gdebi

# Download and install Google Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN gdebi --n google-chrome-stable_current_amd64.deb

# Install XRDP for RDP access
RUN apt-get install -y xrdp

# Expose RDP port
EXPOSE 3389
