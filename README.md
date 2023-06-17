# terraform-aws-vpc
Terraform AWS VPC Module


AWS VPC MODULE
==================

This module creates:

* VPC
* DCHP Options
* Internet Gateway
* Default Route Table

## Usage

```
module "vpc"{
	source = "app.terraform.io/sakhile-training/vpc/aws"
	tags = [""]
	name = ""
	cdir = ""
	secondary_cdirs = [""]
	enable_dns_hostnames = true
	enable_dns_support = true
	domain_name = ""
}
```