terraform {
  backend "gcs" {
    bucket = "tf-state-wordpress-edu"
  }
}
