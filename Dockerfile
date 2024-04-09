# Use an appropriate base image
FROM ubuntu:latest

# Set the environment variable for the keyboard layout
ENV DEBIAN_FRONTEND=noninteractive \
    KEYBOARD_LAYOUT=us

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y \
    chromium-browser \
    xrdp \
    xfce4 \
    xfce4-goodies \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the default keyboard layout
RUN echo "setxkbmap $KEYBOARD_LAYOUT" > /etc/profile.d/keyboard.sh

# Expose the RDP port
EXPOSE 3389

# Set the default command to launch RDP server
CMD ["xrdp", "--nodaemon"]
