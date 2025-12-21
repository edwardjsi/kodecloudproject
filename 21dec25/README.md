# Day 21 Dec 25 – Layered Terraform Architecture (Foundation + App Stack)

## Goal

Design a **production-grade AWS infrastructure** using Terraform with **clear separation of concerns**, **remote state**, and **modular networking**.

---

## What I did

* Started with a simple requirement: multiple EC2 instances behind a Load Balancer.
* Refined the architecture step-by-step from **single AZ** to **production-grade design thinking**.
* Created a **foundation Terraform project** to provision VPC, public subnets, private subnets, IGW, and NAT Gateway.
* Configured **remote state** using S3 with DynamoDB locking to enable safe, team-ready Terraform usage.
* Refactored networking into a **reusable VPC module**.
* Built a separate **application stack** that consumes networking outputs using `terraform_remote_state`.
* Deployed EC2 instances and an ALB without hardcoding any network values.

---

## What this proves

* I understand that **Terraform does not create resources implicitly** and that infrastructure must be explicitly designed.
* I can apply **separation of concerns** between foundational networking and application workloads.
* I know how to use **remote state and state locking** to prevent corruption and enable collaboration.
* I can design Terraform projects that mirror **real-world platform and DevOps team structures**.
* I understand Terraform’s execution model beyond file names like `main.tf`.

---

## How this helps a client/employer

* Enables a **stable, reusable network foundation** that multiple applications can safely share.
* Reduces risk by **isolating network changes** from frequently changing application stacks.
* Improves maintainability, auditability, and scalability of infrastructure code.
* Prevents outages and conflicts caused by poor state management or tightly coupled Terraform designs.
* Allows faster application delivery without compromising infrastructure safety.


