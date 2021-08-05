resource "google_compute_network" "custom_vpc" {
  name                    = "nti-test-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_firewall" "custom" {
  name    = "nti-test-firewall"
  network = google_compute_network.custom_vpc.name
  priority = 500
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080","22"]
  }

  source_ranges = ["0.0.0.0/0"]
}