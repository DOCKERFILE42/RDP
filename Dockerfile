# Use a base Linux image (e.g., Ubuntu)
FROM ubuntu:latest

# Update packages and install necessary software
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    xfce4 \
    xrdp \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configure xrdp to use xfce desktop environment
RUN sed -i 's/^new_cursors=true/new_cursors=false/g' /etc/xrdp/xrdp.ini && \
    sed -i 's/^use_vsock=false/use_vsock=true/g' /etc/xrdp/xrdp.ini && \
    echo xfce4-session > ~/.xsession

# Expose RDP port
EXPOSE 3389

# Start xrdp service when the container starts
CMD ["xrdp", "--nodaemon"]
