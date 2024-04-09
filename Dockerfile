# Use a base image with a Linux distribution
FROM ubuntu:latest

# Set the environment variable to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies, set the keyboard layout, and start XRDP service
RUN apt-get update && \
    apt-get install -y \
    xrdp \
    xfce4 \
    xfce4-goodies \
    firefox \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && sed -i 's/# KeyboardLayout/KeyboardLayout=us/' /etc/xrdp/xrdp_keyboard.ini

# Set the default display environment variable
ENV DISPLAY=:1

# Expose the RDP port
EXPOSE 3389

# Start the XRDP service
CMD ["xrdp", "-n"]
