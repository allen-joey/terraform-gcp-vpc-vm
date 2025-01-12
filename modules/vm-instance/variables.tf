variable "instance-name" {
  description = "Name of the instance"
  default     = "ubuntu"
}

variable "image" {
  description = "Name of the image"
  default     = "ubuntu-2204-lts" # Market Place   
}

variable "instance-size" {
  description = "Instance size"
  default     = "e2-micro"
}

variable "id" {
  description = "ID of a Google Cloud Project. Can be omitted and will be generated automatically"
  default     = ""
}

variable "project_id" {
  type        = string
  description = "project id"
  default     = ""
}

variable "region" {
  type        = string
  description = "Region of policy"
  default     = "europe-west2"
}

locals {
  # Instance
  region            = "europe-west2"
  availability_zone = "europe-west2-c"
  instance_tags     = ["ubuntu", "http-server", "https-server"]
  public_ip         = "google_compute_instance.vm_instance_public.network_interface.0.access_config.0.nat_ip"

  # Firewall
  firewall_name     = "firewall"
  vpc_name          = "vpc-network"
  firewall_protocol = "tcp"
  firewall_ports    = ["22", "443", "80", "8080"]
  ingress_ranges    = ["0.0.0.0/0"]
}