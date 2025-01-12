# GCP VM - Ubuntu 22.04

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
}

resource "google_compute_instance" "vm_instance_public" {
  project = var.project_id

  name         = var.instance-name
  machine_type = var.instance-size
  zone         = "${local.region}-c"

  tags = local.instance_tags

  boot_disk {
    auto_delete = true

    initialize_params {
      image = var.image

      labels = {
        managed_by = "terraform"
      }
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }


  metadata = {
    sshKeys = "ubuntu:${tls_private_key.ssh.public_key_openssh}"
  }

  # We can install any tools we need for the europa VM in the startup script
  metadata_startup_script = <<EOT
  set -xe \
    && sudo apt update -y \
    && sudo apt install htop -y \
    && sudo apt-get install nmap -y
EOT

}

resource "local_file" "local_ssh_key_pem" {
  content         = tls_private_key.ssh.private_key_pem
  filename        = ".ssh/ssh_key"
  file_permission = "0600"
}

resource "local_file" "local_ssh_key_pub" {
  content         = tls_private_key.ssh.public_key_openssh
  filename        = ".ssh/ssh_key.pub"
  file_permission = "0600"
}

# Output variable: Public IP address
output "instance_ip_addr" {
  value = local.public_ip
}