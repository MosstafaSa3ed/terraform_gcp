resource "google_compute_subnetwork" "us_subnet_1" {
  name          = "nti-test-us-subnet-1"
  ip_cidr_range = "10.1.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.custom_vpc.id
}

resource "google_compute_subnetwork" "eu_subnet_1" {
  name          = "nti-test-eu-subnet-1"
  ip_cidr_range = "10.2.0.0/16"
  region        = "europe-west1"
  network       = google_compute_network.custom_vpc.id
}