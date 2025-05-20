# Dynamic DNS

This directory contains the necessary configuration and scripts to enable dynamic DNS updates for your domain using IONOS's DynDNS service. These updates ensure that your domain always points to your current public IP address, even if it changes.

## Structure

- **`dyndns-cronjob`**: Configuration or scripts to automate the DynDNS update process through a cron job.
- **`update_public_ip.sh`**: Scripts used to make the API request to IONOS DynDNS.
- **`.env`**: Environment file where API key is stored.
