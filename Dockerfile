# Use a base image with a Linux distribution
FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y \
    xrdp \
    xfce4 \
    xfce4-goodies \
    firefox \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the default display environment variable
ENV DISPLAY=:1

# Expose the RDP port
EXPOSE 3389

# Start the RDP service
CMD ["xrdp", "-n"]
