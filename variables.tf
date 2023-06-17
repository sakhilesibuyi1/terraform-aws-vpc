variable "cidr" {
  description = "CIDR [ A.B.C.D/Z ]"
}

variable "secondary_cidrs" {
  description = "List of secondary CIDRs [ A.B.C.D/Z ]"
  type        = list(any)
  default     = []
}

# DNS
variable "enable_dns_hostnames" {
  description = "Enable DNS Hostnames [ true | false ]"
}

variable "enable_dns_support" {
  description = "Enable DNS Support [ true | false ]"
}

# DHCP
variable "domain_name" {
  description = "dhcp domain name"
}

# General
variable "name" {
  description = "Name [ STR ]"
}