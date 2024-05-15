terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.29.1"
    }
  }
}

provider "google" {
  credentials = file("/workspaces/zoomcamp_codespace/data-engineering-zoomcamp/terraform/keys/smiling-theory-375722-77c2308355d3.json")
  project = "smiling-theory-375722"
  region  = "us-central1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "smiling-theory-375722"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}