resource "google_compute_subnetwork" "subs" {
  for_each = var.subnets
  ip_cidr_range = each.value
  name          = each.value
  network       = var.network.id
}