# Day 05 – SELinux Installation and Permanent Disable on Linux Server

## Goal
Install SELinux packages and permanently disable it on a RedHat-based production application server without causing downtime.

## Actual Problem I Solved

SElinux Installation and Configuration

=-==-=-=-=-=-=-=-=-=

Following a security audit, the xFusionCorp Industries security team has opted to enhance application and server security with SELinux. To initiate testing, the following requirements have been established for App server 2 in the Stratos Datacenter:

1.Install the required SELinux packages.
2.Permanently disable SELinux for the time being; it will be re-enabled after necessary configuration changes.
3.No need to reboot the server, as a scheduled maintenance reboot is already planned for tonight.
4.Disregard the current status of SELinux via the command line; the final status after the reboot should be disabled.

=-=-=-=--=-=-=---=-=-=


## What I did
- Connected to the target application server (stapp02) via SSH as the designated user: ssh steve@stapp02.stratos.xfusioncorp.com
- Installed the required SELinux packages using yum to ensure all policy tools and utilities are present: sudo yum install policycoreutils policycoreutils-python-utils selinux-policy selinux-policy-targeted libselinux-utils -y
- Permanently disabled SELinux by editing the configuration file in an automated, idempotent way using sed: sudo sed -i 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config (or the more forceful variant sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config if needed)
- Verified the change immediately with grep '^SELINUX' /etc/selinux/config to confirm the setting was correctly applied

## What this proves
- I understand the difference between temporary (setenforce) and permanent SELinux configuration changes.
- I can make safe, repeatable configuration changes using both editors and command-line tools like sed for automation.
- I know why organizations install SELinux but often start in disabled/permissive mode during rollout.
- I prioritize verification after every change.

## How this helps a client/employer
- I can help you implement security hardening (e.g., CIS benchmarks, compliance requirements) safely across server fleets.
- I can troubleshoot mysterious “permission denied” issues that turn out to be SELinux denials in audit logs.
- I can automate configuration management at scale using tools like Ansible that rely on idempotent sed/augeas operations.
- I can support container platforms (OpenShift, RHEL-based Kubernetes) where SELinux is critical for pod isolation.
