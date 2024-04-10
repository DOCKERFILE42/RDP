FROM dorowu/ubuntu-desktop-lxde-vnc

# Import the missing GPG key for Google Chrome repository
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E88979FB9B30ACF2

# Update package repository
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Firefox browser
RUN apt-get update && apt-get install -y firefox

# Enable root access and SSH (assuming you've already modified sshd_config)
RUN mkdir /var/run/sshd

# Expose port 22 for SSH connection
EXPOSE 22

# Expose port 6080 for VNC connection (already present in the original Dockerfile)
EXPOSE 6080

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]
