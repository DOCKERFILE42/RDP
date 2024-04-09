# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    firefox \
    xrdp \
    xfce4 \
    xfce4-goodies \
    dbus-x11 \
    x11-xserver-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Pre-define the keyboard layout selection for US
RUN echo "keyboard-configuration keyboard-configuration/layout select us" | debconf-set-selections

# Expose RDP port
EXPOSE 3389

# Start the RDP service when the container starts
CMD ["xrdp", "-n"]
