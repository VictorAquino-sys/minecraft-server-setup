# Minecraft Server Setup on AWS

This repository contains the code and configuration required to deploy a Minecraft server on AWS using Terraform, Ansible, and Docker. The infrastructure setup is fully automated to enhance consistency and reproducibility across deployments.

## Project Structure

- `terraform/` - Contains Terraform configurations to provision AWS resources like EC2 instances and security groups.
- `ansible/` - Contains Ansible playbooks and roles for configuring the Minecraft server on the provisioned EC2 instance.
- `docker/` - Includes Dockerfiles and related scripts for containerizing the Minecraft server.

## Prerequisites

Before you begin, ensure you have the following installed on your system:
- [Terraform](https://www.terraform.io/downloads.html) (>= 0.12)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Docker](https://docs.docker.com/get-docker/)
- [AWS CLI](https://aws.amazon.com/cli/) configured with at least one profile

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/minecraft-server-setup.git
cd minecraft-server-setup

2. Terraform Initialization and Application
Navigate to the terraform/ directory:
cd terraform
terraform init
terraform apply

docker restart minecraft_server
