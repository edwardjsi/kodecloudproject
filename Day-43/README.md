# Day 43 – Docker Ports Mapping

## Goal
Deploy a running Nginx container with specific naming and host-to-container port mapping on a production-like application server.

## What I did
- Pulled the official stable Nginx image using `docker pull nginx:stable` to ensure a reliable, tested version from Docker Hub.
- Launched the container with `docker run -d --name cluster -p 8084:80 nginx:stable`, applying detached mode, exact naming, and precise port mapping (host 8084 → container 80).
- Verified the deployment by checking container status with `docker ps --filter "name=cluster"` and testing connectivity with `curl -s http://localhost:8084`, confirming the default Nginx welcome page was served correctly.

## What this proves
- I can follow official docs and not copy-paste blindly.
- I understand why the command/feature exists, not just the syntax (e.g., port mapping avoids host conflicts, detached mode ensures persistence, explicit naming aids management).
- I know how to verify container health and functionality end-to-end, not just assume success after running a command.

## How this helps a client/employer
- I can help you set up containerized web services quickly and reliably in multi-app environments.
- I can troubleshoot Docker networking issues, port conflicts, or failed deployments in production or development setups.
