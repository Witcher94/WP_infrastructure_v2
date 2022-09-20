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
      subnet_flow_logs             = "false"
      subnet_flow_logs_interval    = "INTERVAL_10_MIN"
      subnet_flow_logs_sampling    = 0.7
      subnet_flow_logs_metadata    = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_filter_expr = "true"
    }
  }
}

