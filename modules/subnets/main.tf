resource "google_compute_subnetwork" "subs" {
  for_each      = var.subnets
  ip_cidr_range = each.value.ip
  name          = each.value.name
  region        = each.value.region
  network       = var.network.id
}