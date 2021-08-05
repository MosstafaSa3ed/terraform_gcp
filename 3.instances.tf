resource "google_compute_address" "static" {
  name = "ipv4-address"
  region = "europe-west1"
}

### public instance in eu-west-1 ### 
resource "google_compute_instance" "public_instance" {
  name         = "vm-instance"
  machine_type = "e2-micro"
  zone         = "europe-west1-c"


    
   boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "nti-test-vpc"
    subnetwork = "nti-test-eu-subnet-1"
    
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }
}

### private instance in us-central1 ### 
resource "google_compute_instance" "private_instance" {
  name         = "vm-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"


    
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "nti-test-vpc"
    subnetwork = "nti-test-us-subnet-1"
  }
}