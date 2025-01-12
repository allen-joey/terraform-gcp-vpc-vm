# Create a Google Compute Firewall

resource "google_compute_firewall" "firewall" {

  name        = local.firewall_name
  description = "allow-ssh-http-https"
  network     = local.vpc_name

  allow {
    protocol = local.firewall_protocol
    ports    = local.firewall_ports
  }

  source_ranges = local.ingress_ranges
  direction     = "INGRESS"
  target_tags   = google_compute_instance.vm_instance_public.tags
}