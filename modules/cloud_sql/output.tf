output "prefix" {
  value = random_id.bucket_prefix.hex
}
output "db-ip" {
  value = google_sql_database_instance.wordpress-db.private_ip_address
}