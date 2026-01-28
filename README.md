# azure-terraform-app-infra
# Azure Terraform App Infrastructure

This repository contains **Terraform infrastructure-as-code** for provisioning Azure resources using a **modular, multi-environment** approach.

It is designed to support multiple environments (Dev, UAT, etc.) while keeping infrastructure reusable, consistent, and easy to manage.

---

## 📁 Repository Structure

```text
azure-terraform-app-infra/
├── environments/
│   ├── dev/
│   │   ├── .terraform/
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   ├── starbucks.sh
│   │   ├── stremflix.sh
│   │   └── .terraform.lock.hcl
│   └── uat/
│       └── (same structure as dev)
│
├── modules/
│   ├── azurerm_rg/
│   ├── azurerm_network/
│   ├── azurerm_nsg/
│   ├── azurerm_pip/
│   ├── azurerm_lb/
│   ├── azurerm_lb_nic_association/
│   ├── azurerm_computes/
│   ├── azurerm_bastion/
│   └── azurerm_sql_database/
│
├── .gitignore
└── README.md
🧱 Architecture Overview

This project provisions Azure infrastructure including:

Resource Groups

Virtual Networks & Subnets

Network Security Groups

Public IPs

Load Balancers

Virtual Machines

Bastion Host

Azure SQL Database

All resources are defined as Terraform modules to encourage reuse and consistency across environments.
🌍 Environments

Each environment has its own directory under environments/:

dev – Development environment

uat – User Acceptance Testing environment

Environment-specific values (such as naming, sizing, and credentials) are managed using terraform.tfvars.
🚀 Getting Started
1️⃣ Prerequisites

Ensure you have the following installed:

Terraform
 (v1.x recommended)

Azure CLI

An Azure subscription

Git

Authenticate to Azure:
az login
2️⃣ Initialize Terraform
cd environments/dev
terraform init
3️⃣ Review the Plan
terraform plan

4️⃣ Apply the Infrastructure
terraform apply


Type yes when prompted.
🔐 State & Lock Files

Terraform state files (*.tfstate) are excluded via .gitignore

.terraform.lock.hcl is also excluded to avoid provider lock conflicts across environments

⚠️ For production usage, remote state (Azure Storage Account + Blob) is strongly recommended.
🔄 Scripts

starbucks.sh

stremflix.sh

These scripts can be used for:

VM bootstrap

App installation

Environment configuration

(Adjust or remove as needed per environment.)

🧩 Module Usage

Each module is self-contained and typically includes:

main.tf

variables.tf

outputs.tf

Modules are consumed from environment main.tf files.

🛡 Best Practices Followed

Modular Terraform design

Environment isolation

Sensitive files excluded from Git

Consistent naming conventions

Azure provider best practices

📌 Future Improvements

Remote backend configuration

CI/CD integration (Azure DevOps Pipelines)

Terraform workspaces

Automated linting and security scanning

👤 Author

Maintained by the Infrastructure / DevOps team.

📄 License

This project is licensed for internal use. Add an open-source license if required.
