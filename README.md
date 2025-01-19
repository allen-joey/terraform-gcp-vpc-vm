# GCP Project, VPC, Firewall, Ubuntu VM SetUp

## Create a Ubuntu VM with SSH enabled on GCP
Terraform project to SSH into a VM instance on GCP

# Naming conventions used, can be changed
- vpc (vpc-network)
- firewall (firewall)
- vm-instance (ubuntu)
- regions (europe-west2)

# Prerquisite
- Terraform installed
- GCP cloud account
- Use an existing GCP project or create a new project
- Create Service Account i.e tfm-admin. That will connect your local enviroment to GCP

## Overview
Terraform module GCP_VM

Modules: vpc and vm-instance

```
module "vpc" {
  source = "./modules/vpc"
}

module "vm-instance" {
  source     = "./modules/vm-instance"
  depends_on = [module.vpc.vpc_applied]
}
```
# Scripts for deploying and destroying the GCP project
- tfm-plan-apply.sh
- tfm-auto-destroy.sh

## Connect to the VM using SSH
SSH Keys will be in the local directory .ssh - ssh -i .ssh/ssh_key ubuntu@static-ip

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)

## Author Information

[Author: K3S3](https://github.com/k3s3)
