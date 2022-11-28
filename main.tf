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
  members    = [""]
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
  db-password         = module.secret-manager.secret
}
module "cloud-storage" {
  source          = "./modules/cloud_storage"
  prefix          = module.cloud-sql.prefix
  bucket-name     = var.name
  region          = local.region
  service-account = module.service-account.service-account
  depends_on      = [module.cloud-sql]
}
module "packer" {
  source              = "./modules/packer"
  subnet              = module.subnet.subnets["private"].id
  project             = local.project
  zone                = "${local.region}-c"
  image-name          = var.image-name
  source-image        = var.tier
  ssh-username        = local.username
  packer-machine-type = var.tier
  playbook            = var.playbook-path
  ansible-extra-vars  = "bucket=${module.cloud-storage.bucket} db_ip=${module.cloud-sql.db-ip} password=${module.secret-manager.secret}"
}