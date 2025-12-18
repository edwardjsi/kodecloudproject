# Day 01 – Creating a Non-Interactive Service Account on Linux

## Goal
Create a dedicated user with a non-interactive shell to meet backup agent security requirements.

## What I did
- SSH’d into App Server 3 (stapp03) using the designated admin account: ssh tony@stapp03
- Elevated privileges to root using sudo su -
- Initially attempted to create the user but made a typo in the shell path: useradd jim -s /sbin/nologing (failed with "invalid shell" error)
- Corrected the typo and successfully created the user with a non-interactive shell: useradd jim -s /sbin/nologin
- Verified the user creation with id jim to confirm UID/GID assignment
- Checked the user entry in the password file: grep jim /etc/passwd and confirmed the shell was correctly set to /sbin/nologin
- Confirmed available valid shells on the system with cat /etc/shells to ensure I used the right path
- Logged out cleanly after validation

## What this proves
- I understand the importance of non-interactive shells for service accounts and can implement them correctly.
- I pay attention to detail (caught and fixed a simple but critical typo immediately).
- I always verify changes rather than assuming success.
- I know how to inspect and interpret key system files like /etc/passwd and /etc/shells.

## How this helps a client/employer
- I can help you create secure service accounts for applications, backup tools, monitoring agents, or CI/CD runners.
- I can harden systems by enforcing least-privilege principles and preventing unauthorized interactive logins.
- I can troubleshoot user-related issues quickly and ensure compliance with security policies or vendor requirements.
