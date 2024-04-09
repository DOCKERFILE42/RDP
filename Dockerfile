# Use the official Ubuntu base image
FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    firefox \
    xrdp \
    xfce4 \
    xfce4-goodies \
    dbus-x11 \
    x11-xserver-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the keyboard layout as an environment variable
ENV TZ=UTC
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "tzdata tzdata/Areas select UTC" > preseed.txt; \
    echo "tzdata tzdata/Zones/UTC select UTC" >> preseed.txt; \
    debconf-set-selections preseed.txt && \
    rm -f preseed.txt

RUN apt-get install -y keyboard-configuration

RUN echo "keyboard-configuration keyboard-configuration/layout select us" > /etc/debconf.conf
RUN echo "keyboard-configuration keyboard-configuration/layoutcode select us" >> /etc/debconf.conf
RUN dpkg-reconfigure -f noninteractive keyboard-configuration

# Expose RDP port
EXPOSE 3389

# Start the RDP service when the container starts
CMD ["xrdp", "-n"]
