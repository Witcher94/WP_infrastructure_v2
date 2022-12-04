resource "random_password" "password" {
  length           = var.length
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  min_upper        = var.min_upper <= 0 ? 0 : var.min_upper
  min_lower        = var.min_lower <= 0 ? 0 : var.min_lower
  min_numeric      = var.min_numeric <= 0 ? 0 : var.min_numeric
  min_special      = var.min_special <= 0 ? 0 : var.min_special
}
resource "google_secret_manager_secret" "wp-db-secret" {
  secret_id = var.secret_id

  labels = {
    label = var.labels
  }

  replication {
    automatic = true
  }
}
resource "google_secret_manager_secret_version" "wp-db-secret" {
  secret      = google_secret_manager_secret.wp-db-secret.id
  secret_data = random_password.password.result
}
data "google_secret_manager_secret_version" "wp-data" {
  secret = google_secret_manager_secret_version.wp-db-secret.secret
}