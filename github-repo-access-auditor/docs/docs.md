# GitHub Repo Access Auditor

A simple Bash script to audit GitHub repository collaborators using the GitHub API.

## Why This Project?
Manual checking of repo access in GitHub UI is time-consuming. This automates it for DevOps/SecOps tasks like:
- Employee offboarding.
- Permission reviews.

Inspired by: https://youtu.be/OuyNM5-r8P8

## Setup
1. Generate a GitHub PAT: Settings > Developer settings > Personal access tokens > Generate new token (classic) with `repo` scope.
2. Install `jq`: `sudo apt install jq` (Ubuntu) or `brew install jq` (Mac).
3. Clone this repo.
4. Copy `example.env` to `.env` and fill in details (or export vars).
5. Run: `./list-collaborators.sh <org> <repo>`

## Enhancements You Can Add
- Email/Slack notifications for unexpected access.
- Cron job for periodic audits.
- Integrate with Jenkins or GitHub Actions.
- Support for listing outside collaborators.

Contributions welcome!
