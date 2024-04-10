FROM dorowu/ubuntu-desktop-lxde-vnc

# Install Firefox browser
RUN apt-get update && apt-get install -y firefox

# Enable root access
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Enable SSH connection
RUN mkdir /var/run/sshd

# Expose port 22 for SSH connection
EXPOSE 22

# Expose port 6080 for VNC connection (already present in the original Dockerfile)
EXPOSE 6070

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]
