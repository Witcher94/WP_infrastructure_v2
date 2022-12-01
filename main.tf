module "vpc" {
  source                                 = "./modules/vpc"
  name                                   = var.name
  description                            = var.description
  auto_create_subnetworks                = var.auto_create_subnetworks
  delete_default_internet_gateway_routes = var.delete_default_internet_gateway_routes
  routing_mode                           = var.routing_mode
  mtu                                    = var.mtu
  allocate_option                        = var.allocate_option
  ip_ranges_to_nat                       = var.ip_ranges_to_nat
}
module "subnet" {
  source  = "./modules/subnets"
  network = module.vpc.network
  subnets = var.subnets
}
module "firewall" {
  source  = "./modules/firewall"
  network = module.vpc.network
  rules   = var.rules
}
module "service-account" {
  source     = "./modules/service-account"
  project    = local.project
  account_id = var.account_id
  members    = var.members
  roles      = var.roles
}
module "secret-manager" {
  source      = "./modules/secret-manager"
  length      = var.length
  min_upper   = var.min_upper
  min_lower   = var.min_lower
  min_numeric = var.min_numeric
  min_special = var.min_special
  secret_id   = var.secret_id
  labels      = var.labels
}
module "cloud-sql" {
  source              = "./modules/cloud_sql"
  vpc-network         = module.vpc.network
  db-node-name        = var.name
  db-version          = var.db-version
  region              = local.region
  deletion_protection = var.deletion_protection
  tier                = var.tier
  ipv4_enabled        = var.ipv4_enabled
  db-name             = var.db-name
  db-username         = var.db-username
  db-password         = module.secret-manager.secret.id
}
module "cloud-storage" {
  source          = "./modules/cloud_storage"
  prefix          = module.cloud-sql.prefix
  bucket-name     = var.name
  region          = local.region
  service-account = module.service-account.service-account
  depends_on      = [module.cloud-sql]
}
resource "local_file" "sa-keyfile" {
  filename = "../${var.account_file}"
  content  = base64decode(module.service-account.service-account-key)
}
module "packer" {
  source              = "./modules/packer"
  account-file        = "../${var.account_file}"
  subnet              = module.subnet.subnets["private"].id
  project             = local.project
  zone                = local.zone
  image-name          = var.image-name
  source-image        = var.source-image
  ssh-username        = local.username
  packer-machine-type = var.packer-machine-type
  playbook            = var.playbook
  ansible-extra-vars  = "bucket=${module.cloud-storage.bucket} db_ip=${module.cloud-sql.db-ip} password=${module.secret-manager.secret.id}"
}
module "instance-group" {
  source                = "./modules/instance-group"
  name                  = var.name
  machine-type          = var.instance-machine-type
  source-image          = var.image-name
  subnetwork            = module.subnet.subnets["private"].id
  service-account-email = module.service-account.service-account
  instance-tags         = var.ig-tags
  bucket                = module.cloud-storage.bucket
  startup-script-path   = var.startup-path
  ig-zones              = local.ig-zones
  region                = local.region
  named-port-name       = var.port-name
  named-port-number     = var.port-number
  interval              = var.interval
  timeout               = var.timeout
  healthy               = var.healthy
  unhealthy             = var.unhealthy
  depends_on            = [module.packer]
}