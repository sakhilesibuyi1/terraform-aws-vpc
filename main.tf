provider "aws" {
  region = "us-east-1"
}

# VPC
resource "aws_vpc" "main" {
  cidr_block = var.cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support
  tags = tomap({Name = "${var.name}-vpc"})
}

# Secondary CIDR

resource "aws_vpc_ipv4_cidr_block_association" "secondary_block" {
  for_each = toset(var.secondary_cidrs)
  vpc_id = aws_vpc.main.id
  cidr_block = each.key
}

# IGW

resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id
    tags=tomap({Name = "${var.name}-igw"})
  
}

# Route table
resource "aws_route_table" "main"{
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id
    }
    tags = tomap({Name="${var.name}-rtb"})
}

# Route table association
resource "aws_main_route_table_association" "main" {
  vpc_id = aws_vpc.main.id
  route_table_id = aws_route_table.main.id
}

# DHCP
resource "aws_vpc_dhcp_options" "main" {
  domain_name = var.domain_name
  domain_name_servers = ["AmazonProvidedDNS"]
  tags = tomap({Name="${var.name}-dhcp"})
}

resource "aws_vpc_dhcp_options_association" "main"{
    vpc_id = aws_vpc.main.id
    dhcp_options_id = aws_vpc_dhcp_options.main.id
}