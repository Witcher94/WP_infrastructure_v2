output "secret" {
  value = data.google_secret_manager_secret_version.wp-data.secret_data
}