#!/bin/sh

# wait-for-it.sh
# Waits for a list of host:port pairs to become available

set -e

# List of targets (format: host:port), separated by space
PROXIED_TARGETS="${PROXIED_TARGETS:-nginx_chat:80 nginx_streaming:80}"
TIMEOUT="${TIMEOUT:-60}"

echo "[wait-for-it] Starting health checks..."

for target in $PROXIED_TARGETS; do
  host=$(echo "$target" | cut -d: -f1)
  port=$(echo "$target" | cut -d: -f2)

  echo "[wait-for-it] Checking $host:$port..."

  start_time=$(date +%s)
  while ! nc -z "$host" "$port"; do
    sleep 1
    now=$(date +%s)
    elapsed=$((now - start_time))

    if [ "$elapsed" -ge "$TIMEOUT" ]; then
      echo "[wait-for-it] ERROR: Timeout reached while waiting for $host:$port (${TIMEOUT}s)"
      exit 1
    fi
  done

  echo "[wait-for-it] $host:$port is available."
done

echo "[wait-for-it] All targets are ready. Proceeding..."
exec "$@"
