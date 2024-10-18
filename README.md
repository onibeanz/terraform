
# Terraform Infrastructure Project

## Project Overview

This project is designed to manage a web application, a database for product information and user data, and a storage solution for product images. 
It follows a modular structure with separate workspaces/environments for development, staging, and production. 
The infrastructure is divided into reusable modules that can be easily shared across different environments.

## Folder Structure

.\
├── Deployments/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Environment-specific Terraform configurations\
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── dev.auto.tfvars    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Variables specific to the development environment\
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── prod.tfvars        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Variables specific to the production environment\
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── stage.tfvars       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Variables specific to the staging environment\
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── main.tf            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Main entry point for Terraform execution\
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── providers.tf       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Cloud provider configurations\
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── variables.tf       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Shared variable definitions\
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── .terraform/        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Terraform state and provider cache directory\
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└── .terraform.lock.hcl&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Dependency lock file to ensure consistent versions\
│\
├── Modules/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Reusable Terraform modules\
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── Backend/           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Backend-related infrastructure (e.g., storage, databases)\
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── Database/          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Database configurations and resources\
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── Network/           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Networking resources (e.g., VPCs, subnets, security groups)\
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└── Web/               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Web server configurations and related resources\
│\
└── .gitignore&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Files and directories to ignore in version control\


## How to Use

Initialize:

terraform init

terraform apply -var-file=prod.tfvars

terraform apply
