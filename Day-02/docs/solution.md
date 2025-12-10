# Day 01 – Detailed Solution & Lessons

## The Mistake (and why it happened)
Tried to SSH directly from jump host as thor → failed because thor has no account on app servers.

## The Fix – Correct Workflow
1. From local → jump host  
   `ssh thor@jump_host.stratos.xfusioncorp.com`

2. From jump host → each app server with correct user  
   `ssh tony@stapp01.stratos.xfusioncorp.com` → password: Tony123#  
   `ssh steve@stapp02.stratos.xfusioncorp.com` → Steve123#  
   `ssh banner@stapp03.stratos.xfusioncorp.com` → Banner123#

3. The Golden Command (on each server)

sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g; s/PermitRootLogin yes/PermitRootLogin no/g; s/#PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config && sudo sshd -t && sudo systemctl reload sshd && echo "Direct root SSH login disabled successfully on $(hostname)"

**Line-by-line breakdown:**
- `sudo` → needed to edit system file and reload service
- `sed -i` → edit file in-place
- Three substitutions → covers Ubuntu default (#PermitRootLogin prohibit-password), CentOS default (PermitRootLogin yes), and commented yes
- `sshd -t` → syntax check (prevents lockout)
- `systemctl reload sshd` → apply change without killing existing sessions
- `echo` → confirmation

## Verification Command (run from jump host)

ssh -o BatchMode=yes -o ConnectTimeout=10 root@stapp03.stratos.xfusioncorp.com true && echo "BAD" || echo "GOOD – root blocked"


Expected: Permission denied → success!

