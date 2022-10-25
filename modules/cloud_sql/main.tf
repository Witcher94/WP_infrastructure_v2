resource "random_id" "bucket_prefix" {
  byte_length = 8
}
resource "google_compute_global_address" "private-ip-address" {
  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 24
  network       = var.vpc-network.id
}
resource "google_service_networking_connection" "master-private-vpc-db-connection" {
  network                 = var.vpc-network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private-ip-address.name]
}
resource "google_service_networking_connection" "replica-private-vpc-db-connection" {
  network                 = var.vpc-network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private-ip-address.name]
}
resource "google_sql_database_instance" "wordpress-db" {
  name                = "${var.db-node-name}-${random_id.bucket_prefix.hex}"
  database_version    = var.db-version
  region              = var.region
  deletion_protection = var.deletion_protection
  depends_on          = [google_service_networking_connection.master-private-vpc-db-connection]
  settings {
    tier = var.tier
    ip_configuration {
      ipv4_enabled    = var.ipv4_enabled
      private_network = var.vpc-network.id
    }
    backup_configuration {
      binary_log_enabled = true
      enabled            = true
    }
  }
}
resource "google_sql_database_instance" "wordpress-db-replica" {
  name                 = "${var.db-node-name}-backup-${random_id.bucket_prefix.hex}"
  database_version     = var.db-version
  region               = var.region
  deletion_protection  = var.deletion_protection
  master_instance_name = google_sql_database_instance.wordpress-db.name
  depends_on           = [google_service_networking_connection.replica-private-vpc-db-connection]
  settings {
    tier = var.tier
    ip_configuration {
      ipv4_enabled    = var.ipv4_enabled
      private_network = var.vpc-network.id
    }
  }
  replica_configuration {
    failover_target = true
  }
}
resource "google_sql_database" "database" {
  name     = var.db-name
  instance = google_sql_database_instance.wordpress-db.name
}

resource "google_sql_user" "users" {
  name       = var.db-username
  instance   = google_sql_database_instance.wordpress-db.name
  host       = "%"
  password   = var.db-password
  depends_on = [google_sql_database_instance.wordpress-db]
}