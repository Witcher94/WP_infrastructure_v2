resource "google_storage_bucket" "wp" {
  name                        = "${var.bucket-name}-bucket-${var.prefix}"
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true
}


resource "google_storage_bucket_iam_member" "bucket-server-link" {
  bucket = google_storage_bucket.wp.id
  role   = "roles/storage.admin"
  member = "serviceAccount:${var.service-account}"
}