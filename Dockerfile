# Use an appropriate base image
FROM ubuntu:latest

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

# Expose the RDP port
EXPOSE 3389

# Set the default command to launch RDP server
CMD ["xrdp", "--nodaemon"]
