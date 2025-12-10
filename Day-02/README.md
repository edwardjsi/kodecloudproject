# Day 01 – Disable Direct Root SSH Login on Nautilus App Servers

## Goal
Harden all three application servers (stapp01, stapp02, stapp03) in Stratos Datacenter by disabling direct root SSH login as per xFusionCorp security audit.

## What I did
- Connected via jump host (bastion) using thor
- Accessed each app server using correct non-root users (tony, steve, banner)
- Modified `/etc/ssh/sshd_config` to force `PermitRootLogin no` using a robust sed one-liner
- Validated config syntax with `sshd -t`
- Gracefully reloaded SSH without dropping sessions
- Verified root is blocked and normal users still work

## What this proves
- I never assume passwordless SSH exists between hosts
- I write safe, idempotent config changes that work across Ubuntu/CentOS defaults
- I always validate before applying and verify after
- I understand bastion host workflows in real enterprise environments

## How this helps a client/employer
- I can enforce CIS benchmarks and pass SOC2/ISO27001 audits
- I can harden production fleets with zero downtime
- I can troubleshoot locked-out scenarios and recover safely
