resource "google_storage_bucket" "wp" {
  name                        = "${var.bucket-name}-bucket-${var.prefix}"
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true
  storage_class               = var.storage_class
}

resource "google_storage_bucket_acl" "image-store-acl" {
  bucket      = google_storage_bucket.wp.name
  role_entity = var.role_entity
}