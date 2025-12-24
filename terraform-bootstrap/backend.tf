terraform {
  backend "s3" {
    bucket         = "devops-terraform-state-20251224"  # ← EXACT bucket name you just created
    key            = "global/terraform.tfstate"                    # ← change this path as you like
    region         = "us-east-1"                                  # ← your bucket region
    encrypt        = true
    use_lockfile   = true                                         # native S3 locking
  }
}
