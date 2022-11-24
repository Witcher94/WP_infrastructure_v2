output "bucket" {
  value = google_storage_bucket.wp.name
}
output "db-ip" {
  value = google_sql_database_instance.wordpress-db.private_ip_address
}