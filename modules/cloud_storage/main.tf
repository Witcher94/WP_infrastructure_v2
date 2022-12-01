resource "google_storage_bucket" "wp" {
  name                        = "${var.bucket-name}-bucket-${var.prefix}"
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true
}
