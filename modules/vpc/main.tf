resource "google_compute_network" "network" {
  name                            = "${var.name}-network"
  auto_create_subnetworks         = var.auto_create_subnetworks
  routing_mode                    = var.routing_mode
  description                     = var.description
  delete_default_routes_on_create = var.delete_default_internet_gateway_routes
  mtu                             = var.mtu
}
resource "google_compute_router" "router" {
  name    = "${var.name}-router"
  network = google_compute_network.network.id
}
resource "google_compute_router_nat" "nat" {
  name                               = "${var.name}-nat"
  nat_ip_allocate_option             = var.allocate_option
  router                             = google_compute_router.router.name
  source_subnetwork_ip_ranges_to_nat = var.ip_ranges_to_nat
}
