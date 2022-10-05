module "vpc" {
  source       = "./modules/vpc"
  network_name = "wp-network"
}
module "subnet" {
  source  = "./modules/subnets"
  network = module.vpc.network
  subnets = {
    private = {
      ip     = "10.10.10.0/24"
      region = "${local.region}"
      name   = "private"
    },
    public = {
      ip                           = "10.10.20.0/24"
      region                       = "${local.region}"
      name                         = "public"
      subnet_flow_logs             = "true"
      subnet_flow_logs_interval    = "INTERVAL_10_MIN"
      subnet_flow_logs_sampling    = 0.7
      subnet_flow_logs_metadata    = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_filter_expr = "true"
    }
  }
}
module "firewall" {
  source  = "./modules/firewall"
  network = module.vpc.network
  rules = {
    private = {
      name                    = "allow-ssh-ingress"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = ["0.0.0.0/0"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = null
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
      deny = []
    }
  }
}

