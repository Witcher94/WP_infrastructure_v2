output "secret" {
  value = google_secret_manager_secret_version.wp-db-secret
}