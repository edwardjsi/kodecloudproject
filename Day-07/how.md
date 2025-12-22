```markdown
# Day 7: Linux SSH Authentication – Password-less SSH Setup

## Task Overview
Set up password-less SSH authentication from user **thor** on the **jump host** to all app servers in Stratos Datacenter using their respective sudo users:
- App Server 1 → user **tony** on **stapp01.stratos.xfusioncorp.com**
- App Server 2 → user **steve** on **stapp02.stratos.xfusioncorp.com**
- App Server 3 → user **banner** on **stapp03.stratos.xfusioncorp.com**

The goal is to allow thor to SSH into each sudo user without being prompted for a password (required for automated scripts).

## Solution Steps

### Step 1: Confirm current user and host
**Command:**
```bash
whoami && hostname
```
**Output/Result:**
- `thor`
- `jumphost.stratos.xfusioncorp.com`

**Explanation:**  
Ensures you are logged in as the correct user (thor) on the correct machine (jump host).

### Step 2: Check existing SSH configuration
**Command:**
```bash
ls -l ~/.ssh
```
**Result:**  
Shows an `authorized_keys` file exists, but no key pair.

**Explanation:**  
The presence of `authorized_keys` is for inbound logins to thor. We need outbound keys from thor.

### Step 3: Check for existing SSH key pair
**Command:**
```bash
ls -l ~/.ssh/id_*
```
**Result:**  
No such file or directory → thor has no SSH key pair yet.

### Step 4: Generate SSH key pair for thor (without passphrase)
**Command:**
```bash
ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -N ""
```
**Explanation:**
- `-t rsa`: Use RSA algorithm (widely compatible).
- `-b 2048`: 2048-bit key length (sufficient security).
- `-f ~/.ssh/id_rsa`: Store private key as `id_rsa` and public as `id_rsa.pub`.
- `-N ""`: Empty passphrase → enables non-interactive (password-less) use by scripts.

This creates:
- Private key: `~/.ssh/id_rsa`
- Public key:  `~/.ssh/id_rsa.pub`

### Step 5: Copy public key to stapp01 (user tony)
**Command:**
```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub tony@stapp01.stratos.xfusioncorp.com
```
**Process:**
- Accept host key fingerprint (`yes`).
- Enter tony’s password **once**.
- Output: “Number of key(s) added: 1”.

**Explanation:**  
`ssh-copy-id` appends thor’s public key to `~tony/.ssh/authorized_keys` on stapp01.

### Step 6: Test password-less login to tony
**Command:**
```bash
ssh tony@stapp01.stratos.xfusioncorp.com
```
**Result:**  
Directly logs in → prompt changes to `[tony@stapp01 ~]$`. No password asked.

**Exit:**
```bash
exit
```

### Step 7: Copy public key to stapp02 (user steve)
**Command:**
```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub steve@stapp02.stratos.xfusioncorp.com
```
**Process:** Same as Step 5 (accept host key, enter steve’s password once).

### Step 8: Test password-less login to steve
**Command:**
```bash
ssh steve@stapp02.stratos.xfusioncorp.com
```
**Result:** Direct login → `[steve@stapp02 ~]$`.

**Exit:**
```bash
exit
```

### Step 9: Copy public key to stapp03 (user banner)
**Command:**
```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub banner@stapp03.stratos.xfusioncorp.com
```
**Process:** Same as previous copies.

### Step 10: Test password-less login to banner
**Command:**
```bash
ssh banner@stapp03.stratos.xfusioncorp.com
```
**Result:** Direct login → `[banner@stapp03 ~]$`.

**Exit:**
```bash
exit
```

## Key Lessons & Common Pitfalls Avoided
- Always generate and copy keys **from the jump host as thor**, never from an app server.
- Do not add unnecessary quotes/brackets around the SSH command.
- Using an empty passphrase (`-N ""`) is essential for script automation.
- One key pair on the jump host is sufficient for all three app servers (the same public key is added to each sudo user’s `authorized_keys`).

Password-less SSH from thor@jump host to tony@stapp01, steve@stapp02, and banner@stapp03 is now fully configured.
```
