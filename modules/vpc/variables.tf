variable "project_id" {
  type        = string
  description = "project id"
  default     = ""
}

variable "vpc_network" {
  type        = string
  description = "VPC Name"
  default     = "vpc-network"
}

variable "name" {
  type        = string
  description = "Subnets"
  default     = "vpc-subnet"
}

variable "cidr_range" {
  type        = string
  description = "CIDR Range"
  default     = "10.0.1.0/24"
}

variable "region" {
  type        = string
  description = "Region of policy"
  default     = "europe-west2"
}
