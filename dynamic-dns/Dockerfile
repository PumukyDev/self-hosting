FROM debian:12.8

# Install required packages
RUN apt-get update && apt-get -y install cron curl jq

# Set working directory to /opt/dynamic-dns
WORKDIR /opt/dynamic-dns

# Copy your script and necessary files into the container
COPY update_public_ip.sh /opt/dynamic-dns/
COPY dyndns-cronjob /etc/cron.d/
COPY .env /etc/environment

# Set correct permissions for the scripts and cronjob
RUN chmod +x /opt/dynamic-dns/update_public_ip.sh
RUN chmod 0644 /etc/cron.d/dyndns-cronjob

# Install the cron job
RUN crontab /etc/cron.d/dyndns-cronjob

# Dockerfile

CMD ["cron", "-f"]
