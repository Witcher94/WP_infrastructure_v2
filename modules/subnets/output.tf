output "subnets" {
  value       = google_compute_subnetwork.subs
  description = "Subnets output for usage in other modules."
}