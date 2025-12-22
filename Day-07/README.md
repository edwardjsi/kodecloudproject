# Day 7 – Linux SSH Authentication

## Goal
Set up password-less SSH access from thor on the jump host to the sudo users (tony, steve, banner) on all three app servers.

## What I did
- Confirmed I was logged in as thor on the jump host using `whoami` and `hostname`.
- Checked for existing SSH keys and found none (`ls -l ~/.ssh/id_*`).
- Generated a passphrase-less RSA key pair for thor with `ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -N ""`.
- Used `ssh-copy-id` from the jump host to copy thor's public key to tony@stapp01, steve@stapp02, and banner@stapp03 (entering each sudo user's password once).
- Verified password-less login to each app server with simple `ssh user@host` commands and confirmed direct access without password prompts.
- Avoided common mistakes like generating/copying keys from the wrong host or adding unnecessary quotes/brackets to commands.

## What this proves
- I can follow official docs and not copy-paste blindly.
- I understand why the command/feature exists, not just the syntax.
- I know the difference between private/public keys, authorized_keys, and why passphrase-less keys are needed for automation.
- I can identify and correct mistakes (e.g., running ssh-copy-id from an app server instead of the jump host).

## How this helps a client/employer
- I can help you set up secure, password-less SSH for automation scripts, Ansible playbooks, or CI/CD pipelines.
- I can troubleshoot SSH authentication issues in multi-server environments (jump hosts, bastions, app fleets).
