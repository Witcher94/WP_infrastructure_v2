terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.44.1"
    }
    curl = {
      source = "anschoewe/curl"
      version = "1.0.2"
    }
  }
}

provider "google" {
  project = local.project
  region  = local.region
  zone    = "${local.region}-c"
}

provider "curl"{}