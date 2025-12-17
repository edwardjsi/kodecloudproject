# Nautilus Project: BusyBox Image Setup for Containerized Testing

This repository documents a simple but essential DevOps task performed on the Nautilus cluster as part of preparing a containerized testing environment.

## Task Overview

The development team required a lightweight BusyBox image with the `musl` libc variant to be available on **App Server 1** (`stapp01`) in Stratos DC. Additionally, the image needed to be re-tagged as `busybox:blog` for consistent reference in upcoming containerized application feature tests.

### Why this task?
- The `busybox:musl` variant is significantly smaller (~1.51 MB) compared to the glibc-based default, making it ideal for minimal container testing and reduced attack surface.
- Re-tagging to `busybox:blog` ensures team-wide consistency when referencing the image in Dockerfiles, test scripts, or `docker run` commands.
- This is a common preparatory step before building custom images or running isolated tests in a controlled environment.

## Steps Performed

All commands were executed on **App Server 1** (`stapp01`) as user `tony`.

1. Connected to the server  
   `ssh tony@stapp01`

2. Pulled the required image from Docker Hub  
   `sudo docker pull busybox:musl`

3. Re-tagged the image as requested  
   `sudo docker tag busybox:musl busybox:blog`

4. Verified the result  
   `sudo docker images | grep busybox`

   Output:
   ```
   busybox   blog   1e2006b46d8b   14 months ago   1.51MB
   busybox   musl   1e2006b46d8b   14 months ago   1.51MB
   ```

   Both tags point to the same image ID, confirming the tag operation was successful and no duplicate storage was created.

## Key Concepts Demonstrated

- **docker pull**: Downloads an image from a registry.
- **docker tag**: Creates an additional reference to an existing local image (no new layers or storage used).
- **sudo**: Required when the user is not in the `docker` group.
- **Image ID**: Unique identifier proving two tags reference identical content.

## Common Pitfalls & Fixes

- Forgetting `sudo` → Permission denied error → Add `sudo`.
- Misspelling the tag (e.g., `musl` vs `muscle`) → Manifest not found → Double-check tag name.
- Assuming `docker tag` creates a copy → It does not; verify with `docker images`.

## Usage Example

Now the team can use the custom tag directly:

```bash
sudo docker run --rm busybox:blog echo "Hello from the blog-tagged BusyBox!"
```

## References

- BusyBox on Docker Hub: https://hub.docker.com/_/busybox
- Docker documentation – tag: https://docs.docker.com/engine/reference/commandline/tag/

---

**Task completed successfully on December 17, 2025**  

Feel free to fork or use this as a template for similar image preparation tasks in your projects! 🚀
