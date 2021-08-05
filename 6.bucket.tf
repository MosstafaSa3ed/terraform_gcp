resource "google_storage_bucket" "auto-expire" {
  name          = "mostafa-nti-terra-test"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
}