resource "google_project_service" "project" {
  project = "learninggcp97"
  service = "compute.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }
     disable_dependent_services = true
  }