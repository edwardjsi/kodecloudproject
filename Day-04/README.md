# Day 04 – Creating Automated Backup Scripts with Secure Remote Transfer

## Goal
Create robust bash backup scripts that archive web application directories, store them locally, and securely copy them to a remote backup server without password prompts.

## What I did
- Logged into the app server as a non-privileged user (tony) and manually installed the zip package using sudo outside the script, as the script itself could not use elevated privileges.
- Generated an SSH key pair for the app user with ssh-keygen (RSA 4096-bit, no passphrase) and copied the public key to the backup server user (clint) using ssh-copy-id for passwordless authentication.
- Created the source directories (/var/www/html/blog and /var/www/html/ecommerce) when they were missing, set correct ownership (tony:apache), and added test content.
- Wrote two bash scripts (blog_backup.sh and ecommerce_backup.sh) in /scripts that: checked for source directory existence, created local /backup directory, zipped the content recursively, verified exit codes, and used scp to transfer the archive to the remote backup server.
- Added defensive checks and clear error messages to make the scripts fail fast and be easier to debug.
- Tested both scripts end-to-end and verified successful transfer by checking file presence and size on the remote backup server.

## What this proves
- I can write reliable, production-like bash automation scripts with proper error handling and idempotency checks.
- I understand secure automation practices, including key-based SSH authentication for non-interactive runs.
- I can troubleshoot script failures systematically (exit codes, directory existence, permissions) without assumptions.

## How this helps a client/employer
- I can help you implement automated, secure backups for web applications, databases, or configuration files.
- I can troubleshoot failing backup or file-transfer jobs in CI/CD pipelines, cron schedules, or multi-server environments.
- I can design and maintain disaster-recovery scripts that run unattended while meeting security standards (no hardcoded passwords, least-privilege execution).
