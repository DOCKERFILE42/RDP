# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    tightvncserver \
    xrdp \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up a default user (you can modify this as needed)
RUN useradd -ms /bin/bash user
RUN echo "user:password" | chpasswd
RUN usermod -aG sudo user

# Expose ports for RDP and VNC
EXPOSE 3389

# Set default command to run when the container starts
CMD service xrdp start && tail -f /dev/null
