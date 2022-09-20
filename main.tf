module "vpc" {
  source       = "./modules/vpc"
  network_name = "wp-network"
}
module "subnet" {
  source  = "./modules/subnets"
  network = module.vpc.network
  subnets = {
  private ={
    ip = "10.10.10.0/24"
    region = "${local.region}"
    name = "private"
  } ,
  public={
    ip = "10.10.20.0/24"
    region = "${local.region}"
    name = "public"
    }
  }
}

