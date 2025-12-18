# Day 03 – Secure Root SSH Access on Nautilus App Servers

## Goal
Disable direct root SSH login on all three application servers in the Stratos Datacenter to enforce xFusionCorp Industries' security audit requirements and eliminate a critical vulnerability.

## What I did
- Logged into the jump host as thor using ssh thor@jump_host.stratos.xfusioncorp.com (password: mjolnir123)
- From the jump host, connected to each app server using the correct designated admin account:
  - stapp01 → ssh tony@stapp01.stratos.xfusioncorp.com (password: Tony123#)
  - stapp02 → ssh steve@stapp02.stratos.xfusioncorp.com (password: Steve123#)
  - stapp03 → ssh banner@stapp03.stratos.xfusioncorp.com (password: Banner123#)
- On each server, elevated privileges with sudo su - (passwordless sudo enabled)
- Modified /etc/ssh/sshd_config using a robust, idempotent sed command to force PermitRootLogin no regardless of previous state:
  sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g; s/PermitRootLogin yes/PermitRootLogin no/g; s/#PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
- Validated SSH configuration syntax with sudo sshd -t (no output means success)
- Applied changes gracefully without dropping sessions using sudo systemctl reload sshd
- Verified the hardening on each server by:
  - Checking the config line: grep PermitRootLogin /etc/ssh/sshd_config (confirmed "PermitRootLogin no")
  - Testing direct root login attempt from jump host (ssh -o BatchMode=yes root@stapp0X → immediate Permission denied)
  - Confirming normal admin user access remained fully functional
- Avoided an initial mistake of attempting automation from the jump host (thor has no direct access) and correctly used per-server admin accounts instead

## What this proves
- I fully understand SSH security hardening and the implications of different PermitRootLogin settings.
- I navigate bastion/jump host environments correctly without making unsafe access assumptions.
- I create safe, idempotent, and distro-agnostic configuration changes that work reliably across varied systems.
- I always validate syntax and use reload over restart to prevent downtime or lockouts.
- I perform thorough positive and negative verification before considering a security change complete.

## How this helps a client/employer
- I can rapidly enforce critical security controls (CIS benchmarks, SOC2, PCI-DSS, NIST) across production infrastructure with zero downtime.
- I reduce attack surface and prevent credential-compromise escalations in real-world environments.
- I deliver verifiable, audit-compliant hardening that stands up to penetration tests and compliance reviews while maintaining operational continuity.
