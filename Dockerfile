FROM dorowu/ubuntu-desktop-lxde-vnc

# Install Chrome browser
RUN apt-get update && apt-get install -y wget gnupg ca-certificates
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update && apt-get install -y google-chrome-stable

# Install XRDP
RUN apt-get install -y xrdp

# Expose RDP port
EXPOSE 3389
