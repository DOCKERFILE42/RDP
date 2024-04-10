FROM dorowu/ubuntu-desktop-lxde-vnc

# Install SSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get clean

# Configure SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo "root:Albin4242" | chpasswd

# Expose SSH port
EXPOSE 22

# Expose VNC port
EXPOSE 5900

# Expose web port
EXPOSE 6080

# Start SSH service
CMD service ssh start && \
    bash /startup.sh
