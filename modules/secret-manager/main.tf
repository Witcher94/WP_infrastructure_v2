resource "random_password" "password" {
  length           = var.length
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  min_upper        = false ? var.min_upper : 2
  min_lower        = false ? var.min_lower : 2
  min_numeric      = false ? var.min_numeric : 2
  min_special      = false ? var.min_special : 2
}
resource "google_secret_manager_secret" "secret-basic" {
  secret_id = var.secret_id

  labels = {
    label = var.labels
  }

  replication {
    automatic = true
  }
}
resource "google_secret_manager_secret_version" "secret-version-basic" {
  secret      = google_secret_manager_secret.secret-basic.id
  secret_data = random_password.password.result
}