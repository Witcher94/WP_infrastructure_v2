locals {
  region = "europe-west3"
}
provider "google" {
  project = "pfaka-education-25433"
  region  = local.region
  zone    = "${local.region}-c"
}