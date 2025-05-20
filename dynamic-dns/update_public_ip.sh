#!/bin/bash

source /etc/environment

# Make a POST request to the IONOS API to update the Dynamic DNS
# Then, storage the response in 'output'
output=$(/usr/bin/curl -X 'POST' \
  'https://api.hosting.ionos.com/dns/v1/dyndns' \
  -H "accept: application/json" \
  -H "X-API-Key: $ID.$SecretKey" \
  -H "Content-Type: application/json" \
  -d '{
  "domains": [
    "pumukydev.com",
    "www.pumukydev.com",
    "stream.pumukydev.com",
    "chat.pumukydev.com"
  ],
  "description": "Dynamic DNS"
}')

# Extract the 'updateUrl' from the JSON response using jq
updateUrl=$(echo "$output" | /usr/bin/jq -r '.updateUrl')

/usr/bin/curl -f $updateUrl
