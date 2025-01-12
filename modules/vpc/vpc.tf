resource "google_compute_network" "vpc-network" {
  project                 = var.project_id
  name                    = var.vpc_network
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "vpc-subnet" {
  project       = var.project_id
  name          = var.name
  ip_cidr_range = var.cidr_range
  network       = google_compute_network.vpc-network.self_link
  region        = var.region
}