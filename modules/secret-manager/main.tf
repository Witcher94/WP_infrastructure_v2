resource "random_password" "password" {
  length           = var.length
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  min_upper        = 0 ? var.min_upper : 2
  min_lower        = 0 ? var.min_lower : 2
  min_numeric      = 0 ? var.min_numeric : 2
  min_special      = 0 ? var.min_special : 2
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