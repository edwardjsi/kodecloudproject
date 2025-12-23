# Nautilus DevOps Project - Day 43: Docker Ports Mapping

**Ticket Overview**  
The Nautilus DevOps team needed to host a simple web application using an Nginx-based container on **Application Server 3** in Stratos Datacenter. This ticket is part of a larger initiative to standardize web hosting across the fleet using Docker containers instead of bare-metal installations (to avoid port conflicts, ensure consistency, and enable easy scaling).

**Requirements**  
a. Pull the official `nginx:stable` Docker image on Application Server 3.  
b. Create and run a container named **cluster** using the pulled image.  
c. Map host port **8084** to container port **80**.  
d. Ensure the container remains in a running state.

**Environment Details**  
- Server: Application Server 3 (stapp03.stratos.xfusioncorp.com)  
- User: banner (or thor/nautilus as per lab)  
- OS: RHEL-based with Docker pre-installed  
- Date Completed: December 23, 2025

**Step-by-Step Commands Executed**

1. **Pull the required Nginx image**  
   Command:  
   docker pull nginx:stable  

   Explanation:  
   This command downloads the official stable version of the Nginx image from Docker Hub. Using the `:stable` tag ensures we get a tested, reliable release rather than the potentially unstable `:latest`.

2. **Launch the container with correct naming and port mapping**  
   Command:  
   docker run -d --name cluster -p 8084:80 nginx:stable  

   Explanation:  
   - `-d`: Runs the container in detached mode (background) so it persists after logout.  
   - `--name cluster`: Assigns the exact name required by the ticket.  
   - `-p 8084:80`: Maps host port 8084 to container port 80 (Nginx's default HTTP port). This avoids conflicts with any service using port 80 on the host.  
   - `nginx:stable`: Specifies the image to use.

3. **Verification commands**  
   Command:  
   docker ps --filter "name=cluster" && echo "=== Testing nginx on port 8084 ===" && curl -s http://localhost:8084  

   Explanation:  
   - `docker ps --filter "name=cluster"`: Confirms the container is running and shows the correct port binding (0.0.0.0:8084->80/tcp).  
   - `curl -s http://localhost:8084`: Tests connectivity and validates that Nginx is serving the default welcome page through the mapped port.

**Results**  
- Container named **cluster** successfully created and running.  
- Port mapping functional: traffic to host:8084 reaches Nginx on container:80.  
- Response confirmed with standard "Welcome to nginx!" page.  
- Task validated and marked complete on the KodeKloud Engineer platform.

**Common Mistakes & How to Avoid/Fix Them**  
- Forgetting `-d`: Container stops when session ends → Always use detached mode for services.  
- Wrong port order (`-p 80:8084`): Reverses mapping → Use `host_port:container_port` format.  
- Incorrect image tag: Using `:latest` instead of `:stable` → Follow ticket specifications exactly.  
- Naming mismatch: Container not named "cluster" → Use `--name cluster` precisely.

**Key Takeaways**  
- Docker port mapping (`-p`) is essential for running multiple web services safely on the same host.  
- Explicit naming and detached mode are best practices for production-like deployments.  
- Always verify with `docker ps` and application-level tests (curl) after deployment.

**Status**: **Completed Successfully** 🚀  

