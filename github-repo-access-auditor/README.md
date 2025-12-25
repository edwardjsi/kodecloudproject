# Shell Scripting Project: GitHub Repository Access Auditor

## Goal
Build a practical shell script to audit GitHub repository collaborators using the GitHub REST API.

## What I did
- Watched the tutorial video (Day-8 of DevOps Zero to Hero series) demonstrating a shell script to list users with pull access on a GitHub repo.
- Created a complete project structure with a Bash script, README, and .gitignore.
- Enhanced the original script with features like URL parsing (no need for separate org/repo args), pagination support, better error handling, and detailed permission output.
- Fixed issues encountered during testing, such as jq errors from API failures, authentication requirements, and repository not found problems.
- Updated the script to require a GitHub Personal Access Token (PAT) for reliable access and added clear error messages for common problems like insufficient permissions.
- Tested the script on personal repositories to verify it lists collaborators correctly when the user has push access.

## What this proves
- I can understand and extend real-world shell scripting examples beyond copy-paste.
- I know how to interact with REST APIs using curl and jq in Bash, including handling authentication, pagination, and JSON parsing.
- I can debug API-related errors (e.g., 401/403/404 responses) and implement robust error checking.
- I understand GitHub API limitations, such as requiring push access to view collaborators.

## How this helps a client/employer
- I can automate GitHub repository audits for security reviews, offboarding processes, or compliance checks.
- I can help troubleshoot and secure repository permissions in team or organization settings.
- I can build custom automation tools integrating GitHub API for DevOps workflows, saving manual effort.
