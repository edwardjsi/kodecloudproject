# Day 18 erraform Remote Backend with S3

## Goal
Configure a secure, enterprise-ready Terraform remote state backend using S3 with native locking.

## What I did
- Created a dedicated S3 bucket with versioning enabled, server-side encryption (AES256), and full public access blocked.
- Implemented native S3 state locking using `use_lockfile = true` (no DynamoDB required, as it is deprecated).
- Separated concerns: wrote bootstrap code (run once with privileged user) to create the bucket, and runtime backend config for daily use.
- Set up least-privilege IAM policy allowing only `s3:ListBucket` and object-level actions (`Get/Put/DeleteObject`) on the state bucket.
- Successfully migrated from local state to remote state using `terraform init -migrate-state`.
- Tested the setup with `terraform plan` under least-privilege credentials and confirmed locking works.
- Organized code into `Day-18/` (main project) and `terraform-bootstrap/` (bucket creation), added proper `.gitignore` and documentation.

## What this proves
- I understand the real risks of local state files in team environments (concurrency, corruption, lack of versioning).
- I can implement modern Terraform best practices (2025 standards) without relying on outdated DynamoDB locking.
- I can design and enforce least-privilege IAM access for infrastructure-as-code tools.
- I can bootstrap infrastructure-for-infrastructure securely and separate privileged/one-time operations from daily workflows.

## How this helps a client/employer
- I can help you set up secure, collaborative Terraform environments for teams of any size.
- I can troubleshoot state locking, migration, and permission issues quickly and confidently.
- I can ensure your infrastructure state is versioned, encrypted, and protected against accidental exposure or loss.
