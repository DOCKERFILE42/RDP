FROM dorowu/ubuntu-desktop-lxde-vnc

# Update package repository
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Firefox browser
RUN RUN apt-get clean && apt-get update && apt-get install -y firefox

# Enable root access and SSH (assuming you've already modified sshd_config)
RUN mkdir /var/run/sshd

# Expose port 22 for SSH connection
EXPOSE 22

# Expose port 6080 for VNC connection (already present in the original Dockerfile)
EXPOSE 6080

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]
