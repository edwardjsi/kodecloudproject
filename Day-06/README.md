# Day 6 – Create a Cron Job

## Goal
Set up and validate a scheduled cron job on multiple Linux app servers to ensure reliable automation.

## What I did
- Installed the cronie package on all app servers using sudo yum install -y cronie.
- Started the cron daemon immediately with sudo systemctl start crond.
- Enabled the service to start on boot with sudo systemctl enable crond.
- Verified the service status with sudo systemctl status crond to confirm it was active and running.
- Edited the root user's crontab using sudo crontab -e and added the test job */5 * * * * echo hello > /tmp/cron_text to run every 5 minutes.
- Initially encountered an issue where the output file /tmp/cron_text was not created right away.
- Troubleshot by manually running the command sudo sh -c "echo hello > /tmp/cron_text" to isolate and rule out syntax or permission problems.
- Identified the root cause as timing—cron jobs only execute at their scheduled interval, not immediately after adding them.
- Waited 5-10 minutes and confirmed the file was created and updated regularly.
- Improved the job for better observability by updating it to */5 * * * * echo "$(date) hello" >> /tmp/cron_text, adding timestamps and appending output instead of overwriting.

## What this proves
- I can follow official docs and not copy-paste blindly.
- I understand why the command/feature exists, not just the syntax.
- I can systematically troubleshoot scheduling issues (service status, logs, manual testing, environment differences).
- I know crontab syntax thoroughly, including special characters like */5, command substitution $(date), and redirection operators (> vs >>).

## How this helps a client/employer
- I can help you set up reliable scheduled automation (backups, log rotation, monitoring checks, certificate renewals) on Linux servers.
- I can troubleshoot cron-related incidents quickly, minimizing downtime and false alarms in production environments.
- I can implement best practices like absolute paths, proper logging, and observability from day one, reducing future technical debt.
