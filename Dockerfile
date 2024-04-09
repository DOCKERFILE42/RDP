# Use a base image with a Linux distribution
FROM ubuntu:latest

# Install xrdp and XFCE desktop environment
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    xrdp \
    xfce4 \
    xfce4-goodies \
    firefox \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Expose RDP port
EXPOSE 3389

# Start xrdp service
CMD ["xrdp", "-n"]
