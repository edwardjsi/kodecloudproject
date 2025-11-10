
# kodecloudproject
this is to track my kodeclud project


I am starting this on 10th Nov 2025 and from day 8.


# Day 08 — Install Ansible (Jump Host / Ansible Controller)

**Objective:** Install Ansible `4.10.0` via `pip3` on the Jump Host and ensure the `ansible` binary is available globally (all users).

---

## Commands run
```bash
# verify pip3
python3 --version
pip3 --version

# install ansible system-wide
sudo pip3 install ansible==4.10.0

# verify location and version (as sudo user)
which ansible
ansible --version
pip3 show ansible

# create a test user (if needed)
# i used adduser but foundout that the stripped version of centos doesn't have that. So, I used the binary version useradd
sudo useradd -m -s /bin/bash tmpuser

# if tmpuser can't find ansible, check PATH
sudo -u tmpuser -i -- sh -lc 'echo $PATH'

# safe symlink into /usr/bin to ensure binary in all users' PATH
sudo test -e /usr/bin/ansible || sudo ln -s /usr/local/bin/ansible /usr/bin/ansible
sudo test -e /usr/bin/ansible-playbook || sudo ln -s /usr/local/bin/ansible-playbook /usr/bin/ansible-playbook

# verify as tmpuser
sudo -u tmpuser -i -- ansible --version
sudo -u tmpuser -i -- ansible -c local -m ping localhost

