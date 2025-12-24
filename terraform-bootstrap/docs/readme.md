# Day 18 - Terraform Remote Backend (S3)

**Date:** 24 December 2025

### What I Learned
- Risks of local state files in team environments (corruption, concurrency issues)
- Why remote backend is mandatory for enterprise/collaboration
- Secure S3 remote backend setup with:
  - Versioning enabled
  - Server-side encryption (AES256)
  - Public access fully blocked
  - Native S3 state locking (`use_lockfile = true`) → No DynamoDB needed (deprecated)
- Separation of concerns:
  - Bootstrap project (privileged user) → creates the bucket
  - Main project (least-privilege user) → daily Terraform operations
- IAM least-privilege policy for ongoing Terraform runs

### Key Achievements
- Successfully migrated from local to remote state
- Implemented secure, production-ready remote backend
- Resolved WSL-specific lock errors and IAM 403 issues

### Files
- `backend.tf` → Runtime S3 backend configuration (used in main project)
- `main.tf` → Minimal config + provider to test remote backend
- `iac/remote_state/backend_config.tf` → Bootstrap code to create the secure S3 bucket (run once with admin)
- `.gitignore` → Prevents committing state files and secrets

### Notes
- Bucket name: `devops-terraform-state-20251224`
- Region: `us-east-1`
- The `terraform-bootstrap/` folder (outside Day-18) contains the privileged bootstrap code if needed separately.

Remote backend fully working with locking and least-privilege access! Ready for modules and real infrastructure.
