# 12 Dec 25 – AWS CLI Authentication and S3 Upload

## Goal
Practice AWS CLI authentication, assume an AdminRole, and upload a file into S3.

## What I did
- Verified my identity with `aws sts get-caller-identity` to confirm I was logged in as IAM user `edward`.
- Created an IAM role (`AdminRole`) with AdministratorAccess and updated its trust policy to allow `edward` to assume it.
- Successfully assumed the `AdminRole` via `aws sts assume-role` and exported temporary credentials.
- Created a test file (`hello.txt`) locally and uploaded it into my bucket `immanuel-demo-bucket-20251210121947` using `aws s3 cp`.
- Verified the file upload with `aws s3 ls` and confirmed cleanup commands work.

## What this proves
- I can follow official AWS documentation and configure IAM roles correctly instead of copy‑pasting blindly.
- I understand why temporary credentials and trust policies exist, not just the syntax.
- I can validate permissions by testing with S3 operations and clean up resources responsibly.

## How this helps a client/employer
- I can help you set up secure IAM roles with least privilege and reproducible trust policies.
- I can troubleshoot AccessDenied errors in AWS CLI by aligning user policies, role permissions, and trust relationships.
- I can demonstrate end‑to‑end AWS CLI workflows (identity verification, role assumption, S3 operations) in a clean, interview‑ready format.
