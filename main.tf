module "vpc" {
  source = "./modules/vpc"
  network_name = "wp-network"
}
module "subnet" {
  source = "./modules/subnets"
  network = module.vpc.network
  subnets = [

  ]
}
