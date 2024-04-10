FROM dorowu/ubuntu-desktop-lxde-vnc
EXPOSE 6080

# Specify non-root user for Supervisor
RUN sed -i 's/\[supervisord\]/\[supervisord\]\nuser=Albin/g' /etc/supervisor/supervisord.conf
