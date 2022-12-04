output "health-check" {
  value = google_compute_health_check.wp-healthcheck.id
}
output "instance-group" {
  value = google_compute_region_instance_group_manager.wordpress-ig.instance_group
}
