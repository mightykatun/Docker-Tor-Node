# Tor Node in Docker

Dockerfile to easily run a Tor node inside a container.

## Features

- Runs a full Tor relay or bridge node.
- `nyx` (the Tor monitoring tool) is pre-installed.
- You can run `nyx` inside the container to monitor and view Tor node stats.

## Usage

1. **Build the Docker image:**
   ```bash
   docker build -t tor-node .
   ```

2. **Run the container:**
   ```bash
   docker run -d --name tor-node tor-node
   ```

3. **Access the container and launch `nyx`:**
   ```bash
   docker exec -it tor-node nyx
   ```

## Compose example

   ```yaml
   services:
     tor-node:
       image: tor-node:latest
       container_name: tor-node
       restart: unless-stopped
       volumes:
         - ./config:/etc/tor:ro
       ports:
         - 9001:9001
   ```

## Notes

- Make sure to configure your `torrc` if needed (e.g., for relay/bridge settings).
- `nyx` provides real-time statistics and monitoring for your running Tor instance.
