terraform {
  required_providers {
    curl = {
      source = "anschoewe/curl"
      version = "1.0.2"
    }
  }
}
provider "curl"{}